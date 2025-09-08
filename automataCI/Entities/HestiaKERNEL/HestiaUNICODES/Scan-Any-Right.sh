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
HestiaKERNEL/HestiaNUMBERS/Is-Number.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaUNICODES/Is-Unicode.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_Scan_Any_Right() {
        #____content_unicode="$1"
        #____target_unicode="$2"
        #____count="$3"
        #____ignore="$4"


        # validate input
        if [ "$(HestiaUNICODES_Is_Unicode "$1")" -ne $HestiaSIGNALS_OK ]; then
                printf -- ""
                return $HestiaSIGNALS_ENTITY_EMPTY
        fi

        if [ "$(HestiaUNICODES_Is_Unicode "$2")" -ne $HestiaSIGNALS_OK ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        ____count=-1
        if [ "$(HestiaNUMBERS_Is_Number "$3")" -eq $HestiaSIGNALS_OK ]; then
                ____count="$3"
        fi

        ____ignore=-1
        if [ "$(HestiaNUMBERS_Is_Number "$4")" -eq $HestiaSIGNALS_OK ]; then
                ____ignore="$4"
        fi


        # execute
        ____scan_index=-1
        ____list_index=""
        ____content_unicode="$1"
        ____index=0
        ____is_scanning=0
        while [ ! "$____content_unicode" = "" ]; do
                # get current character
                ____current="${____content_unicode##*, }"
                ____content_unicode="${____content_unicode%"$____current"}"
                if [ "${____content_unicode#"${____content_unicode%?}"}" = " " ]; then
                        ____content_unicode="${____content_unicode%, }"
                fi


                # continue the count
                if [ $____is_scanning -ne 0 ]; then
                        ____index=$(($____index + 1))
                        continue
                fi


                # get char from target character
                ____target_unicode="$2"
                ____scan_index=-1
                while [ ! "$____target_unicode" = "" ]; do
                        ____target="${____target_unicode##*, }"
                        ____target_unicode="${____target_unicode%"$____target"}"
                        if [ "${____target_unicode#"${____target_unicode%?}"}" = " " ]; then
                                ____target_unicode="${____target_unicode%, }"
                        fi

                        if [ "$____current" = "$____target" ]; then
                                ____target_unicode=""
                                ____scan_index=$____index
                                break # exit early from O(m^2) timing ASAP
                        fi
                done


                # handle matches when available
                if [ $____scan_index -ge 0 ]; then
                        if [ $____ignore -le 0 ]; then
                                ____list_index="${____scan_index}, ${____list_index}"
                                if [ $____count -gt 0 ]; then
                                        ____count=$(($____count - 1))
                                        if [ $____count -le 0 ]; then
                                                ____is_scanning=1
                                                ____index=$(($____index + 1))
                                                continue
                                        fi
                                fi
                        else
                                ____ignore=$(($____ignore - 1))
                        fi

                        ____scan_index=-1
                fi


                # more characters - increase index and continue
                ____index=$(($____index + 1))
        done
        unset ____count \
                ____ignore \
                ____scan_index \
                ____content_unicode \
                ____is_scanning \
                ____current \
                ____target_unicode \
                ____target


        # report early if the scan is negative
        if [ "$____list_index" = "" ]; then
                printf -- ""
                unset ____list_index
                return $HestiaSIGNALS_OK
        fi


        # convert right-to-left index back to left-to-right index for
        # programming language's consistency
        ____list_output=""
        ____list_index="${____list_index%, }"
        while [ ! "$____list_index" = "" ]; do
                ____current="${____list_index##*, }"
                ____list_index="${____list_index%"$____current"}"
                if [ "${____list_index#"${____list_index%?}"}" = " " ]; then
                        ____list_index="${____list_index%, }"
                fi

                ____current="$(($____index - $____current - 1))"
                ____list_output="${____list_output}${____current}\n"
        done
        printf -- "%b" "${____list_output%"\n"}"
        unset ____current ____index ____list_output ____list_index


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
