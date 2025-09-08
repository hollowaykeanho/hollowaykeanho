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
HestiaKERNEL/HestiaFS/Get-Symbolic-Link-Source.sh
HestiaKERNEL/HestiaFS/Is-Directory.sh
HestiaKERNEL/HestiaFS/Is-Exist.sh
HestiaKERNEL/HestiaFS/Is-Symbolic-Link.sh
HestiaKERNEL/HestiaNUMBERS/Is-Positive.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_List() {
        #____path_directory="$1"
        #____recursive_level="$2"
        #____resolve_symbolic_link="$3"


        # validate paths
        if [ "$1" = "" ]; then
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ "$(HestiaFS_Is_Directory "$1")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_DATA_IS_NOT_DIRECTORY
        fi

        if [ ! "$2" = "" ] &&
        [ "$(HestiaNUMBERS_Is_Positive "$2")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_DATA_INVALID
        fi

        if [ ! "$3" = "" ]; then
                case "$(HestiaBOOLEANS_Is_Boolean "$3")" in
                $HestiaSIGNALS_DATA_INVALID)
                        return $HestiaSIGNALS_DATA_INVALID
                        ;;
                *)
                        ;;
                esac
        fi


        # execute
        for ____item in "${1}/"*; do
                if [ "$(HestiaFS_Is_Exist "$1")" -ne $HestiaSIGNALS_OK ]; then
                        continue
                fi

                if [ "$(HestiaFS_Is_Directory "$1")" -eq $HestiaSIGNALS_OK ]; then
                        if [ ! "$2" = "" ] && [ "$2" -gt 0 ]; then
                                printf -- "%s\n" "$____item"
                                HestiaFS_List "$____item" "$(($2 - 1))" "$3"
                                continue
                        fi
                elif [ "$(HestiaFS_Is_Symbolic_Link "$1")" -eq $HestiaSIGNALS_OK ] &&
                [ "$(HestiaBOOLEANS_Is_True "$3")" -eq $HestiaSIGNALS_OK ]; then
                        ____item_source="$(HestiaFS_Get_Symbolic_Link_Source "$____item")"
                        if [ "$____item_source" = "" ]; then
                                unset ____item_source
                                continue
                        fi

                        if [ "$(HestiaFS_Is_Directory "$____item_source")" -eq $HestiaSIGNALS_OK ]; then
                                if [ ! "$2" = "" ] && [ "$2" -gt 0 ]; then
                                        printf -- "%s\n" "$____item"
                                        HestiaFS_List \
                                                "$____item_source" \
                                                "$(($2 - 1))" \
                                                "$3"
                                        continue
                                fi
                        fi

                        printf -- "%s" "\
${____item}
	${____item_source}"
                        unset ____item_source
                        continue
                fi

                printf -- "%s\n" "$____item"
        done

        if [ $? -ne 0 ]; then
                return $HestiaSIGNALS_BAD_EXEC
        fi


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
