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




HestiaUNICODES_Trim_Left() {
        #____content_unicode="$1"
        #____target_unicode="$2"


        # validate input
        if [ $(HestiaUNICODES_Is_Unicode "$1") -ne $HestiaSIGNALS_OK ]; then
                printf -- "%s" "$1"
                return $HestiaSIGNALS_ENTITY_EMPTY
        fi

        if [ $(HestiaUNICODES_Is_Unicode "$2") -ne $HestiaSIGNALS_OK ]; then
                printf -- "%s" "$1"
                return $HestiaSIGNALS_DATA_EMPTY
        fi


        # execute
        ____content_unicode="$1"
        ____target_unicode="$2"
        while [ ! "$____target_unicode" = "" ]; do
                # get current character
                ____current="${____content_unicode%%, *}"
                ____content_unicode="${____content_unicode#"$____current"}"
                if [ "${____content_unicode%"${____content_unicode#?}"}" = "," ]; then
                        ____content_unicode="${____content_unicode#, }"
                fi


                # get target character
                ____target="${____target_unicode%%, *}"
                ____target_unicode="${____target_unicode#"$____target"}"
                if [ "${____target_unicode%"${____target_unicode#?}"}" = "," ]; then
                        ____target_unicode="${____target_unicode#, }"
                fi


                # bail if mismatched
                if [ "$____current" != "$____target" ] ||
                ([ "$____content_unicode" = "" ] && [ ! "$____target_unicode" = "" ]); then
                        printf -- "%s" "$1"
                        unset ____current \
                                ____target \
                                ____content_unicode \
                                ____target_unicode
                        return $HestiaSIGNALS_OK
                fi
        done
        unset ____current ____target ____target_unicode

        printf -- "%s" "${____content_unicode%, }"
        unset ____content_unicode


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
