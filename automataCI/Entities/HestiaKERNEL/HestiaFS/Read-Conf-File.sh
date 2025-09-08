#!/bin/sh
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
# Copyright 2023 (Holloway) Chew, Kean Ho <hollowaykeanho@gmail.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho's Liberal License (the 'License').
# You must comply with the license to use the content. Get the License at:
#
# https://doi.org/10.5281/zenodo.13770769
#
# You MUST ensure any interaction with the content STRICTLY COMPLIES with
# the permissions and limitations set forth in the license.




# import required libraries
. "${LIBS_HESTIA}/HestiaKERNEL/Init.sh" 2> /dev/null
command -v Hestia_Import > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf -- "%s" "\
E: Missing 'HestiaKERNEL/Init.sh' - Hestia_Import function.
E: Unable to Proceed.
E: Bailing Out...

"
        exit 1
fi

Hestia_Import "\
HestiaKERNEL/HestiaFS/Is-Exist.sh
HestiaKERNEL/HestiaOS/Update-Environment-Variable.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaSTRINGS/Trim-Whitespace-Left.sh
HestiaKERNEL/HestiaSTRINGS/Trim-Whitespace-Right.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Read_Conf_File() {
        #____filepath="$1"
        #____name_variable="$2"


        # validate target path
        if [ "$1" = "" ]; then
                return $HestiaSIGNALS_ENTITY_EMPTY
        fi

        if [ "$(HestiaFS_Is_Exist "$1")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_ENTITY_INVALID
        fi


        # parse by reading line by line
        ____is_parsing=""
        ____key=""
        ____value=""
        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                # check for opening key
                if [ "$____is_parsing" = "" ]; then
                        ____line="${____line%%#*}"
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ "${____line#*=}" = "$____line" ]; then
                                # line is not key=value
                                continue
                        fi

                        if [ "$____key" = "" ]; then
                                ____key="$( \
                                         HestiaSTRINGS_Trim_Whitespace_Right \
                                                "${____line%%=*}" \
                                )"

                                if [ ! "$2" = "" ] &&
                                [ ! "$____key" = "$2" ]; then
                                        # seeker key mismatched
                                        unset ____key
                                        continue
                                fi
                        fi

                        ____line="$( \
                                HestiaSTRINGS_Trim_Whitespace_Left \
                                        "${____line#*=}" \
                        )"
                        case "${____line%%"${____line#?}"}" in
                        "\"")
                                # double quote = single/multi line(s)
                                ____is_parsing="\""
                                ____line="${____line#?}"
                                ;;
                        "\'")
                                # single quote = single/multi line(s)
                                ____is_parsing="'"
                                ____line="${____line#?}"
                                ;;
                        *)
                                # no quote = single line value
                                ____is_parsing="end"
                                ____value="$____line"
                                ;;
                        esac
                fi

                # check ending in case of multi-line value
                case "$____is_parsing" in
                "\"")
                        if [ ! "${____line%"\""}" = "$____line" ] &&
                        [ "${____line%"\\\""}" = "$____line" ]; then
                                ____value="${____value}${____line%"\""}\n"
                                ____is_parsing="end"
                        fi
                        ;;
                "'")
                        if [ ! "${____line%"'"}" = "$____line" ] &&
                        [ "${____line%"\\'"}" = "$____line" ]; then
                                ____value="${____value}${____line%"\""}\n"
                                ____is_parsing="end"
                        fi
                        ;;
                *)
                        ;;
                esac

                # proceed to next step
                case "$____is_parsing" in
                end)
                        HestiaOS_Update_Environment_Variable \
                                "$____key" \
                                "$(printf -- "%b" "$____value")"
                        unset ____key ____value ____is_parsing
                        continue
                        ;;
                "\""|"'")
                        # still continue parsing multi-line values
                        ____value="${____value}${____line}\n"
                        ;;
                *)
                        ;;
                esac
        done < "$1"
        IFS="$____old_IFS"

        unset ____key ____value ____is_parsing ____line ____old_IFS


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
