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
HestiaKERNEL/HestiaUNICODES/Is-Unicode.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_Is_UUID() {
        #____unicode="$1"


        # execute
        if [ "$1" = "" ]; then
                1>&2 printf -- "%s" "$HestiaSIGNALS_DATA_EMPTY"
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ $(HestiaUNICODES_Is_Unicode "$1") -ne $HestiaSIGNALS_OK ]; then
                1>&2 printf -- "%s" "$HestiaSIGNALS_DATA_INVALID"
                return $HestiaSIGNALS_DATA_INVALID
        fi

        ____content="$1"
        ____index=0
        while [ ! "$____content" = "" ]; do
                # get current character
                ____current="${____content%%, *}"
                ____content="${____content#"$____current"}"
                if [ "${____content%"${____content#?}"}" = "," ]; then
                        ____content="${____content#, }"
                fi

                case "$____index" in
                8|13|18|23)
                        if [ "$____current" -eq 45 ]; then
                                # '-' (0x002D)
                                ____index=$(($____index + 1))
                                continue
                        fi
                        ;;
                *)
                        ;;
                esac

                if [ "$____current" -ge 48 ] && [ "$____current" -le 57 ]; then
                        : # '0' (0x30) to '9' (0x0039)
                elif [ "$____current" -ge 65 ] && [ "$____current" -le 70 ]; then
                        : # 'A' (0x41) to 'F' (0x0046)
                elif [ "$____current" -ge 97 ] && [ "$____current" -le 102 ]; then
                        : # 'a' (0x97) to 'f' (0x0066)
                else
                        unset ____content ____current ____index
                        1>&2 printf -- "%s" "$HestiaSIGNALS_DATA_INVALID"
                        return $HestiaSIGNALS_DATA_INVALID
                fi

                ____index=$(($____index + 1))
        done
        unset ____content ____current ____index


        # report status
        1>&2 printf -- "%s" "$HestiaSIGNALS_OK"
        return $HestiaSIGNALS_OK
}




# report import status
return 0
