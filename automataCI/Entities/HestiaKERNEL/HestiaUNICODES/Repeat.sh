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
HestiaKERNEL/HestiaNUMBERS/Is-Positive.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaUNICODES/Is-Unicode.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_Repeat() {
        #____content_unicode="$1"
        #____count="$2"


        # validate input
        if [ $(HestiaUNICODES_Is_Unicode "$1") -ne $HestiaSIGNALS_OK ]; then
                printf -- ""
                return $HestiaSIGNALS_ENTITY_EMPTY
        fi

        if [ $(HestiaNUMBERS_Is_Positive "$2") -ne $HestiaSIGNALS_OK ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # execute
        if [ "$2" -eq 0 ]; then
                printf -- "%s" "$1"
                return $HestiaSIGNALS_OK
        fi

        ____output=""
        ____count="$2"
        while [ $____count -gt 0 ]; do
                ____output="${____output}${1}, "
                ____count=$(( $____count - 1 ))
        done
        printf -- "%b" "${____output%, }"
        unset ____output ____count


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
