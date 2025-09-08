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
HestiaKERNEL/HestiaSTRINGS/From-Unicode.sh
HestiaKERNEL/HestiaUNICODES/Split-Right.sh
HestiaKERNEL/HestiaUNICODES/To-Unicode-From-String.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaSTRINGS_Split_Right() {
        #____input="$1"
        #____target="$2"
        #____count="$3"
        #____ignore="$4"


        # execute
        ____ret_string="$(HestiaUNICODES_To_Unicode_From_String "$1")"
        ____ret_string_target="$(HestiaUNICODES_To_Unicode_From_String "$2")"

        ____ret_string="$( \
                HestiaUNICODES_Split_Right \
                        "$____ret_string" \
                        "$____ret_string_target" \
                        "$3" \
                        "$4"
        )"
        ____process=$?
        unset ____ret_string_target

        if [ $____process -ne $HestiaSIGNALS_OK ]; then
                unset ____ret_string
                return $____process
        fi

        ____ret_output=""
        ____process=$HestiaSIGNALS_OK
        ____old_IFS="$IFS"
        while IFS="" read -r ____entry || [ -n "$____entry" ]; do
                ____ret_output="${____ret_output}$(HestiaSTRINGS_From_Unicode "$____entry")\n"
                ____process=$?
        done <<EOF
${____ret_string}
EOF
        IFS="$____old_IFS"
        unset ____ret_string ____old_IFS

        printf -- "%b" "$____ret_output"
        unset ____ret_output


        # report status
        return $____process
}




# report import status
return 0
