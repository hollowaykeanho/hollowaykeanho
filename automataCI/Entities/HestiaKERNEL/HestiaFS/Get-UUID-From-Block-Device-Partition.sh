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
HestiaKERNEL/HestiaFS/Get-Symbolic-Link-Source.sh
HestiaKERNEL/HestiaFS/Is-Symbolic-Link.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Get_UUID_From_Block_Device_Partition() {
        #____device="$1"


        # verify input emptiness
        if [ "$1" = "" ]; then
                return $HestiaSIGNALS_DATA_EMPTY
        fi


        # execute
        ## try read from sysfs when available
        if [ -e "/sys/class/block/${1##*/}" ] &&
        [ -e "/dev/disk/by-uuid" ]; then
                for ____item in "/dev/disk/by-uuid/"*; do
                        if [ "$(HestiaFS_Is_Symbolic_Link "$____item")" -ne $HestiaSIGNALS_OK ]; then
                                continue
                        fi

                        ____output=$( \
                                HestiaFS_Get_Symbolic_Link_Source \
                                        "$____item" \
                                        "true" \
                        )
                        if [ "$____output" = "$1" ]; then
                                printf -- "%s" "${____item##*/}"
                                unset ____item ____output
                                return $HestiaSIGNALS_OK
                        fi
                done
        fi


        # report status
        printf -- "%s" ""
        return $HestiaSIGNALS_UNSUPPORTED
}




# report import status
return 0
