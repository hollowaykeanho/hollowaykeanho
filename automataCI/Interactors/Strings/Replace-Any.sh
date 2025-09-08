#!/bin/sh
# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho's Proprietary License (the 'License').
# You must comply with the license to use the content. Get the License at:
#
# https://doi.org/10.5281/zenodo.13767361
#
# DO NOT SOURCE, USE, READ, MODIFY, REPRODUCE, DISTRIBUTE, RE-DISTRIBUTE,
# REVERSE ENGINEER, OR ANY OTHER ACTIONS WITH ANY PART OF THE CONTENT WITHOUT
# WRITTEN AND RATIFIED CONSENT from the copyright owners, unless the license
# explicitly allowing it.




Interactors_Strings_Replace_Any() {
        #____input="$1"
        #____from="$2"
        #____to="$3"
        #____count="$4"
        #____ignore="$5"
        #____from_right="$6"


        # execute
        HestiaSTRINGS_Replace_Any "$1" "$2" "$3" "$4" "$5" "$6"
        if [ $? -ne $HestiaSIGNALS_OK ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0
