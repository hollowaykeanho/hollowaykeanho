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




____old_IFS="$IFS"
while IFS="" read -r ____library || [ -n "$____library" ]; do
        if [ -f "${LIBS_HESTIA}/${____library}" ]; then
                . "${LIBS_HESTIA}/${____library}"
                if [ $? -ne 0 ]; then
                        1>&2 printf -- "E: Bad Import '%s'.\n" "$____library"
                        unset ____library
                        return 1
                fi

                continue
        fi

        1>&2 printf -- "E: Missing Library '%s'.\n" "$____library"
        unset ____library
        return 1
done<<EOF
HestiaKERNEL/HestiaSIGNALS/Codes.sh
EOF
IFS="$____old_IFS"
unset ____library ____old_IFS




HestiaFS_List_Partitions_From_Block_Devices() {
        # execute
        if [ -d "/sys/class/block" ]; then
                ____list=""
                for ____device in "/sys/class/block/"*; do
                        if [ ! -e "$____device" ]; then
                                continue
                        fi

                        if [ ! -e "${____device}/partition" ]; then
                                continue
                        fi

                        ____device="${____device##*/}"
                        case "$____device" in
                        dm-*|loop*|ram*|sr*)
                                continue
                                ;;
                        *)
                                ____device="/dev/${____device}"
                                if [ ! -e "$____device" ]; then
                                        continue
                                fi

                                ;;
                        esac

                        ____list="${____list}${____device}\n"
                done
                unset ____device


                # output results
                printf -- "%b" "$____list"
                if [ "$____list" = "" ]; then
                        unset ____list
                        return $HestiaSIGNALS_BAD_EXEC
                fi
                unset ____list


                # report status
                return $HestiaSIGNALS_OK
        fi


        # report status
        1>&2 printf -- "%s" ""
        return $HestiaSIGNALS_UNSUPPORTED
}




# report import status
return 0
