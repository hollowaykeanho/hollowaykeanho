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
HestiaKERNEL/HestiaFS/Is-Block-Device.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_List_Partitions_From_Block_Device() {
        #____path_device="$1"


        # validate input
        if [ "$1" = "" ]; then
                printf -- "%s" ""
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ "$(HestiaFS_Is_Block_Device "$1")" -ne $HestiaSIGNALS_OK ]; then
                printf -- "%s" ""
                return $HestiaSIGNALS_DATA_INVALID
        fi

        if [ ! -e "/dev/${1##*/}" ]; then
                printf -- "%s" ""
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # execute
        if [ -d "/sys/class/block/${1##*/}" ]; then
                ____list=""
                for ____partition in "/sys/class/block/${1##*/}"*; do
                        if [ ! -e "$____partition" ]; then
                                continue
                        fi

                        if [ ! -e "${____partition}/partition" ]; then
                                continue
                        fi

                        ____partition="/dev/${____partition##*/}"
                        if [ ! -e "$____partition" ]; then
                                continue
                        fi

                        ____list="${____list}${____partition}\n"
                done
                unset ____partition


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
        printf -- "%s" ""
        return $HestiaSIGNALS_UNSUPPORTED
}




# report import status
return 0
