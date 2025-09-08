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
HestiaKERNEL/HestiaUNICODES/Is-Unicode.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_Index_Any_Right() {
        #____content_unicode="$1"
        #____target_unicode="$2"


        # validate input
        if [ "$(HestiaUNICODES_Is_Unicode "$1")" -ne $HestiaSIGNALS_OK ]; then
                printf -- "%d" "-1"
                return $HestiaSIGNALS_ENTITY_EMPTY
        fi

        if [ "$(HestiaUNICODES_Is_Unicode "$2")" -ne $HestiaSIGNALS_OK ]; then
                printf -- "%d" "-1"
                return $HestiaSIGNALS_DATA_EMPTY
        fi


        # execute
        ____scan_index="-1"
        ____content_unicode="$1"
        ____target_unicode="$2"
        ____index=0
        ____is_scanning=0
        while [ ! "$____content_unicode" = "" ]; do
                # get current character
                ____current="${____content_unicode##*, }"
                ____content_unicode="${____content_unicode%"$____current"}"
                if [ "${____content_unicode#"${____content_unicode%?}"}" = " " ]; then
                        ____content_unicode="${____content_unicode%, }"
                fi

                # continue counting content length if scan is completed
                if [ $____is_scanning -ne 0 ]; then
                        ____index=$(($____index + 1))
                        continue
                fi

                # get char from target character
                ____target_unicode="$2"
                ____mismatched=0 ## assume mismatched by default
                while [ ! "$____target_unicode" = "" ]; do
                        ____char="${____target_unicode%%, *}"
                        ____target_unicode="${____target_unicode#"$____char"}"
                        if [ "${____target_unicode%"${____target_unicode#?}"}" = "," ]; then
                                ____target_unicode="${____target_unicode#, }"
                        fi

                        if [ "$____current" = "$____char" ]; then
                                # exit early from O(m^2) timing ASAP
                                ____target_unicode=""
                                ____mismatched=1
                                break
                        fi
                done

                # bail if mismatched
                if [ $____mismatched -eq 0 ]; then
                        ____scan_index=-1
                        ____index=$(($____index + 1))
                        continue
                fi

                # it's a match - set ____scan_index if available
                if [ $____scan_index -lt 0 ]; then
                        ____scan_index=$____index
                        ____is_scanning=1
                fi

                # more characters - increase index and continue
                ____index=$(($____index + 1))
        done
        unset ____current \
                ____char \
                ____is_scanning \
                ____mismatched \
                ____target_unicode \
                ____content_unicode


        # report early if the scan is negative
        if [ $____scan_index -lt 0 ]; then
                printf -- "%d" "-1"
                unset ____index ____scan_index
                return $HestiaSIGNALS_OK
        fi


        # convert right-to-left index back to left-to-right index for
        # programming language's consistency
        ____scan_index="$(($____index - $____scan_index - 1))"
        printf -- "%d" "$____scan_index"
        unset ____index ____scan_index


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
