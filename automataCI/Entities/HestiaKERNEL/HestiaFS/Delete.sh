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
HestiaKERNEL/HestiaBOOLEANS/Is-Boolean.sh
HestiaKERNEL/HestiaBOOLEANS/Is-True.sh
HestiaKERNEL/HestiaFS/Is-Exist.sh
HestiaKERNEL/HestiaFS/Is-Filepath.sh
HestiaKERNEL/HestiaOS/Is-Command-Available.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Delete() {
        #____path="$1"
        #____recursive_mode="$2"


        # validate input
        case "$(HestiaFS_Is_Filepath "$1" "true")" in
        $HestiaSIGNALS_OK)
                if [ $(HestiaFS_Is_Exist "$1") -ne $HestiaSIGNALS_OK ]; then
                        return $HestiaSIGNALS_DATA_DEAD
                fi
                ;;
        $HestiaSIGNALS_DATA_EMPTY)
                return $HestiaSIGNALS_DATA_EMPTY
                ;;
        *)
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        esac

        if [ "$(HestiaOS_Is_Command_Available "rm")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_UNSUPPORTED
        fi

        if [ ! "$2" = "" ]; then
                if [ "$(HestiaBOOLEANS_Is_Boolean "$2")" -ne $HestiaSIGNALS_OK ]; then
                        return $HestiaSIGNALS_DATA_INVALID
                fi
        fi


        # execute
        if [ "$(HestiaBOOLEANS_Is_True "$2")" -eq $HestiaSIGNALS_OK ]; then
                rm --force --recursive "$1" 2> /dev/null
        else
                rm --force "$1" 2> /dev/null
        fi
        if [ $? -ne 0 ]; then
                sync "$1" 2>/dev/null
                return $HestiaSIGNALS_BAD_EXEC
        fi
        sync "$1" 2> /dev/null


        # execute
        return $HestiaSIGNALS_OK
}




# report import status
return 0
