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
HestiaKERNEL/HestiaOS/Get-Encoder-String.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaUNICODES/Codes.sh
HestiaKERNEL/HestiaUNICODES/Is-Unicode.sh
HestiaKERNEL/HestiaUNICODES/To-UTF8-From-Unicode.sh
HestiaKERNEL/HestiaUNICODES/To-UTF16-From-Unicode.sh
HestiaKERNEL/HestiaUNICODES/To-UTF32-From-Unicode.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaSTRINGS_From_Unicode() {
        #____input="$1"


        # validate input
        if [ $(HestiaUNICODES_Is_Unicode "$1") -ne "$HestiaSIGNALS_OK" ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # execute
        ## ensure all unicode are valid --> replace unsupported to '?'
        ____content="$1"
        ____converted=""
        while [ ! "$____content" = "" ]; do
                # get character
                ____codepoint="${____content%%, *}"
                ____content="${____content#"$____codepoint"}"
                if [ "${____content%"${____content#?}"}" = "," ]; then
                        ____content="${____content#, }"
                fi

                # check for valid codepoint
                if [ $____codepoint -lt 0 ]; then
                        ____codepoint=63 # change to '?'
                fi

                ____converted="${____converted}${____codepoint}, "
        done
        unset ____codepoint


        # process HestiaKERNEL.Unicodes data type
        ____content="${____converted%, }"
        case "$(HestiaOS_Get_Encoder_String)" in
        $HestiaUNICODES_UTF8)
                ____content="$(HestiaUNICODES_To_UTF8_From_Unicode "$____content")"
                ;;
        $HestiaUNICODES_UTF16BE)
                ____content="$(HestiaUNICODES_To_UTF16_From_Unicode "$____content")"
                ;;
        $HestiaUNICODES_UTF32BE)
                ____content="$(HestiaUNICODES_To_UTF32_From_Unicode "$____content")"
                ;;
        *)
                printf -- ""
                return $HestiaSIGNALS_NOT_POSSIBLE
                ;;
        esac

        ____converted=""
        while [ ! "$____content" = "" ]; do
                # get character
                ____byte="${____content%%, *}"
                ____content="${____content#"$____byte"}"
                if [ "${____content%"${____content#?}"}" = "," ]; then
                        ____content="${____content#, }"
                fi

                ____converted="${____converted}$(printf -- '\%o' "$____byte")"
        done
        unset ____byte ____content

        printf -- "%b" "$____converted"
        unset ____converted


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
