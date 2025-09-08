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
HestiaKERNEL/HestiaFS/Codes-Permission.sh
HestiaKERNEL/HestiaFS/Is-Exist.sh
HestiaKERNEL/HestiaFS/Update-Owner.sh
HestiaKERNEL/HestiaFS/Update-Permission.sh
HestiaKERNEL/HestiaOS/Is-Command-Available.sh
HestiaKERNEL/HestiaOS/Get-UID.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Secure_Keyfile() {
        #____filepath="$1"


        # validate target path
        if [ "$1" = "" ]; then
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ "$(HestiaFS_Is_Exist "$1")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # execute
        ____status=$HestiaSIGNALS_OK
        ____uid="$(HestiaOS_Get_UID)"
        HestiaFS_Update_Owner "$1" "$____uid" "$____uid"
        if [ $? -ne 0 ]; then
                ____status=$HestiaSIGNALS_BAD_EXEC
        fi
        unset ____uid

        HestiaFS_Update_Permission "$1" "$HestiaFS_PERM_SECRET_KEYFILE"
        if [ $? -ne 0 ]; then
                ____status=$HestiaSIGNALS_BAD_EXEC
        fi


        # report status
        if [ $____status -ne $HestiaSIGNALS_OK ]; then
                unset ____status
                return $HestiaSIGNALS_BAD_EXEC
        fi
        unset ____status

        return $HestiaSIGNALS_OK
}




# report import status
return 0
