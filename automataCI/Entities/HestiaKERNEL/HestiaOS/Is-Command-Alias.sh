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




HestiaOS_Is_Command_Alias() {
        #____command="$1"


        # validate input
        if [ "$1" = "" ]; then
                printf -- "%d" $HestiaSIGNALS_DATA_MISSING
                return $HestiaSIGNALS_DATA_MISSING
        fi


        # execute
        ____ret="$(command -V "$1" 2> /dev/null)"
        if [ ! "${____ret##*"is aliased to"}" = "$____ret" ] ||
        [ ! "${____ret##*"is an alias for"}" = "$____ret" ]; then
                printf -- "%d" $HestiaSIGNALS_OK
                return $HestiaSIGNALS_OK
        fi


        # report status
        printf -- "%d" $HestiaSIGNALS_DATA_MISSING
        return $HestiaSIGNALS_DATA_MISSING
}




# report import status
return 0
