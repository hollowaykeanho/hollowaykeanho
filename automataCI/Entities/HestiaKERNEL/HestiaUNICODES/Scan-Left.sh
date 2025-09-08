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




HestiaUNICODES_Scan_Left() {
        #____content_unicode="$1"
        #____target_unicode="$2"
        #____count="$3"
        #____ignore="$4"


        # validate input
        if [ $(HestiaUNICODES_Is_Unicode "$1") -ne $HestiaSIGNALS_OK ]; then
                printf -- ""
                return $HestiaSIGNALS_ENTITY_EMPTY
        fi

        if [ $(HestiaUNICODES_Is_Unicode "$2") -ne $HestiaSIGNALS_OK ]; then
                printf -- ""
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        ____count=-1
        if [ $(HestiaNUMBERS_Is_Number "$3") -eq $HestiaSIGNALS_OK ]; then
                ____count="$3"
        fi

        ____ignore=-1
        if [ $(HestiaNUMBERS_Is_Number "$4") -eq $HestiaSIGNALS_OK ]; then
                ____ignore="$4"
        fi


        # execute
        ____scan_index=-1
        ____list_index=""
        ____content_unicode="$1"
        ____target_unicode="$2"
        ____index=0
        while [ ! "$____content_unicode" = "" ]; do
                # get current character
                ____current="${____content_unicode%%, *}"
                ____content_unicode="${____content_unicode#"$____current"}"
                if [ "${____content_unicode%"${____content_unicode#?}"}" = "," ]; then
                        ____content_unicode="${____content_unicode#, }"
                fi

                # get target character
                ____target="${____target_unicode%%, *}"
                ____target_unicode="${____target_unicode#"$____target"}"
                if [ "${____target_unicode%"${____target_unicode#?}"}" = "," ]; then
                        ____target_unicode="${____target_unicode#, }"
                fi

                # bail if mismatched
                if [ ! "$____current" = "$____target" ]; then
                        ____scan_index=-1
                        ____target_unicode="$2"
                        ____index=$(($____index + 1))
                        continue
                fi

                # it's a match - set $___scan_index if available
                if [ $____scan_index -lt 0 ]; then
                        ____scan_index=$____index
                fi

                # reset if target is fully scanned
                if [ "$____target_unicode" = "" ]; then
                        if [ $____ignore -le 0 ]; then
                                ____list_index="${____list_index}${____scan_index}\n"
                                if [ $____count -gt 0 ]; then
                                        ____count=$(($____count - 1))
                                        if [ $____count -le 0 ]; then
                                                break
                                        fi
                                fi
                        else
                                ____ignore=$(($____ignore - 1))
                        fi

                        ____scan_index=-1
                        ____target_unicode="$2"
                fi

                # more characters - increase index and continue
                ____index=$(($____index + 1))
        done
        unset ____count \
                ____ignore \
                ____scan_index \
                ____index \
                ____current \
                ____target \
                ____target_unicode \
                ____content_unicode

        printf -- "%b" "${____list_index%"\n"}"
        unset ____list_index


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
