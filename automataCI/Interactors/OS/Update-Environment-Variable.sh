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




Interactors_OS_Update_Environment_Variable() {
        #____input_key="$1"
        #____input_value="$2"


        # execute
        HestiaOS_Update_Environment_Variable "$1" "$2"
        if [ $? -ne $HestiaSIGNALS_OK ]; then
                return 1
        fi


        # report status
        return 0
}




# report import status
return 0
