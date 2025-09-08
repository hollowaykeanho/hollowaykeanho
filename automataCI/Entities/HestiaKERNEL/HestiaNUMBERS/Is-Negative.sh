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
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaNUMBERS_Is_Negative() {
        #___input="$1"


        # execute
        if [ "$1" = "" ]; then
                printf -- "%d" $HestiaSIGNALS_DATA_EMPTY
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ "$(HestiaNUMBERS_Is_Number "$1")" -ne $HestiaSIGNALS_OK ]; then
                printf -- "%d" $HestiaSIGNALS_DATA_INVALID
                return $HestiaSIGNALS_DATA_INVALID
        fi

        if [ "$1" -ge 0 ]; then
                printf -- "%d" $HestiaSIGNALS_DATA_INVALID
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # report status
        printf -- "%d" $HestiaSIGNALS_OK
        return $HestiaSIGNALS_OK
}




# report import status
return 0
