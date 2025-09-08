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




HestiaOS_Get_Total_CPU_Online() {
        # execute
        if [ -e "/sys/devices/system/cpu/online" ]; then
                ____count=""
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        ____count="$____line"
                done < "/sys/devices/system/cpu/online"
                IFS="$____old_IFS"
                unset ____line ____old_IFS

                if [ "$____count" != "" ]; then
                        if [ ! "${____count#*-}" = "$____count" ]; then
                                ____count="${____count#*-}"
                                ____count=$(($____count + 1))
                        fi
                        printf -- "%s" "$____count"
                        unset ____count
                        return $HestiaSIGNALS_OK
                fi

                unset ____count
        fi

        if [ -e "/proc/cpuinfo" ]; then
                ____count=0
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ ! "${____line#"processor"}" = "$____line" ]; then
                                ____count=$(($____count + 1))
                        fi

                done < "/proc/cpuinfo"
                IFS="$____old_IFS"
                unset ____line ____old_IFS

                if [ "$____count" -gt 0 ]; then
                        printf -- "%s" "$____count"
                        unset ____count
                        return $HestiaSIGNALS_OK
                fi
        fi


        # report status
        printf -- "%s" "1"
        return $HestiaSIGNALS_UNSUPPORTED
}




# report import status
return 0
