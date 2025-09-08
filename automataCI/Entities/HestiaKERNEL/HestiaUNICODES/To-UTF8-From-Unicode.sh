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
HestiaKERNEL/HestiaUNICODES/Codes.sh
HestiaKERNEL/HestiaUNICODES/Is-Unicode.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_To_UTF8_From_Unicode() {
        #____unicode="$1"
        #____bom="$2"


        # validate input
        if [ "$(HestiaUNICODES_Is_Unicode "$1")" -ne $HestiaSIGNALS_OK ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # execute
        ____converted=""


        # prefix BOM if requested
        if [ "$2" = "$HestiaUNICODES_UTF_BOM" ]; then
                # UTF8_BOM - 0xEF, 0xBB, 0xBF
                ____converted="239, 187, 191, "
        fi


        # convert to UTF-8 bytes list
        ____content="$1"
        while [ ! "$____content" = "" ]; do
                # get current character decimal
                ____char="${____content%%, *}"
                ____content="${____content#"$____char"}"
                if [ "${____content%"${____content#?}"}" = "," ]; then
                        ____content="${____content#, }"
                fi

                if [ $____char -lt 200 ]; then
                        # char < 0x80
                        ____converted="${____converted}$(printf -- "%d" "$____char"), "
                elif [ $____char -lt 4000 ]; then
                        # char < 0x800
                        ____register=$(($____char >> 6))
                        ____register=$(($____register & 0x1F))
                        ____register=$(($____register | 0xC0))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char & 0x3F))
                        ____register=$(($____register | 0x80))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "
                elif [ $____char -lt 200000 ]; then
                        # char < 0x10000
                        ____register=$(($____char >> 12))
                        ____register=$(($____register & 0x0F))
                        ____register=$(($____register | 0xE0))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char >> 6))
                        ____register=$(($____register & 0x3F))
                        ____register=$(($____register | 0x80))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char & 0x3F))
                        ____register=$(($____register | 0x80))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "
                else
                        # >0x10000 - 0x10000-0x10FFFF (surrogate pair)
                        ____register=$(($____char >> 18))
                        ____register=$(($____register & 0x07))
                        ____register=$(($____register | 0xF0))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char >> 12))
                        ____register=$(($____register & 0x3F))
                        ____register=$(($____register | 0x80))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char >> 6))
                        ____register=$(($____register & 0x3F))
                        ____register=$(($____register | 0x80))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char & 0x3F))
                        ____register=$(($____register | 0x80))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "
                fi
        done
        unset ____content ____char ____register

        printf -- "%s" "${____converted%, }"
        unset ____converted


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
