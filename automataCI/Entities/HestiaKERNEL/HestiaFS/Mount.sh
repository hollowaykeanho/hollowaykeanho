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
HestiaKERNEL/HestiaFS/Is-Mounted-To.sh
HestiaKERNEL/HestiaOS/Is-Command-Available.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Mount() {
        #____path_dest="$1"
        #____path_source="$2"
        #____bind="$3"


        # validate inputs
        HestiaFS_Is_Mounted_To "$1" "$2" > /dev/null
        case $? in
        $HestiaSIGNALS_OK)
                # already mounted
                return $HestiaSIGNALS_OK
                ;;
        $HestiaSIGNALS_ENTITY_EMPTY)
                # dest path is empty
                return $HestiaSIGNALS_ENTITY_EMPTY
                ;;
        $HestiaSIGNALS_ENTITY_INVALID)
                # dest path is invalid
                return $HestiaSIGNALS_ENTITY_INVALID
                ;;
        $HestiaSIGNALS_DATA_EMPTY)
                # source path is empty
                return $HestiaSIGNALS_DATA_EMPTY
                ;;
        $HestiaSIGNALS_DATA_INVALID)
                # source path is invalid
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        $HestiaSIGNALS_UNSUPPORTED)
                # on unknown OS - cannot operate at all
                return $HestiaSIGNALS_UNSUPPORTED
                ;;
        $HestiaSIGNALS_DATA_MISMATCHED)
                # already mounted but not from source
                return $HestiaSIGNALS_DATA_MISMATCHED
                ;;
        $HestiaSIGNALS_DATA_REMOVED)
                # not mounted - great
                ;;
        *)
                # unforseen errors
                return $HestiaSIGNALS_BAD_EXCHANGE
                ;;
        esac

        if [ "$(HestiaOS_Is_Command_Available "mount")" -ne $HestiaSIGNALS_OK ]; then
                # on unknown OS - cannot operate at all
                return $HestiaSIGNALS_UNSUPPORTED
        fi


        # execute
        if [ "$(HestiaBOOLEANS_Is_True "$3")" -eq $HestiaSIGNALS_OK ]; then
                mount --bind "$2" "$1" 2> /dev/null
        else
                mount "$2" "$1" 2> /dev/null
        fi
        if [ $? -ne 0 ]; then
                return $HestiaSIGNALS_BAD_EXEC
        fi


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
