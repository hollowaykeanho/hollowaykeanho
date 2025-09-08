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
HestiaKERNEL/HestiaUNICODES/Is-Unicode.sh
HestiaKERNEL/HestiaUNICODES/rune-to-lowercase.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_To_Lowercase() {
        #____unicode="$1"
        #____locale="$2"


        # validate input
        if [ "$1" = "" ]; then
                printf -- "%s" ""
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ $(HestiaUNICODES_Is_Unicode "$1") -ne $HestiaSIGNALS_OK ]; then
                printf -- "%s" "$1"
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # execute
        ____content="$1"
        ____converted=""
        while [ ! "$____content" = "" ]; do
                # get current character
                ____current="${____content%%, *}"
                ____content="${____content#"$____current"}"
                if [ "${____content%"${____content#?}"}" = "," ]; then
                        ____content="${____content#, }"
                fi

                # get next character (look forward by 1)
                ____next=0
                if [ ! "$____content" = "" ]; then
                        ____next="${____content%%, *}"
                fi

                # get third character (look forward by 2)
                ____third="${____content#${____next}}"
                if [ ! "$____third" = "" ]; then
                        if [ "${____third%"${____third#?}"}" = "," ]; then
                                ____third="${____third#, }"
                        fi

                        ____third="${____third%%, *}"
                        if [ "$____third" = "" ]; then
                                ____third=0
                        fi
                else
                        ____third=0
                fi

                # proceed to default conversion
                ____ret="$( \
                        hestiaUNICODES_Rune_To_Lowercase \
                                "$____current" \
                                "$____next" \
                                "$____third" \
                                "$2" \
                )"

                ____scanned=""
                ____old_IFS="$IFS"
                while IFS="" read -r ____line || [ -n "$____line" ]; do
                        if [ "$____line" = "" ]; then
                                continue
                        fi

                        if [ "$____scanned" = "" ]; then
                                ____scanned="$____line"
                        else
                                ____converted="${____converted}${____line}, "
                        fi
                done<<EOF
${____ret}
EOF
                IFS="$____old_IFS"
                unset ____line ____old_IFS

                # prepare for next scan
                while [ $____scanned -gt 1 ]; do
                        if [ "$____content" = "" ]; then
                                break
                        fi

                        ____content="${____content#"${____content%%, *}"}"
                        if [ "${____content%"${____content#?}"}" = "," ]; then
                                ____content="${____content#, }"
                        fi

                        ____scanned=$(($____scanned - 1))
                done
        done
        unset ____content \
                ____current \
                ____next \
                ____third \
                ____ret \
                ____scanned

        printf -- "%s" "${____converted%, }"
        unset ____converted


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
