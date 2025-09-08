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
HestiaKERNEL/HestiaOS/Is-Color-Mode.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaOS_To_STDERR() {
        #____string="$1"
        #____color_code="$2"
        #____bold="$3"
        #____italic="$4"
        #____blink="$5"


        # validate input
        if [ "$1" = "" ]; then
                return $HestiaSIGNALS_DATA_EMPTY
        fi


        # execute
        if [ ! "$(HestiaOS_Is_Color_Mode)" = $HestiaSIGNALS_OK ]; then
                # formatting terminal is unavailable
                1>&2 printf -- "%b" "$1"
                return $HestiaSIGNALS_OK
        elif [ "$2" = "" ] && [ "$3" = "" ] &&
        [ "$4" = "" ] && [ "$5" = "" ]; then
                # no formatting requested
                1>&2 printf -- "%b" "$1"
                return $HestiaSIGNALS_OK
        fi


        # configure formatting
        ____string_code_control="\\033["

        ## set bold
        if [ ! "$3" = "" ]; then
                ____string_code_control="${____string_code_control}1;"
        fi

        ## set italic
        if [ ! "$4" = "" ]; then
                ____string_code_control="${____string_code_control}3;"
        fi

        ## set blink
        if [ ! "$5" = "" ]; then
                ____string_code_control="${____string_code_control}5;"
        fi

        ## set color
        if [ "$(HestiaNUMBERS_Is_Number "$2")" -eq $HestiaSIGNALS_OK ]; then
                if [ "$2" -gt 0 ]; then
                        ____string_code_control="${____string_code_control}${2};"
                fi
        fi

        ## ok - output now
        1>&2 printf -- "%b" "${____string_code_control%;}m${1}\\033[0m"
        unset ____string_code_control


        # report status
        return $HestiaSIGNALS_OK
}




# report import status
return 0
