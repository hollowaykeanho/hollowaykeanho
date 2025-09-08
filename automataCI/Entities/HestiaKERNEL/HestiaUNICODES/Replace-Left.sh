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
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaUNICODES_Replace_Left() {
        #____content_unicode="$1"
        #____from_unicode="$2"
        #____to_unicode="$3"
        #____count="$4"
        #____ignore="$5"


        # validate input
        if [ $(HestiaUNICODES_Is_Unicode "$1") -ne $HestiaSIGNALS_OK ]; then
                printf -- "%s" "$1"
                return $HestiaSIGNALS_ENTITY_EMPTY
        fi

        if [ $(HestiaUNICODES_Is_Unicode "$2") -ne $HestiaSIGNALS_OK ]; then
                printf -- "%s" "$1"
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ ! "$3" = "" ]; then
                if [ $(HestiaUNICODES_Is_Unicode "$3") -ne $HestiaSIGNALS_OK ]; then
                        printf -- "" ""
                        return $HestiaSIGNALS_DATA_INVALID
                fi
        fi

        ____count=-1
        if [ $(HestiaNUMBERS_Is_Number "$4") -eq $HestiaSIGNALS_OK ]; then
                ____count="$4"
        fi

        ____ignore=-1
        if [ $(HestiaNUMBERS_Is_Number "$5") -eq $HestiaSIGNALS_OK ]; then
                ____ignore="$5"
        fi


        # execute
        ____converted=""
        ____buffer=""
        ____content_unicode="$1"
        ____from_unicode="$2"
        ____to_unicode="$3"
        ____is_replacing=0
        while [ ! "$____content_unicode" = "" ]; do
                # get current character
                ____current="${____content_unicode%%, *}"
                ____content_unicode="${____content_unicode#"$____current"}"
                if [ "${____content_unicode%"${____content_unicode#?}"}" = "," ]; then
                        ____content_unicode="${____content_unicode#, }"
                fi

                if [ $____is_replacing -ne 0 ]; then
                        ____converted="${____converted}${____current}, "
                        continue
                fi


                # get from character
                ____from="${____from_unicode%%, *}"
                ____from_unicode="${____from_unicode#"$____from"}"
                if [ "${____from_unicode%"${____from_unicode#?}"}" = "," ]; then
                        ____from_unicode="${____from_unicode#, }"
                fi


                # bail if mismatched
                if [ ! "$____current" = "$____from" ]; then
                        ____from_unicode="$2"

                        if [ ! "$____buffer" = "" ]; then
                                ____converted="${____converted}${____buffer%, }, "
                                ____buffer=""
                        fi

                        ____converted="${____converted}${____current}, "
                        continue
                fi


                # it's a match - save to buffer if the scan is still ongoing
                if [ ! "$____from_unicode" = "" ]; then
                        ____buffer="${____buffer}${____current}, "
                        continue
                fi


                # complete match - perform replacement
                if [ $____ignore -le 0 ]; then
                        if [ ! "$____to_unicode" = "" ]; then
                                ____converted="${____converted}${____to_unicode}, "
                        fi

                        if [ $____count -gt 0 ]; then
                                ____count=$(($____count - 1))
                                if [ $____count -le 0 ]; then
                                        ____is_replacing=1
                                        ____buffer=""

                                        continue
                                fi
                        fi
                else
                        if [ ! "$____buffer" = "" ]; then
                                ____converted="${____converted}${____buffer%, }, "
                        fi

                        ____converted="${____converted}${____current}, "
                        ____ignore=$(($____ignore - 1))
                fi

                ____buffer=""
                ____from_unicode="$2"
        done
        unset ____current \
                ____from \
                ____is_replacing \
                ____ignore \
                ____count \
                ____from_unicode \
                ____to_unicode \
                ____content_unicode

        if [ ! "$____to_unicode" = "" ] && [ ! "$____buffer" = "" ]; then
                ____converted="${____converted}${____buffer%, }, "
        fi
        unset ____buffer

        printf -- "%b" "${____converted%, }"
        unset ____converted


        # report status
        return $HestiaSIGNALS_OK
}
