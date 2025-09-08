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
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_Is_UTF() {
        #____byte_array="$1"


        # validate input
        if [ "$1" = "" ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_EMPTY
        fi


        # extract BOM markers
        ____content="$1"
        ____count=8
        ____utf8_expect=0
        ____utf32_expect=0
        ____byte_0=""
        ____byte_1=""
        ____byte_2=""
        ____byte_3=""
        while [ $____count -gt 0 ]; do
                if [ "$____content" = "" ]; then
                        break
                fi

                # get current byte ($____content[0])
                ____byte="${____content%%, *}"
                ____content="${____content#${____byte}}"
                if [ "${____content%"${____content#?}"}" = "," ]; then
                        ____content="${____content#, }"
                fi

                # save to sample positions for BOM analysis
                case "$____count" in
                8)
                        ____byte_0="$____byte"
                        ;;
                7)
                        ____byte_1="$____byte"
                        ;;
                6)
                        ____byte_2="$____byte"
                        ;;
                5)
                        ____byte_3="$____byte"
                        ;;
                *)
                        ;;
                esac

                # scan UTF-8 header for its validity
                if [ $____utf8_expect -le 0 ]; then
                        : # it is already identified invalid - do nothing
                elif [ $(($____byte & 0xF8)) -eq 240 ]; then
                        # 11110xxx header
                        if [ $____utf8_expect -ne 0 ]; then
                                ____utf8_expect=-1 # expect tailing byte; got new entry
                        else
                                ____utf8_expect=3
                        fi
                elif [ $(($____byte & 0xE0)) -eq 224 ]; then
                        # 1110xxxx header
                        if [ $____utf8_expect -ne 0 ]; then
                                ____utf8_expect=-1 # expect tailing byte; got new entry
                        else
                                ____utf8_expect=2
                        fi
                elif [ $(($____byte & 0xE0)) -eq 192 ]; then
                        # 110xxxxx header
                        if [ $____utf8_expect -ne 0 ]; then
                                ____utf8_expect=-1 # expect tailing byte; got new entry
                        else
                                ____utf8_expect=1
                        fi
                elif [ $(($____byte & 0xC0)) -eq 128 ]; then
                        # 10xxxxxx header
                        if [ $____utf8_expect -le 0 ]; then
                                ____utf8_expect=-1  # unexpected tailing byte
                        else
                                ____utf8_expect=$(($____utf8_expect - 1))
                        fi
                elif [ $(($____byte & 0x80)) -eq 0 ]; then
                        # 0xxxxxxx header
                        if [ $____utf8_expect -gt 0 ]; then
                                ____utf8_expect=-1 # expecting tailing character byte; got Latin-1
                        else
                                ____utf8_expect=0 # it's a Latin-1 character (<= 0x7F)
                        fi
                else
                        # invalid UTF8 - all bytes **MUST** comply to the headers
                        ____utf8_expect=-1
                fi

                # detect UTF-32 for later guessing
                if [ $____count -le 4 ]; then
                        ____utf32_expect=1
                fi

                # prepare for next scan
                ____count=$(($____count - 1))
        done
        unset ____count ____byte ____content


        # scan for BOM
        if [ $____byte_0 -eq 255 ] &&
                [ $____byte_1 -eq 254 ] &&
                [ $____byte_2 -eq 0 ] &&
                [ $____byte_3 -eq 0 ]; then
                # it's UTF32LE_BOM
                printf -- "%b" "$HestiaUNICODES_UTF32LE_BOM"
                unset ____byte_0 \
                        ____byte_1 \
                        ____byte_2 \
                        ____byte_3 \
                        ____utf8_expect \
                        ____utf32_expect \
                        ____count \
                        ____content \
                        ____output
                return $HestiaSIGNALS_OK
        elif [ $____byte_0 -eq 0 ] &&
                [ $____byte_1 -eq 0 ] &&
                [ $____byte_2 -eq 254 ] &&
                [ $____byte_3 -eq 255 ]; then
                # it's UTF32BE_BOM
                printf -- "%b" "$HestiaUNICODES_UTF32BE_BOM"
                unset ____byte_0 \
                        ____byte_1 \
                        ____byte_2 \
                        ____byte_3 \
                        ____utf8_expect \
                        ____utf32_expect \
                        ____count \
                        ____content \
                        ____output
                return $HestiaSIGNALS_OK
        elif [ $____byte_0 -eq 239 ] &&
                [ $____byte_1 = 187 ] &&
                [ $____byte_2 = 191 ]; then
                # it's UTF8_BOM
                printf -- "%b" "$HestiaUNICODES_UTF8_BOM"
                unset ____byte_0 \
                        ____byte_1 \
                        ____byte_2 \
                        ____byte_3 \
                        ____utf8_expect \
                        ____utf32_expect \
                        ____count \
                        ____content \
                        ____output
                return $HestiaSIGNALS_OK
        elif [ $____byte_0 -eq 255 ] && [ $____byte_1 -eq 254 ]; then
                # it's UTF16LE_BOM
                printf -- "%b" "$HestiaUNICODES_UTF16LE_BOM"
                unset ____byte_0 \
                        ____byte_1 \
                        ____byte_2 \
                        ____byte_3 \
                        ____utf8_expect \
                        ____utf32_expect \
                        ____count \
                        ____content \
                        ____output
                return $HestiaSIGNALS_OK
        elif [ $____byte_0 -eq 254 ] && [ $____byte_1 -eq 255 ]; then
                # it's UTF16BE_BOM
                printf -- "%b" "$HestiaUNICODES_UTF16BE_BOM"
                unset ____byte_0 \
                        ____byte_1 \
                        ____byte_2 \
                        ____byte_3 \
                        ____utf8_expect \
                        ____utf32_expect \
                        ____count \
                        ____content \
                        ____output
                return $HestiaSIGNALS_OK
        fi
        unset ____byte_0 ____byte_1 ____byte_2 ____byte_3


        # no BOM markers - arrange for possible permutations
        ____output="\
${HestiaUNICODES_UTF16LE}
${HestiaUNICODES_UTF16BE}
"
        if [ $____utf8_expect -ge 0 ]; then
                # IMPORTANT NOTICE
                # there is a chance of 6 Latin-1 characters in a straight chain
                # that makes the scanner produce false positive. Hence, let's
                # not assume the scanner is guarenteed correct.
                #
                # Moreover, engineering specification specified that user is
                # the one providing the type, not auto-detection without
                # BOM marker.
                ____output="\
${HestiaUNICODES_UTF8}
${____output}"
        fi
        unset ____utf8_expect

        if [ $____utf32_expect -gt 0 ]; then
                ____output="\
${____output}
${HestiaUNICODES_UTF32BE}
${HestiaUNICODES_UTF32LE}
"
        fi
        unset ____utf32_expect

        printf -- "%b" "$____output"
        unset ____output


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
