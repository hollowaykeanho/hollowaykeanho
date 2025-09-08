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
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_List_Block_Devices_From_Boot() {
        # execute
        ## try read from sysfs when available
        if [ -e "/proc/mounts" ] && [ -d "/sys/class/block" ]; then
                ____list=""
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ ! "${____line#*" /boot"}" = "$____line" ]; then
                                # /boot partition
                                ____line="${____line%% *}"

                                # make sure it's a valid device
                                if [ ! -e "/sys/class/block/${____line##*/}" ]; then
                                        continue
                                fi

                                # revert back to actual block device
                                if [ ! "/sys/class/block/${____line##*/}/partition" ]; then
                                        continue
                                fi

                                while IFS="" read -r ____number || [ -n "$____number" ]; do
                                        if [ "$____number" = "" ]; then
                                                continue
                                        fi

                                        ____line="${____line%"${____number}"}"
                                done < "/sys/class/block/${____line##*/}/partition"
                                unset ____number

                                if [ "${____line##"/dev/sd"}" = "$____line" ]; then
                                        ____line="${____line%p}"
                                fi

                                # filter duplicated values
                                if [ ! "${____list##*"$____line"}" = "$____list" ]; then
                                        continue
                                fi

                                ____list="${____list}${____line}\n"
                        fi
                done < "/proc/mounts"
                IFS="$____old_IFS"
                unset ____line ____old_IFS


                # done - output the list
                printf -- "%s" "${____list%"\n"}"
                unset ____list


                # report status
                return $HestiaSIGNALS_OK
        fi


        # report status
        printf -- "%s" ""
        return $HestiaSIGNALS_UNSUPPORTED
}




# report import status
return 0
