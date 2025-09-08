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
HestiaKERNEL/HestiaSTRINGS/To-Lowercase.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaOS_To_OS() {
        #____input="$1"


        # execute
        ____value_os="$(HestiaSTRINGS_To_Lowercase "$1")"
        case "$____value_os" in
        windows*|ms-dos*)
                printf -- "%s" "windows"
                ;;
        cygwin*|mingw*|mingw32*|msys*)
                printf -- "%s" "windows"
                ;;
        *freebsd)
                printf -- "%s" "freebsd"
                ;;
        dragonfly*)
                printf -- "%s" "dragonfly"
                ;;
        standalone|unknown|none)
                printf -- "%s" "none"
                ;;
        *)
                printf -- "%s" "$____value_os"
                ;;
        esac
        unset ____value_os


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
