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
HestiaKERNEL/HestiaFS/Is-Symbolic-Link.sh
HestiaKERNEL/HestiaOS/Is-Command-Available.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Get_Symbolic_Link_Source() {
        #____path_symlink="$1"
        #____canonicalize_path="$2"


        # validate target path
        if [ "$1" = "" ]; then
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ "$(HestiaFS_Is_Symbolic_Link "$1")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_DATA_IS_NOT_LINK
        fi

        if [ "$(HestiaOS_Is_Command_Available "readlink")" -ne $HestiaSIGNALS_OK ]; then
                return $HestiaSIGNALS_UNSUPPORTED
        fi


        # execute
        if [ "$(HestiaBOOLEANS_Is_True "$2")" -eq $HestiaSIGNALS_OK ]; then
                readlink --canonicalize "$1" 2> /dev/null
        else
                readlink "$1" 2> /dev/null
        fi
        if [ $? -ne 0 ]; then
                return $HestiaSIGNALS_BAD_EXEC
        fi


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
