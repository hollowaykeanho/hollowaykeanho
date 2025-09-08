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
HestiaKERNEL/HestiaOS/Is-Color-Mode.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaOS_Print_Info() {
        #____string="$1"


        # execute
        ____old_IFS="$IFS"
        while IFS="" read -r ____line_print_to_stderr || \
        [ -n "$____line_print_to_stderr" ]; do
                case "$TERM" in
                xterm-color|*-256color)
                        ____line_print_to_stderr="\
\\033[1;96mI:\\033[0m \\033[96m${____line_print_to_stderr}\\033[0m
"
                        ;;
                *)
                        # formatting terminal is unavailable
                        ____line_print_to_stderr="\
I: ${____line_print_to_stderr}
"
                        ;;
                esac

                1>&2 printf -- "%b" "$____line_print_to_stderr"
        done<<EOF
${1:-"???Dev???"}
EOF
        IFS="$____old_IFS"
        unset ____line_print_to_stderr ____old_IFS


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
