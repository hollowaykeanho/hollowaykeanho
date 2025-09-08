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




HestiaUNICODES_To_Unicode_From_UTF8() {
        #____input_content="$1"


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
        ## POSIX Shell does not handle UTF-8 byte stream in an isolated manner
        ## without messing up the current terminal's $LANG settings. To avoid
        ## it, manual implementations are required.
        ##
        ## From the Unicode engineering specification, the default endian is
        ## big-endian.


        # check for data encoder
        ____endian=$HestiaOS_ENDIAN_BIG
        ____ignore=0
        ____output="$(HestiaUNICODES_Is_UTF "$1")"
        if [ ! "${____output#*"$HestiaUNICODES_UTF8_BOM"}" = "$____output" ]; then
                # it's UTF8 with BOM marker
                ____ignore=3
        elif [ ! "${____output#*"$HestiaUNICODES_UTF8"}" = "$____output" ]; then
                : # UTF8 is a candidate
        else
                # not a UTF byte array
                printf -- ""
                unset ____endian ____ignore ____output
                return $HestiaSIGNALS_DATA_INVALID
        fi

        ____content="$1"
        ____converted=""
        ____char=0
        ____state=0
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


                # identify initial state
                if [ $____state -ne 0 ]; then
                        : # it's a tailing operation - DO NOTHING
                elif [ $____byte -lt 200 ]; then
                        # x < 0x80 (char < 0x80)
                        ____state=0
                elif [ $____byte -gt 193 ] && [ $____byte -lt 200 ]; then
                        # 0xBF < x < 0xE0 (char < 0x800)
                        ____state=1
                elif [ $____byte -gt 223 ] && [ $____byte -lt 240 ]; then
                        # 0xDF < x < 0xF0 (char < 0x10000)
                        ____state=3
                else
                        # 0x10000-0x10FFFF (surrogate pair)
                        ____state=6
                fi

                case "$____state" in
                9)
                        ____byte=$(($____byte & 0x3F))
                        ____char=$(($____char | $____byte))
                        ____converted="${____converted}$(printf -- "%d" "$____char"), "

                        ____state=0
                        ;;
                8)
                        ____byte=$(($____byte & 0x3F))
                        ____byte=$(($____byte << 6))
                        ____char=$(($____char | $____byte))

                        ____state=9
                        ;;
                7)
                        ____byte=$(($____byte & 0x3F))
                        ____byte=$(($____byte << 12))
                        ____char=$(($____char | $____byte))

                        ____state=8
                        ;;
                6)
                        # 0x10000-0x10FFFF (surrogate pair)
                        ____byte=$(($____byte & 0x07))
                        ____char=$(($____byte << 18))

                        ____state=7
                        ;;
                5)
                        ____byte=$(($____byte & 0x3F))
                        ____char=$(($____char | $____byte))
                        ____converted="${____converted}$(printf -- "%d" "$____char"), "

                        ____state=0
                        ;;
                4)
                        ____byte=$(($____byte & 0x3F))
                        ____byte=$(($____byte << 6))
                        ____char=$(($____char | $____byte))

                        ____state=5
                        ;;
                3)
                        # 0xDF < x < 0xF0 (char < 0x10000)
                        ____byte=$(($____byte & 0x0F))
                        ____char=$(($____byte << 12))

                        ____state=4
                        ;;
                2)
                        ____byte=$(($____byte & 0x3F))
                        ____char=$(($____char | $____byte))
                        ____converted="${____converted}$(printf -- "%d" "$____char"), "

                        ____state=0
                        ;;
                1)
                        # 0xBF < x < 0xE0 (char < 0x800)
                        ____byte=$(($____byte & 0x1F))
                        ____char=$(($____byte << 6))

                        ____state=2
                        ;;
                *)
                        # x < 0x80 (char < 0x80)
                        ____converted="${____converted}$(printf -- "%d" "$____byte"), "

                        ____state=0
                        ;;
                esac
        done
        unset ____byte \
                ____state \
                ____char \
                ____content \
                ____endian \
                ____ignore \
                ____output

        printf -- "%s" "${____converted%, }"
        unset ____converted


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
