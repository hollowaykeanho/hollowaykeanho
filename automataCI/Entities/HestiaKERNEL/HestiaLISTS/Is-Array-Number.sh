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
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaLISTS_Is_Array_Number() {
        #____content="$1"
        #____symbol_separator="$2"


        # validate input
        if [ "$1" = "" ]; then
                printf -- "%d" $HestiaSIGNALS_DATA_EMPTY
                return $HestiaSIGNALS_DATA_EMPTY
        fi


        # execute
        if [ "$2" = "" ] && (
                [ ! "${1##*"
"}" = "$1" ] ||
                [ ! "${1#*"\n"}" = "$1" ]
        ); then
                # POSIX Shell specific - newline separator (1 value per line)
                ____old_IFS="$IFS"
                while IFS="" read -r ____data || [ -n "$____data" ]; do
                        if [ "$____data" = "" ]; then
                                continue
                        fi

                        if [ $(HestiaNUMBERS_Is_Number "$____data") -ne $HestiaSIGNALS_OK ]; then
                                IFS="$____old_IFS"
                                unset ____data ____old_IFS
                                printf -- "%d" $HestiaSIGNALS_DATA_INVALID
                                return $HestiaSIGNALS_DATA_INVALID
                        fi
                done<<EOF
${1}
EOF
                IFS="$____old_IFS"
                unset ____data ____old_IFS
        else
                # symbol separator (default ', ')
                ____content="$1"
                while [ -n "$____content" ]; do
                        ____data="${____content%%"${2:-", "}"*}"
                        ____content="${____content#"$____data"}"
                        ____content="${____content#"${2:-", "}"}"
                        if [ $(HestiaNUMBERS_Is_Number "$____data") -ne $HestiaSIGNALS_OK ]; then
                                unset ____data ____content
                                printf -- "%d" $HestiaSIGNALS_DATA_INVALID
                                return $HestiaSIGNALS_DATA_INVALID
                        fi
                done
                unset ____data ____content
        fi


        # report status
        printf -- "%d" $HestiaSIGNALS_OK
        return $HestiaSIGNALS_OK
}




# report import status
return 0
