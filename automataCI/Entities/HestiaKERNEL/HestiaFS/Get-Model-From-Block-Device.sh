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
HestiaKERNEL/HestiaBOOLEANS/Is-True.sh
HestiaKERNEL/HestiaFS/Is-Exist.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaSTRINGS/Trim-Whitespace.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Get_Model_From_Block_Device() {
        #____device_label="$1"


        # verify input emptiness
        if [ "$1" = "" ]; then
                return $HestiaSIGNALS_DATA_EMPTY
        fi


        # execute
        ## try read from sysfs when available
        if [ $(HestiaFS_Is_Exist "/sys/class/block/${1##*/}/device/model") -eq $HestiaSIGNALS_OK ]; then
                ____had_read=false
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        ____had_read=true
                        ____line="$(HestiaSTRINGS_Trim_Whitespace "$____line")"
                        printf -- "%s" "$____line"
                        break
                done < "/sys/class/block/${1##*/}/device/model"
                IFS="$____old_IFS"
                unset ____line ____old_IFS

                if [ "$(HestiaBOOLEANS_Is_True "$____had_read")" -ne $HestiaSIGNALS_OK ]; then
                        unset ____had_read
                        return $HestiaSIGNALS_BAD_EXEC
                fi
                unset ____had_read

                ## all good
                return $HestiaSIGNALS_OK
        fi


        # report status
        printf -- "%s" ""
        return $HestiaSIGNALS_UNSUPPORTED
}




# report import status
return 0
