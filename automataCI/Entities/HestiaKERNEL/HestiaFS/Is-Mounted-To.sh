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
HestiaKERNEL/HestiaFS/Is-Filepath.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Is_Mounted_To() {
        #____path_target="$1"
        #____path_source="$2"


        # validate inputs
        case "$(HestiaFS_Is_Filepath "$1" "true")" in
        $HestiaSIGNALS_OK)
                ;;
        $HestiaSIGNALS_DATA_EMPTY)
                printf -- "%s" "$HestiaSIGNALS_ENTITY_EMPTY"
                return $HestiaSIGNALS_ENTITY_EMPTY
                ;;
        *)
                printf -- "%s" "$HestiaSIGNALS_ENTITY_INVALID"
                return $HestiaSIGNALS_ENTITY_INVALID
                ;;
        esac

        case "$(HestiaFS_Is_Filepath "$2" "true")" in
        $HestiaSIGNALS_OK)
                ;;
        $HestiaSIGNALS_DATA_EMPTY)
                printf -- "%s" "$HestiaSIGNALS_DATA_EMPTY"
                return $HestiaSIGNALS_DATA_EMPTY
                ;;
        *)
                printf -- "%s" "$HestiaSIGNALS_DATA_INVALID"
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        esac


        # execute
        ## try reading from sysfs
        if [ -e "/proc/mounts" ]; then
                # parse conventional mount path and bail early if matched
                ____target_device=""
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ "${____line##*" ${1} "}" = "$____line" ]; then
                                continue
                        fi

                        if [ "${____line%% *}" = "$2" ]; then
                                IFS="$____old_IFS"
                                unset ____line ____target_device ____old_IFS
                                printf -- "%s" "$HestiaSIGNALS_OK"
                                return $HestiaSIGNALS_OK
                        else
                                ____target_device="${____line%% *}"
                        fi
                done < "/proc/mounts"
                IFS="$____old_IFS"
                unset ____line ____old_IFS

                ## confirmed not mounted
                if [ "$____target_device" = "" ]; then
                        unset ____target_device
                        printf -- "%s" "$HestiaSIGNALS_DATA_REMOVED"
                        return $HestiaSIGNALS_DATA_REMOVED
                fi


                # target is mounted and is likely using the new
                # 'DEVICE[PATH]' device oriented convention.
                ## slice the scanning list for efficient loop scan
                ____sources_list=""
                ____source="$2"
                while [ -n "$____source" ]; do
                        if [ "$____previous" = "$____source" ]; then
                                break
                        fi

                        ____previous="$____source"
                        ____source="${____source%/*}"
                        if [ "$____source" = "" ]; then
                                ____source="/"
                                ____previous="/"
                        fi
                        ____sources_list="\
${____sources_list}${____source}
"
                done
                unset ____previous ____source

                ## scan for devices - break early when one is found
                ____source_device=""
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        while IFS="" read -r ____source || [ -n "$____source" ]; do
                                if [ "$____source" = "" ]; then
                                        continue
                                fi

                                if [ "${____line##*" ${____source} "}" = "$____line" ]; then
                                        continue
                                fi

                                # found the source device
                                ____source_device="${____line%% *}"
                                break # early since it's O(n^2) algorithm
                        done<<EOF
${____sources_list}
EOF
                done < "/proc/mounts"
                IFS="$____old_IFS"
                unset ____source ____sources_list ____line ____old_IFS

                ## verdict
                if [ "$____source_device" = "$____target_device" ]; then
                        unset ____source_device ____target_device
                        printf -- "%s" "$HestiaSIGNALS_OK"
                        return $HestiaSIGNALS_OK
                fi
                unset ____source_device ____target_device
                printf -- "%s" "$HestiaSIGNALS_DATA_MISMATCHED"
                return $HestiaSIGNALS_DATA_MISMATCHED
        fi


        # report status
        printf -- "%s" "$HestiaSIGNALS_UNSUPPORTED"
        return $HestiaSIGNALS_UNSUPPORTED
}




# report import status
return 0
