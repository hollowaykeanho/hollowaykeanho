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
HestiaKERNEL/HestiaFS/Codes-Encoder.sh
HestiaKERNEL/HestiaFS/Copy.sh
HestiaKERNEL/HestiaFS/Delete.sh
HestiaKERNEL/HestiaFS/Get-Symbolic-Link-Source.sh
HestiaKERNEL/HestiaFS/Is-Exist.sh
HestiaKERNEL/HestiaFS/Is-File.sh
HestiaKERNEL/HestiaFS/Is-Filepath.sh
HestiaKERNEL/HestiaFS/Is-Symbolic-Link.sh
HestiaKERNEL/HestiaFS/Move.sh
HestiaKERNEL/HestiaLISTS/Is-Array-Byte.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaSTRINGS/Is-String.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Append_File() {
        #____filepath="$1"
        #____content="$2"
        #____encoder_type="$3"


        # validate target path
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

        if [ "$(HestiaFS_Is_Exist "$1")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_ENTITY_MISSING
        fi

        if [ "$(HestiaFS_Is_File "$1")" -eq $HestiaSIGNALS_OK ]; then
                : # accepted
        elif [ "$(HestiaFS_Is_Symbolic_Link "$1")" -eq $HestiaSIGNALS_OK ]; then
                # get and check source file is a file
                ____target="$(HestiaFS_Get_Symbolic_Link_Source "$1")"
                if [ $? -ne $HestiaSIGNALS_OK ]; then
                        unset ____target
                        return $HestiaSIGNALS_ENTITY_INVALID
                fi

                if [ "$(HestiaFS_Is_File "$____target")" -ne $HestiaSIGNALS_OK ]; then
                        unset ____target
                        return $HestiaSIGNALS_ENTITY_INVALID
                fi
                unset ____target

                # accepted
        else
                return $HestiaSIGNALS_ENTITY_INVALID
        fi

        case "$3" in
        $HestiaFS_ENCODER_BYTE)
                if [ "$(HestiaLISTS_Is_Array_Byte "$2")" -ne $HestiaSIGNALS_OK ]; then
                        return $HestiaSIGNALS_DATA_INVALID
                fi
                ;;
        *)
                # assume string encoder
                if [ "$(HestiaSTRINGS_Is_String "$2")" -ne $HestiaSIGNALS_OK ]; then
                        return $HestiaSIGNALS_DATA_INVALID
                fi
                ;;
        esac


        # execute
        ## clean up existing workspace file
        HestiaFS_Delete "${1}.tmp"

        ## make a copy of the existing
        HestiaFS_Copy "${1}.tmp" "$1"
        if [ $? -ne 0 ]; then
                HestiaFS_Delete "${1}.tmp"
                return $HestiaSIGNALS_BAD_EXEC
        fi

        ## perform write
        case "$3" in
        $HestiaFS_ENCODER_BYTE)
                ____old_IFS="$IFS"
                while IFS='' read -r ____line || [ -n "$____line" ]; do
                        printf "\\$(printf '%03o' "$____line")" >> "${1}.tmp"
                        if [ $? -ne 0 ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS
                                HestiaFS_Delete "${1}.tmp"
                                return $HestiaSIGNALS_BAD_EXEC
                        fi
                done <<EOF
${2}
EOF
                IFS="$____old_IFS"
                unset ____line ____old_IFS
                ;;
        *)
                # write data text (default)
                printf -- "%s" "$2" >> "${1}.tmp"
                if [ $? -ne 0 ]; then
                        HestiaFS_Delete "${1}.tmp"
                        return $HestiaSIGNALS_BAD_EXEC
                fi

                sync
                ;;
        esac

        ## successful write - perform overwrite
        HestiaFS_Move "$1" "${1}.tmp"
        if [ $? -ne 0 ]; then
                HestiaFS_Delete "${1}.tmp"
                return $HestiaSIGNALS_BAD_EXEC
        fi


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
