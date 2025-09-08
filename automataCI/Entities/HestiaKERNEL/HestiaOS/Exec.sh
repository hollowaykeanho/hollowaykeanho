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




# IMPORTANT NOTES
#       (1) This function was designed for inter-languages compatibility
#           purposes. Some languages like PowerShell has funky return
#           functions (multiple ways to return a values but not the return
#           code). The function is here to standardize the output and
#           terminal stream into 1 way.
#
#           For POSIX Shell, it's rare to implement this function. Just
#           call the command directly and redirect the output accordingly.
HestiaOS_Exec() {
        #____command="$1"
        #____argument="$2"
        #____log_stdout="$3"
        #____log_stderr="$4"


        # validate input
        if [ "$1" = "" ]; then
                return $HestiaSIGNALS_DATA_EMPTY
        fi


        # execute command
        if [ ! "$3" = "" ] || [ ! "$4" = "" ]; then
                "$1" $2 1>"$3" 2>"$4"
        elif [ ! "$3" = "" ]; then
                "$1" $2 1>"$3"
        elif [ ! "$4" = "" ]; then
                "$1" $2 2>"$4"
        else
                "$1" $2
        fi

        if [ $? -ne 0 ]; then
                return $HestiaSIGNALS_BAD_EXEC
        fi


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
