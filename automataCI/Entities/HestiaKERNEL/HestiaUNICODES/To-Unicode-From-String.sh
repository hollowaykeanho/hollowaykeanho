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
HestiaKERNEL/HestiaOS/Get-Encoder-String.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaUNICODES/Codes.sh
HestiaKERNEL/HestiaUNICODES/To-Unicode-From-UTF8.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_To_Unicode_From_String() {
        #____input="$1"


        # validate input
        if [ "$1" = "" ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ ! "$(HestiaOS_Get_Encoder_String)" = "$HestiaUNICODES_UTF8" ]; then
                # unknown encoder
                printf -- "%s" ""
                return $HestiaSIGNALS_UNSUPPORTED
        fi


        # execute
        ## POSIX Shell does not handle any character beyond Latin-1 script.
        ## Hence, most of its string operation only works for ASCII character
        ## (<127). While it's not a problem for BASH; it is for
        ## non-BASH environment. Hence, manual implementations are required.
        ____converted=""
        ____content="$1"
        while [ ! "$____content" = "" ]; do
                ____char="${____content%"${____content#?}"}"
                ____content="${____content#${____char}}"

                if [ "$LANG" = "" ] && [ "$LC_ALL" = "" ]; then
                        # unknown language & encoder
                        ____codepoint=63
                elif command -v od > /dev/null; then
                        # default to using od byte processor whenever available
                        ____data="$(printf -- "%s" "$____char" | od -A n -t uC)"

                        ____codepoint=""
                        while [ ! "$____data" = "" ]; do
                                ____byte="${____data##* }"
                                ____data="${____data%" $____byte"}"
                                if [ ! "$____byte" = "" ]; then
                                        ____codepoint="${____byte}, ${____codepoint}"
                                        continue
                                fi
                        done

                        ____converted="${____converted%, }${____codepoint}, "
                        continue
                else
                        # relies on conventional parsing
                        ____codepoint="$(printf -- "%d" "'${____char}")"

                        if [ $____codepoint -lt 0 ]; then
                                # unknown encoder - replace with '?'
                                ____codepoint=63
                        fi
                fi

                ____converted="${____converted}${____codepoint}, "
        done
        unset ____byte ____char ____data ____codepoint ____content


        # clean up tailing commas
        ____converted="${____converted%, }"
        if command -v od > /dev/null; then
                ____converted="${____converted%, }"
        fi


        # decode by known encoders
        if [ "$(HestiaOS_Get_Encoder_String)" = "$HestiaUNICODES_UTF8" ]; then
                # encoder is UTF-8
                ____converted="$( \
                        HestiaUNICODES_To_Unicode_From_UTF8 "$____converted" \
                )"
        fi

        printf -- "%s" "$____converted"
        unset ____converted


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
