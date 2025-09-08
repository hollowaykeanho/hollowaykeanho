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




HestiaFS_Is_Block_Device_In_Use() {
        #____device="$1"


        # verify input emptiness
        if [ "$1" = "" ]; then
                printf -- "%s" "$HestiaSIGNALS_DATA_EMPTY"
                return $HestiaSIGNALS_DATA_EMPTY
        fi


        # execute
        ## try read from sysfs when available
        if [ -e "/proc/mounts" ] && [ -d "/sys/class/block" ]; then
                if [ ! -e "/sys/class/block/${1##*/}" ]; then
                        printf -- "%s" "$HestiaSIGNALS_DATA_MISSING"
                        return $HestiaSIGNALS_DATA_MISSING
                fi


                # check partition holders
                if [ -e "/sys/class/block/${1##*/}/partition" ]; then
                        # it's a partition - seek for holder
                        for ____holder in "/sys/class/block/${1##*/}/holders/"*; do
                                if [ -e "$____holder" ]; then
                                        unset ____holder
                                        printf -- "%s" "$HestiaSIGNALS_OK"
                                        return $HestiaSIGNALS_OK
                                fi
                        done
                else
                        # it's the generic device - seek each partition holder
                        for ____partition in "/sys/class/block/${1##*/}/"*; do
                                if [ ! -e "${____partition}/partition" ]; then
                                        continue
                                fi

                                for ____holder in "${____partition}/holders/"*; do
                                        if [ -e "$____holder" ]; then
                                                unset ____partition ____holder
                                                printf -- "%s" "$HestiaSIGNALS_OK"
                                                return $HestiaSIGNALS_OK
                                        fi
                                done
                        done
                        unset ____partition
                fi
                unset ____holder


                # check for currently mounted partitions in '/proc/mounts'
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ ! "${____line##"${1}"}" = "$____line" ]; then
                                IFS="$____old_IFS"
                                unset ____line ____old_IFS
                                printf -- "%s" "$HestiaSIGNALS_OK"
                                return $HestiaSIGNALS_OK
                        fi
                done < "/proc/mounts"
                IFS="$____old_IFS"
                unset ____line ____old_IFS


                # no other detection - assume free and unmounted
                printf -- "%s" "$HestiaSIGNALS_DATA_EXISTS"
                return $HestiaSIGNALS_DATA_EXISTS
        fi


        # report status
        printf -- "%s" "$HestiaSIGNALS_UNSUPPORTED"
        return $HestiaSIGNALS_UNSUPPORTED
}




# report import status
return 0
