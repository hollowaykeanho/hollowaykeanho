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
HestiaKERNEL/HestiaBOOLEANS/Is-True.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaBOOLEANS_Is_False() {
        #____input="$1"


        # execute
        case "$(HestiaBOOLEANS_Is_True "$1")" in
        $HestiaSIGNALS_DATA_EMPTY)
                printf -- "%s" "$HestiaSIGNALS_DATA_EMPTY"
                return $HestiaSIGNALS_DATA_EMPTY
                ;;
        $HestiaSIGNALS_OK)
                printf -- "%s" "$HestiaSIGNALS_DATA_INVALID"
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        $HestiaSIGNALS_DATA_INVALID)
                printf -- "%s" "$HestiaSIGNALS_OK"
                return $HestiaSIGNALS_OK
                ;;
        *)
                printf -- "%s" "$HestiaSIGNALS_BAD_EXEC"
                return $HestiaSIGNALS_BAD_EXEC
                ;;
        esac
}




# report import status
return 0
