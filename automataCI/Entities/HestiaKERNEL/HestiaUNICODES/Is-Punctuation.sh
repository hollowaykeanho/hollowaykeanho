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
HestiaKERNEL/HestiaNUMBERS/Is-Number.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_Is_Punctuation() {
        #____unicode="$1"


        # validate input
        if [ "$(HestiaNUMBERS_Is_Number "$1")" -ne $HestiaSIGNALS_OK ]; then
                printf -- "%d" $HestiaSIGNALS_DATA_INVALID
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # execute
        if ([ $1 -ge 33 ] && [ $1 -le 47 ]) ||
                ([ $1 -ge 58 ] && [ $1 -le 64 ]) ||
                ([ $1 -ge 91 ] && [ $1 -le 96 ]) ||
                ([ $1 -ge 123 ] && [ $1 -le 126 ]) ||
                ([ $1 -ge 161 ] && [ $1 -le 191 ]) ||
                ([ $1 -ge 8192 ] && [ $1 -le 8303 ]) ||
                ([ $1 -ge 10067 ] && [ $1 -le 10101 ]) ||
                ([ $1 -ge 10214 ] && [ $1 -le 10223 ]) ||
                ([ $1 -ge 10624 ] && [ $1 -le 10650 ]) ||
                ([ $1 -ge 10748 ] && [ $1 -le 10749 ]) ||
                ([ $1 -ge 11776 ] && [ $1 -le 11903 ]) ||
                ([ $1 -ge 12288 ] && [ $1 -le 12351 ]) ||
                ([ $1 -ge 12539 ] && [ $1 -le 12539 ]) ||
                ([ $1 -ge 65040 ] && [ $1 -le 65055 ]) ||
                ([ $1 -ge 65056 ] && [ $1 -le 65071 ]) ||
                ([ $1 -ge 65072 ] && [ $1 -le 65103 ]) ||
                ([ $1 -ge 65104 ] && [ $1 -le 65135 ]) ||
                ([ $1 -ge 65281 ] && [ $1 -le 65295 ]) ||
                ([ $1 -ge 65306 ] && [ $1 -le 65312 ]) ||
                ([ $1 -ge 65339 ] && [ $1 -le 65344 ]) ||
                ([ $1 -ge 65355 ] && [ $1 -le 65381 ]) ||
                ([ $1 -ge 74752 ] && [ $1 -le 74879 ]) ||
                ([ $1 -ge 94176 ] && [ $1 -le 94207 ]); then
                # Latin-1 Script (0x0021-0x002F;
                #                 0x003A-0x0040;
                #                 0x005B-0x0060;
                #                 0x007B-0x007E)
                # Latin-1 Suppliment Script (0x00A0-0x00BF)
                # General Punctuation Script (0x2000-0x206F)
                # Dingbats (0x2753-0x2775)
                # Miscellaneous Mathematical Symbols-A (0x27E6-0x27EF)
                # Miscellaneous Mathematical Symbols-B (0x2980-0x299A;
                #                                       0x29FC-0x29FD)
                # Supplemental Punctuation Script (0x2E00-0x2E7F)
                # CJK Symbols and Punctuation Script (0x3000-0x303F)
                # Katakana (0x30FB)
                # Vertical Forms (0xFE10-0xFE1F)
                # Combining Half Marks (0xFE20-0xFE2F)
                # CJK Compatibility Forms (0xFE30-0xFE4F)
                # Small Form Variants (0xFE50-0xFE6F)
                # Halfwidth and Fullwidth (0xFF01-0xFF0F;
                #                          0xFF1A-0xFF20;
                #                          0xFF3B-0xFF40;
                #                          0xFF4B-0xFF65)
                # Cuneiform Number and Punctuation Script (0x12400-0x1247F)
                # Ideographic Symbols and Punctuation Script (0x16FE0-0x16FFF)
                printf -- "%d" $HestiaSIGNALS_OK
                return $HestiaSIGNALS_OK
        fi


        # report status
        printf -- "%d" $HestiaSIGNALS_DATA_INVALID
        return $HestiaSIGNALS_DATA_INVALID
}




# report import status
return 0
