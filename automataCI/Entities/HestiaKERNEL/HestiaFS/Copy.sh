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
HestiaKERNEL/HestiaFS/Is-Directory.sh
HestiaKERNEL/HestiaFS/Is-Exist.sh
HestiaKERNEL/HestiaFS/Is-File.sh
HestiaKERNEL/HestiaFS/Is-Filepath.sh
HestiaKERNEL/HestiaFS/Is-Symbolic-Link.sh
HestiaKERNEL/HestiaOS/Is-Command-Available.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Copy() {
        #____path_to="$1"
        #____path_from="$2"
        #____resolve_symbolic_link="$3"


        # validate inputs
        case "$(HestiaFS_Is_Filepath "$1" "true")" in
        $HestiaSIGNALS_OK)
                ;;
        $HestiaSIGNALS_DATA_EMPTY)
                return $HestiaSIGNALS_ENTITY_EMPTY
                ;;
        *)
                return $HestiaSIGNALS_ENTITY_INVALID
                ;;
        esac

        if [ "$(HestiaFS_Is_Exist "$1")" -eq $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_ENTITY_EXISTS
        fi

        if [ ! "${1%/*}" = "$1" ]; then
                if [ "$(HestiaFS_Is_Directory "${1%/*}")" -ne $HestiaSIGNALS_OK ]; then
                        return $HestiaSIGNALS_ENTITY_MISSING
                fi
        fi

        case "$(HestiaFS_Is_Filepath "$2" "true")" in
        $HestiaSIGNALS_OK)
                ;;
        $HestiaSIGNALS_DATA_EMPTY)
                return $HestiaSIGNALS_DATA_EMPTY
                ;;
        *)
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        esac

        if [ "$(HestiaFS_Is_Exist "$2")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_DATA_MISSING
        fi

        if [ ! "$3" = "" ]; then
                if [ "$(HestiaBOOLEANS_Is_Boolean "$3")" -ne $HestiaSIGNALS_OK ]; then
                        return $HestiaSIGNALS_DATA_INVALID
                fi
        fi

        if [ "$(HestiaOS_Is_Command_Available "cp")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_UNSUPPORTED
        fi


        # execute
        if [ "$(HestiaFS_Is_File "$2")" -eq $HestiaSIGNALS_OK ]; then
                cp "$2" "$1" 2> /dev/null
                if [ $? -ne 0 ]; then
                        return $HestiaSIGNALS_BAD_EXEC
                fi
        elif [ "$(HestiaFS_Is_Directory "$2")" -eq $HestiaSIGNALS_OK ]; then
                cp --recursive "$2" "$1" 2> /dev/null
                if [ $? -ne 0 ]; then
                        return $HestiaSIGNALS_BAD_EXEC
                fi
        elif [ "$(HestiaFS_Is_Symbolic_Link "$2")" -eq $HestiaSIGNALS_OK ]; then
                if [ "$(HestiaBOOLEANS_Is_True "$3")" -eq $HestiaSIGNALS_OK ]; then
                        cp --recursive --dereference "$2" "$1" 2> /dev/null
                else
                        cp --recursive "$2" "$1" 2> /dev/null
                fi
                if [ $? -ne 0 ]; then
                        return $HestiaSIGNALS_BAD_EXEC
                fi
        else
                return $HestiaSIGNALS_NOT_POSSIBLE
        fi


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
