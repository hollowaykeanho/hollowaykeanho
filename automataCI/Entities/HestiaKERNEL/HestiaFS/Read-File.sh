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
HestiaKERNEL/HestiaFS/Is-Exist.sh
HestiaKERNEL/HestiaNUMBERS/Is-Positive.sh
HestiaKERNEL/HestiaOS/Is-Command-Available.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Read_File() {
        #____filepath="$1"
        #____processor_function="$2"
        #____encoder="$3"
        #____text_separator_OR_byte_chunk_capacity="$4"


        # validate inputs
        if [ "$1" = "" ]; then
                return $HestiaSIGNALS_ENTITY_EMPTY
        fi

        if [ "$(HestiaFS_Is_Exist "$1")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_ENTITY_INVALID
        fi

        if [ "$(HestiaOS_Is_Command_Available "$2")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_ENTITY_MISSING
        fi

        case "$3" in
        $HestiaFS_ENCODER_BYTE)
                if [ "$(HestiaNUMBERS_Is_Positive "${4:-4096}")" -ne $HestiaSIGNALS_OK ]; then
                        return $HestiaSIGNALS_DATA_INVALID
                fi

                if [ "${4:-4096}" -le 0 ]; then
                        return $HestiaSIGNALS_DATA_INVALID
                fi
                ;;
        *)
                ;;
        esac


        # execute
        case "$3" in
        $HestiaFS_ENCODER_BYTE)
                if [ "$(HestiaOS_Is_Command_Available "od")" -ne $HestiaSIGNALS_OK ]; then
                        return $HestiaSIGNALS_UNSUPPORTED
                fi

                ____hestiafs_read_count=0
                ____old_IFS="$IFS"
                while true; do
                        ____hestiafs_read_chunks="$(od --address-radix=n \
                                --format=x1 \
                                --skip-bytes=$(( \
                                        $____hestiafs_read_count * ${4:-4096} \
                                )) \
                                --read-bytes="${4:-4096}" \
                                --output-duplicates "$1" \
                                2> /dev/null \
                        )"
                        if [ $? -ne 0 ]; then
                                break
                        fi

                        while IFS= read -r ____hestiafs_bytes || \
                        [ -n "$____hestiafs_bytes" ]; do
                                if [ "$____hestiafs_bytes" = "" ]; then
                                        break
                                fi

                                IFS="$____old_IFS" "$2" "${____hestiafs_bytes# }"
                                if [ $? -ne 0 ]; then
                                        IFS="$____old_IFS"
                                        unset ____hestiafs_bytes \
                                                ____hestiafs_read_count \
                                                ____hestiafs_read_chunks \
                                                ____hestiafs_read_count \
                                                ____old_IFS
                                        return $HestiaSIGNALS_BAD_EXEC
                                fi
                        done <<EOF
${____hestiafs_read_chunks}
EOF
                        ____hestiafs_read_count=$(( \
                                $____hestiafs_read_count + 1 \
                        ))
                done
                IFS="$____old_IFS"
                unset ____hestiafs_bytes \
                        ____hestiafs_read_count \
                        ____hestiafs_read_chunks \
                        ____hestiafs_read_count \
                        ____old_IFS
                ;;
        *)
                ____old_IFS="$IFS"
                while IFS= read -r ____line || [ -n "$____line" ]; do
                        if [ "$4" = "" ]; then
                                "$2" "$____line"
                                continue
                        fi

                        if [ "$____line" = "" ] || \
                        [ "${____line%%"$4"*}" = "$____line" ]; then
                                "$2" "$____line"
                                if [ $? -ne 0 ]; then
                                        return $HestiaSIGNALS_BAD_EXEC
                                fi

                                continue
                        fi


                        while [ -n "$____line" ]; do
                                if [ "${____line%%"$4"*}" = "$____line" ]; then
                                        "$2" "$____line"
                                        break
                                fi

                                ____param="${____line%%"$4"*}"
                                ____line="${____line#"${____param}${4}"}"

                                "$2" "$____param"
                                if [ $? -ne 0 ]; then
                                        return $HestiaSIGNALS_BAD_EXEC
                                fi
                        done
                done < "$1"
                IFS="$____old_IFS"
                unset ____line ____old_IFS
                ;;
        esac


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
