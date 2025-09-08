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
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_To_Filepath_UNIX() {
        #____filepath="$1"


        # validate input
        if [ "$1" = "" ]; then
                printf -- "%s" ""
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ "${1##*"/"}" = "$1" ] && [ "${1##*"\\"}" = "$1" ]; then
                # no directory pathing at all - return as it is
                printf -- "%s" "$1"
                return $HestiaSIGNALS_OK
        fi


        # execute
        ____output=""
        ____sample="$1"
        ____is_cancel=false
        ____previous=""
        ____type=""
        ____mixed_restarted=false
        while [ -n "$____sample" ]; do
                ____char="${____sample%%"${____sample#?}"}"
                ____sample="${____sample#"$____char"}"

                case "$____char" in
                "/")
                        # unix separator
                        if [ "$____type" = "" ]; then
                                ____type="unix"
                        elif [ "$____type" = "windows" ]; then
                                ____type="mixed"
                        fi

                        if [ "$____is_cancel" = "true" ]; then
                                ____is_cancel=false
                        fi

                        if [ ! "$____previous" = "\\" ]; then
                                ____output="${____output}/"
                        fi
                        ____previous="\\"
                        ;;
                "\\")
                        if [ "$____type" = "" ]; then
                                ____type="windows"
                        elif [ "$____type" = "unix" ]; then
                                ____type="mixed"
                        fi

                        if [ "$____is_cancel" = "false" ]; then
                                ____is_cancel=true
                                continue
                        fi

                        # it's '//' and should be treated as separator
                        ____is_cancel=false
                        ____output="${____output}/"
                        ____previous="\\"
                        ;;
                *)
                        if [ "$____is_cancel" = "true" ]; then
                                ____is_cancel=false

                                if [ "$____type" = "mixed" ]; then
                                        if [ "$____mixed_restarted" = "false" ]; then
                                                # need to restart the scan again
                                                ____output=""
                                                ____sample="$1"
                                                ____mixed_restarted=true
                                                ____previous=""
                                                continue
                                        fi
                                else
                                        ____output="${____output}/"
                                fi
                        fi

                        ____output="${____output}${____char}"
                        ____previous="$____char"
                        ;;
                esac
        done
        unset ____char \
                ____mixed_restarted \
                ____type \
                ____previous \
                ____is_cancel \
                ____sample


        # all good - output now
        printf -- "%s" "$____output"
        if [ $? -ne 0 ]; then
                unset ____output
                return $HestiaSIGNALS_BAD_EXEC
        fi
        unset ____output


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
