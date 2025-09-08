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




HestiaOS_To_Arch_UNIX() {
        #____input="$1"


        # execute
        ____value_arch="$(HestiaSTRINGS_To_Lowercase "$1")"
        case "$____value_arch" in
        any|none)
                printf -- "%s" "all"
                ;;
        386|i386|486|i486|586|i586|686|i686)
                printf -- "%s" "i386"
                ;;
        amd64)
                printf -- "%s" "x86_64"
                ;;
        armle)
                printf -- "%s" "armel"
                ;;
        mipsle)
                printf -- "%s" "mipsel"
                ;;
        mipsr6le)
                printf -- "%s" "mipsr6el"
                ;;
        mipsn32le)
                printf -- "%s" "mipsn32el"
                ;;
        mipsn32r6le)
                printf -- "%s" "mipsn32r6el"
                ;;
        mips64le)
                printf -- "%s" "mips64el"
                ;;
        mips64r6le)
                printf -- "%s" "mips64r6el"
                ;;
        powerpcle)
                printf -- "%s" "powerpcel"
                ;;
        ppc64le)
                printf -- "%s" "ppc64el"
                ;;
        *)
                printf -- "%b" "$____value_arch"
                ;;
        esac
        unset ____value_arch


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
