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
HestiaKERNEL/HestiaNUMBERS/Is-Positive.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaNUMBERS_Is_Time_Hour() {
        #____input="$1"
        #____is_format_12_hours="$2"    # set 'true' if yes


        # execute
        if [ "$1" = "" ]; then
                printf -- "%d" $HestiaSIGNALS_DATA_EMPTY
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ "$(HestiaNUMBERS_Is_Positive "$1")" -ne $HestiaSIGNALS_OK ]; then
                printf -- "%d" $HestiaSIGNALS_DATA_INVALID
                return $HestiaSIGNALS_DATA_INVALID
        fi

        if [ "$1" -lt 0 ] || [ "$1" -gt 23 ]; then
                printf -- "%d" $HestiaSIGNALS_DATA_INVALID
                return $HestiaSIGNALS_DATA_INVALID
        fi

        if [ "$(HestiaBOOLEANS_Is_True "$2")" -eq $HestiaSIGNALS_OK ]; then
                if [ "$1" -gt 12 ]; then
                        printf -- "%d" $HestiaSIGNALS_DATA_INVALID
                        return $HestiaSIGNALS_DATA_INVALID
                fi
        fi


        # report status
        printf -- "%d" $HestiaSIGNALS_OK
        return $HestiaSIGNALS_OK
}




# report import status
return 0
