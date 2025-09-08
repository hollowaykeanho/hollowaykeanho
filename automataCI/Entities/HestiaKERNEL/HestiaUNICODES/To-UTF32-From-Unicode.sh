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
HestiaKERNEL/HestiaOS/Codes-Endian.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaUNICODES/Codes.sh
HestiaKERNEL/HestiaUNICODES/Is-Unicode.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_To_UTF32_From_Unicode() {
        #____content="$1"
        #____bom="$2"
        #____endian="$3"


        # validate input
        if [ "$(HestiaUNICODES_Is_Unicode "$1")" -ne $HestiaSIGNALS_OK ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # execute
        ____converted=""


        # prefix BOM if requested
        if [ "$2" = "$HestiaUNICODES_UTF_BOM" ]; then
                case "$3" in
                "$HestiaOS_ENDIAN_LITTLE")
                        # UTF32LE_BOM - 0xFF, 0xFE, 0x00, 0x00
                        ____converted="255, 254, 0, 0, "
                        ;;
                *)
                        # UTF32BE_BOM (default) - 0x00, 0x00, 0xFE, 0xFF
                        ____converted="0, 0, 254, 255, "
                        ;;
                esac
        fi


        # convert to UTF-32 bytes list
        ____content="$1"
        while [ ! "$____content" = "" ]; do
                # get current character decimal
                ____char="${____content%%, *}"
                ____content="${____content#"$____char"}"
                if [ "${____content%"${____content#?}"}" = "," ]; then
                        ____content="${____content#, }"
                fi

                case "$3" in
                "$HestiaOS_ENDIAN_LITTLE")
                        ____register=$(($____char & 0xFF))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char & 0xFF00))
                        ____register=$(($____char >> 8))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char & 0xFF0000))
                        ____register=$(($____char >> 16))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char & 0xFF000000))
                        ____register=$(($____char >> 24))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "
                        ;;
                *)
                        ____register=$(($____char & 0xFF000000))
                        ____register=$(($____char >> 24))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char & 0xFF0000))
                        ____register=$(($____char >> 16))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char & 0xFF00))
                        ____register=$(($____char >> 8))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "

                        ____register=$(($____char & 0xFF))
                        ____converted="${____converted}$(printf -- "%d" "$____register"), "
                        ;;
                esac
        done
        unset ____content ____char ____register

        printf -- "%s" "${____converted%, }"
        unset ____converted


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
