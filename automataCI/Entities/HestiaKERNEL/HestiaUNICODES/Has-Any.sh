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




HestiaUNICODES_Has_Any() {
        #____content_unicode="$1"
        #____charset_unicode="$2"


        # validate input
        if [ $(HestiaUNICODES_Is_Unicode "$1") -ne $HestiaSIGNALS_OK ]; then
                printf -- "%s" "$HestiaSIGNALS_ENTITY_EMPTY"
                return $HestiaSIGNALS_ENTITY_EMPTY
        fi

        if [ $(HestiaUNICODES_Is_Unicode "$2") -ne $HestiaSIGNALS_OK ]; then
                printf -- "%s" "$HestiaSIGNALS_DATA_EMPTY"
                return $HestiaSIGNALS_DATA_EMPTY
        fi


        # execute
        ____content_unicode="$1"
        while [ ! "$____content_unicode" = "" ]; do
                # get current character
                ____current="${____content_unicode%%, *}"
                ____content_unicode="${____content_unicode#"$____current"}"
                if [ "${____content_unicode%"${____content_unicode#?}"}" = "," ]; then
                        ____content_unicode="${____content_unicode#, }"
                fi

                # get char from charset character
                ____charset_unicode="$2"
                ____mismatched=0 ## assume mismatched by default
                while [ ! "$____charset_unicode" = "" ]; do
                        # get target character
                        ____char="${____charset_unicode%%, *}"
                        ____charset_unicode="${____charset_unicode#"$____char"}"
                        if [ "${____charset_unicode%"${____charset_unicode#?}"}" = "," ]; then
                                ____charset_unicode="${____charset_unicode#, }"
                        fi

                        if [ "$____current" = "$____char" ]; then
                                ____charset_unicode=""
                                ____mismatched=1
                                break # exit early from O(m^2) timing ASAP
                        fi
                done

                if [ $____mismatched -ne 0 ]; then
                        # It's a match
                        printf -- "%d" "$HestiaSIGNALS_OK"
                        return $HestiaSIGNALS_OK
                fi
        done


        # report status
        printf -- "%d" "$HestiaSIGNALS_DATA_MISMATCHED"
        return $HestiaSIGNALS_DATA_MISMATCHED
}




# report import status
return 0
