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
HestiaKERNEL/HestiaFS/Get-Symbolic-Link-Source.sh
HestiaKERNEL/HestiaFS/Is-Directory.sh
HestiaKERNEL/HestiaFS/Is-Exist.sh
HestiaKERNEL/HestiaFS/Is-File.sh
HestiaKERNEL/HestiaFS/Is-Pipe.sh
HestiaKERNEL/HestiaFS/Is-Socket.sh
HestiaKERNEL/HestiaFS/Is-Symbolic-Link.sh
HestiaKERNEL/HestiaOS/Is-Command-Available.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaSTRINGS/Trim-Whitespace.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaFS_Get_Total_Block_Size() {
        #____path="$1"


        # verify input emptiness
        if [ "$1" = "" ]; then
                printf -- "%s" ""
                return $HestiaSIGNALS_DATA_EMPTY
        fi

        if [ "$(HestiaFS_Is_Exist "$1")" -ne $HestiaSIGNALS_OK ]; then
                printf -- "%s" ""
                return $HestiaSIGNALS_DATA_INVALID
        fi

        if [ "$(HestiaFS_Is_Socket "$1")" -eq $HestiaSIGNALS_OK ]; then
                printf -- "%s" ""
                return $HestiaSIGNALS_DATA_INVALID
        fi

        if [ "$(HestiaFS_Is_Pipe "$1")" -eq $HestiaSIGNALS_OK ]; then
                printf -- "%s" ""
                return $HestiaSIGNALS_DATA_INVALID
        fi


        # execute
        ## resolve symbolic link when given one
        ____target="$1"
        if [ "$(HestiaFS_Is_Symbolic_Link "$1")" -eq $HestiaSIGNALS_OK ]; then
                ____target="$(HestiaFS_Get_Symbolic_Link_Source "$1")"
        fi

        ## handles file and directory type
        if [ "$(HestiaFS_Is_Directory "$____target")" -eq $HestiaSIGNALS_OK ] ||
        [ "$(HestiaFS_Is_File "$____target")" -eq $HestiaSIGNALS_OK ]; then
                if [ "$(HestiaOS_Is_Command_Available "du")" -eq $HestiaSIGNALS_OK ]; then
                        ____line="$(du --block-size=1 --summarize "$____target" 2> /dev/null)"
                        if [ $? -ne 0 ]; then
                                printf -- "%s" ""
                                unset ____line ____target
                                return $HestiaSIGNALS_BAD_EXEC
                        fi
                        ____line="${____line%%"$____target"*}"
                        ____line="$(HestiaSTRINGS_Trim_Whitespace "$____line")"

                        printf -- "%s" "$____line"
                        if [ $? -ne 0 ]; then
                                printf -- "%s" ""
                                unset ____line ____target
                                return $HestiaSIGNALS_BAD_EXEC
                        fi
                        unset ____line ____target

                        # all good
                        return $HestiaSIGNALS_OK
                fi

                # no other supported facility
                printf -- "%s" ""
                return $HestiaSIGNALS_UNSUPPORTED
        fi

        ## assume block device & its partition type
        unset ____target
        if [ "$(HestiaOS_Is_Command_Available "df")" -eq $HestiaSIGNALS_OK ]; then
                ____line="$(df --output=used --block-size=1 "$1")"
                if [ $? -ne 0 ]; then
                        unset ____line
                        return $HestiaSIGNALS_BAD_EXEC
                fi

                ____line="${____line#*"
"}"
                ____line="$(HestiaSTRINGS_Trim_Whitespace "$____line")"
                printf -- "%s" "$____line"
                if [ $? -ne 0 ]; then
                        unset ____line
                        return $HestiaSIGNALS_BAD_EXEC
                fi
                unset ____line

                # all good
                return $HestiaSIGNALS_OK
        fi


        # report status
        printf -- "%s" ""
        return $HestiaSIGNALS_UNSUPPORTED
}




# report import status
return 0
