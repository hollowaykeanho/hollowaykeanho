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
HestiaKERNEL/HestiaLISTS/Is-Array-Byte.sh
HestiaKERNEL/HestiaOS/Codes-Endian.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaUNICODES/Codes.sh
HestiaKERNEL/HestiaUNICODES/Is-Unicode.sh
HestiaKERNEL/HestiaUNICODES/Is-UTF.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_To_Unicode_From_UTF16() {
        #____input_content="$1"
        #____input_endian="$2"


        # validate input
        if [ "$1" = "" ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ "$(HestiaLISTS_Is_Array_Byte "$1")" -ne $HestiaSIGNALS_OK ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # execute
        ## IMPORTANT NOTICE
        ## POSIX Shell does not handle UTF-16 byte stream in an isolated manner
        ## without messing up the current terminal's $LANG settings. To avoid
        ## it, manual implementations are required.
        ##
        ## From the Unicode engineering specification, the default endian is
        ## big-endian.


        # check for data encoder
        ____endian=$HestiaOS_ENDIAN_BIG
        ____ignore=0
        ____output="$(HestiaUNICODES_Is_UTF "$1")"
        if [ ! "${____output#*"$HestiaUNICODES_UTF16LE_BOM"}" = "$____output" ]; then
                # it's UTF16LE with BOM marker
                ____endian=$HestiaOS_ENDIAN_LITTLE
                ____ignore=2
        elif [ ! "${____output#*"$HestiaUNICODES_UTF16BE_BOM"}" = "$____output" ]; then
                # it's UTF16BE with BOM marker
                ____endian=$HestiaOS_ENDIAN_BIG
                ____ignore=2
        elif [ ! "${____output#*"$HestiaUNICODES_UTF16LE"}" = "$____output" ] &&
                [ ! "${____output#*"$HestiaUNICODES_UTF16BE"}" = "$____output" ]; then
                # both UTF16LE or UTF16BE can be a candidate
                if [ "$2" = "$HestiaOS_ENDIAN_LITTLE" ] ||
                [ "$2" = "$HestiaOS_ENDIAN_BIG" ]; then
                        # If there is a valid hint, take the hint
                        ____endian="$2"
                else
                        : # keep the default
                fi
        else
                # not a UTF byte array
                printf -- ""
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # process to unicode
        ____content="$1"
        ____converted=""
        ____char=0
        ____state=0
        ____register16=0
        while [ ! "$____content" = "" ]; do
                # get current byte
                ____byte="${____content%%, *}"
                ____content="${____content#"$____byte"}"
                if [ "${____content%"${____content#?}"}" = "," ]; then
                        ____content="${____content#, }"
                fi


                # ignore BOM markers
                if [ $____ignore -gt 0 ]; then
                        ____ignore=$(($____ignore - 1))
                        continue
                fi


                # process byte data serially
                case "$____state" in
                1)
                        case "$____endian" in
                        $HestiaOS_ENDIAN_LITTLE)
                                ____byte=$(($____byte << 8))
                                ____char=$(($____char | $____byte))
                                ;;
                        *)
                                ____char=$(($____char | $____byte))
                                ;;
                        esac

                        if [ $____char -ge 56320 ]; then
                                # char > 0xDC00 - 0x10000-0x10FFFF (low surrogate)
                                ____char=$(($____char - 0xDC00))
                                ____char=$(($____char & 0x3FF))

                                # NOTICE
                                # Some encoders do not conform to HIGH-LOW surrogate pair format
                                # (e.g. LOW-HIGH, LOW-?, and ?-HIGH). Hence, to be adaptive, we
                                # cage it conditionally and only output once a pair is perfectly
                                # fulfilled.
                                if [ $____register16 -eq 0 ]; then
                                        ____register16=$(($____register16 + $____char))
                                else
                                        ____register16=$(($____register16 + $____char + 0x10000))
                                        ____converted="${____converted}$(printf -- "%d" "$____register16"), "
                                        ____register16=0
                                fi
                        elif [ $____char -ge 55296 ]; then
                                # char > 0xD800 - 0x10000-0x10FFFF (high surrogate)
                                ____char=$(($____char - 0xD800))
                                ____char=$(($____char & 0x3FF))
                                ____char=$(($____char << 10))

                                # NOTICE
                                # Some encoders do not conform to HIGH-LOW surrogate pair format
                                # (e.g. LOW-HIGH, LOW-?, and ?-HIGH). Hence, to be adaptive, we
                                # cage it conditionally and only output once a pair is perfectly
                                # fulfilled.
                                if [ $____register16 -eq 0 ]; then
                                        ____register16=$(($____register16 + $____char))
                                else
                                        ____register16=$(($____register16 + $____char + 0x10000))
                                        ____converted="${____converted}$(printf -- "%d" "$____register16"), "
                                        ____register16=0
                                fi
                        else
                                # char < 0x10000

                                # NOTICE
                                # Some encoders do not conform to HIGH-LOW surrogate pair format
                                # (e.g. LOW-HIGH, LOW-?, and ?-HIGH). Hence, to be adaptive, we
                                # cage it conditionally and only output once a pair is perfectly
                                # fulfilled.
                                if [ $____register16 -ne 0 ]; then
                                        # ERROR - expect surrogate pair; got char
                                        printf -- ""
                                        unset ____endian \
                                                ____ignore \
                                                ____output \
                                                ____content \
                                                ____char \
                                                ____state \
                                                ____register16 \
                                                ____byte \
                                                ____converted
                                        return $HestiaSIGNALS_DATA_BAD
                                fi

                                ____converted="${____converted}$(printf -- "%d" "$____char"), "
                        fi

                        ____state=0
                        ;;
                *)
                        case "$____endian" in
                        $HestiaOS_ENDIAN_LITTLE)
                                ____char=$____byte
                                ;;
                        *)
                                ____char=$(($____byte << 8))
                                ;;
                        esac

                        ____state=1
                        ;;
                esac
        done
        unset ____endian \
                ____ignore \
                ____output \
                ____content \
                ____char \
                ____state \
                ____register16 \
                ____byte

        printf -- "%s" "${____converted%, }"
        unset ____converted


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
