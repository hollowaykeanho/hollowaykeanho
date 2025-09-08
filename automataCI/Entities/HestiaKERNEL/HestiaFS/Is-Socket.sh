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




# IMPORTANT NOTES
#       (1) This function is creatd for inter-language compatibility. In POSIX
#           Shell, you should use 'if [ -S "path" ]; then' checker directly
#           for performance.
#       (2) Otherwise, this function offers consistency in case of external
#           Shell interpreter made some drastic changes.
HestiaFS_Is_Socket() {
        #____target="$1"


        # validate input
        if [ "$1" = "" ]; then
                printf -- "%d" "$HestiaSIGNALS_DATA_EMPTY"
                return $HestiaSIGNALS_DATA_EMPTY
        fi


        # execute
        if [ -S "$1" ]; then
                printf -- "%d" "$HestiaSIGNALS_OK"
                return $HestiaSIGNALS_OK
        fi


        # report status
        printf -- "%d" "$HestiaSIGNALS_DATA_BAD"
        return $HestiaSIGNALS_DATA_BAD
}




# report import status
return 0
