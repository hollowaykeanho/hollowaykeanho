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




# IMPORTANT NOTES:
#       (1) This function is only meant for scouting and educational purposes
#           only. In practice, you should directly use $KEY to query the value
#           rather than scanning the list like:
#               $ printf -- "%s" "$KEY"
HestiaOS_Get_Environment_Variable() {
        #____input="$1"


        # validate input
        if [ "$1" = "" ]; then
                printf -- "%s" ""
                return $HestiaSIGNALS_ENTITY_MISSING
        fi


        # execute
        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                if [ "$____line" = "" ]; then
                        continue
                fi

                case "${____line%%=*}" in
                "")
                        continue
                        ;;
                "$1")
                        ____value="${____value%"'"}"
                        ____value="${____value#"'"}"
                        ____value="${____value%"\""}"
                        ____value="${____value#"\""}"
                        printf -- "%s" "$____value"
                        IFS="$____old_IFS"
                        unset ____name ____value ____old_IFS
                        return $HestiaSIGNALS_OK
                        ;;
                esac
        done<<EOF
$(set)
EOF
        IFS="$____old_IFS"
        unset ____name ____value ____old_IFS


        # report status
        printf -- "%s" ""
        return $HestiaSIGNALS_DATA_MISSING
}




# report import status
return 0
