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
HestiaKERNEL/HestiaUNICODES/Wrap-Left.sh
HestiaKERNEL/HestiaUNICODES/Wrap-Right.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_Wrap() {
        #____content_unicode="$1"
        #____max_width="$2"
        #____break_word="$3" # NOTE: placeholding for future. Always 'true'.
        #____from_right="$4"


        # execute
        if [ ! "$4" = "" ]; then
                HestiaUNICODES_Wrap_Right "$1" "$2" "$3"
        else
                HestiaUNICODES_Wrap_Left "$1" "$2" "$3"
        fi


        # report status
        return $?
}




# report import status
return 0
