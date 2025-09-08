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




HestiaFS_Is_Filepath() {
        #____filepath="$1"
        #____accept_relative_path="$2"          # 'true' to accept


        # execute
        case "$1" in
        "")
                # empty string
                printf -- "%s" "$HestiaSIGNALS_DATA_EMPTY"
                return $HestiaSIGNALS_DATA_EMPTY
                ;;
        *"\0"*)
                # no null byte
                printf -- "%s" "$HestiaSIGNALS_DATA_INVALID"
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        *"//"*)
                # only single path separator
                printf -- "%s" "$HestiaSIGNALS_DATA_INVALID"
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        ".")
                # relative current directory
                if [ $(HestiaBOOLEANS_Is_True "$2") -eq $HestiaSIGNALS_OK ]; then
                        printf -- "%s" "$HestiaSIGNALS_OK"
                        return $HestiaSIGNALS_OK
                fi

                printf -- "%s" "$HestiaSIGNALS_DATA_INVALID"
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        "..")
                # relative parent directory
                if [ $(HestiaBOOLEANS_Is_True "$2") -eq $HestiaSIGNALS_OK ]; then
                        printf -- "%s" "$HestiaSIGNALS_OK"
                        return $HestiaSIGNALS_OK
                fi

                printf -- "%s" "$HestiaSIGNALS_DATA_INVALID"
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        "./"*)
                # start with relative current directory
                if [ $(HestiaBOOLEANS_Is_True "$2") -eq $HestiaSIGNALS_OK ]; then
                        printf -- "%s" "$HestiaSIGNALS_OK"
                        return $HestiaSIGNALS_OK
                fi

                printf -- "%s" "$HestiaSIGNALS_DATA_INVALID"
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        "../"*)
                # start with relative parent directory
                if [ $(HestiaBOOLEANS_Is_True "$2") -eq $HestiaSIGNALS_OK ]; then
                        printf -- "%s" "$HestiaSIGNALS_OK"
                        return $HestiaSIGNALS_OK
                fi

                printf -- "%s" "$HestiaSIGNALS_DATA_INVALID"
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        *)
                printf -- "%s" "$HestiaSIGNALS_OK"
                return $HestiaSIGNALS_OK
                ;;
        esac
}




# report import status
return 0
