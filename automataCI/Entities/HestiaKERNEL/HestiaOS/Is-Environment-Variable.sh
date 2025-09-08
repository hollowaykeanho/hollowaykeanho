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
HestiaKERNEL/HestiaOS/Is-Command-Available.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaOS_Is_Environment_Variable() {
        #____input="$1"
        #____value="$2"


        # validate input
        case "$1" in
        "")
                printf -- "%s" "$HestiaSIGNALS_DATA_EMPTY"
                return $HestiaSIGNALS_DATA_EMPTY
                ;;
        *[!a-zA-Z0-9\_]*)
                printf -- "%s" "$HestiaSIGNALS_DATA_INVALID"
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        *)
                ;;
        esac

        if [ "$(HestiaOS_Is_Command_Available "export")" -ne $HestiaSIGNALS_OK ]; then
                printf -- "%s" "$HestiaSIGNALS_ENTITY_MISSING"
                return $HestiaSIGNALS_ENTITY_MISSING
        fi


        # execute
        ## try with direct export first to validate both name and value
        ## are really valid before we use the dangerous 'eval' command
        ____test_export="$( \
                export "${1}"="${2:-"internal_test_value"}" 2> /dev/null; \
                if [ $? -eq 0 ]; then \
                        printf -- "passed_internal_test"; \
                fi \
        )"
        unset "$1"
        if [ "$____test_export" = "passed_internal_test" ]; then
                unset ____test_export
                printf -- "%s" "$HestiaSIGNALS_OK"
                return $HestiaSIGNALS_OK
        fi
        unset ____test_export


        # report status
        printf -- "%s" "$HestiaSIGNALS_DATA_FAULTY"
        return $HestiaSIGNALS_DATA_FAULTY
}




# report import status
return 0
