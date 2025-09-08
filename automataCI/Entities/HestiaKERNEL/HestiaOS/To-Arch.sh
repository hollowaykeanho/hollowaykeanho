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




HestiaOS_To_Arch() {
        #____input="$1"


        # execute
        ____value_arch="$(HestiaSTRINGS_To_Lowercase "$1")"
        case "$____value_arch" in
        i686-64|ia64)
                printf -- "%s" "ia64"
                ;;
        386|i386|486|i486|586|i586|686|i686|x86)
                printf -- "%s" "i386"
                ;;
        x86_64|x64)
                printf -- "%s" "amd64"
                ;;
        sun4u)
                printf -- "%s" "sparc"
                ;;
        "power macintosh")
                printf -- "%s" "powerpc"
                ;;
        ip*)
                printf -- "%s" "mips"
                ;;
        *)
                printf -- "%s" "$____value_arch"
                ;;
        esac
        unset ____value_arch


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
