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
HestiaKERNEL/HestiaFS/Is-Exist.sh
HestiaKERNEL/HestiaOS/Is-Command-Available.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Get_Owner() {
        #____path_target="$1"


        # validate input
        if [ "$(HestiaFS_Is_Exist "$1")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_ENTITY_EMPTY
        fi

        if [ "$(HestiaOS_Is_Command_Available "stat")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_UNSUPPORTED
        fi


        # execute
        stat -c "%u" "$1"
        if [ $? -ne 0 ]; then
                return $HestiaSIGNALS_BAD_EXEC
        fi


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
