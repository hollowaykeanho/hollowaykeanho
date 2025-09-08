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




HestiaUNICODES_Is_Whitespace() {
        #____unicode="$1"


        # execute
        case "$1" in
        "92, 116")
                # 9 | 0x0009 | '\t'
                printf -- "%d" $HestiaSIGNALS_OK
                return $HestiaSIGNALS_OK
                ;;
        "92, 110")
                # 10 | 0x000A | '\n'
                printf -- "%d" $HestiaSIGNALS_OK
                return $HestiaSIGNALS_OK
                ;;
        "92, 118")
                # 11 | 0x000B | '\v'
                printf -- "%d" $HestiaSIGNALS_OK
                return $HestiaSIGNALS_OK
                ;;
        "92, 102")
                # 12 | 0x000C | '\f'
                printf -- "%d" $HestiaSIGNALS_OK
                return $HestiaSIGNALS_OK
                ;;
        "92, 114")
                # 13 | 0x000D | '\r'
                printf -- "%d" $HestiaSIGNALS_OK
                return $HestiaSIGNALS_OK
                ;;
        9|10|11|12|13|32|133|160)
                #  9    | 10   | 11   | 12   | 13   | 32   | 133  | 160
                # 0x0009|0x000A|0x000B|0x000C|0x000D|0x0020|0x0085|0x00A0
                # '\t'  , '\n' , '\v' , '\f' , '\r' , ' '  , NEL  , NBSP
                printf -- "%d" $HestiaSIGNALS_OK
                return $HestiaSIGNALS_OK
                ;;
        *)
                printf -- "%d" $HestiaSIGNALS_DATA_INVALID
                return $HestiaSIGNALS_DATA_INVALID
                ;;
        esac
}




# report import status
return 0
