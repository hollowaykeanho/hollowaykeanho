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
HestiaKERNEL/HestiaBOOLEANS/Is-True.sh
HestiaKERNEL/HestiaFS/Create-Directory.sh
HestiaKERNEL/HestiaFS/Delete.sh
HestiaKERNEL/HestiaFS/Get-Directory-From-Path.sh
HestiaKERNEL/HestiaFS/Write-File.sh
HestiaKERNEL/HestiaOS/To-STDERR.sh
HestiaKERNEL/HestiaSIGNALS/Codes.sh
HestiaKERNEL/HestiaTESTS/Codes-Verdict.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




HestiaTESTS_Exec_Case() {
        #____filepath="$1"
        #____filepath_log="$2"
        #____quiet_mode="$3"


        # validate input
        if [ "$1" = "" ]; then
                return $HestiaTESTS_FAILED
        fi

        if [ ! -f "$1" ]; then
                return $HestiaTESTS_FAILED
        fi


        # execute
        ____output="$(2>&1 /bin/sh "$1")"
        ____process=$?
        if [ ! "$2" = "" ]; then
                # external log file - report regardless
                HestiaFS_Create_Directory \
                        "$(HestiaFS_Get_Directory_From_Path "$2")"
                HestiaFS_Delete "$2"
                HestiaFS_Write_File "$2" "$____output"
        fi

        # report status
        case $____process in
        $HestiaTESTS_PASSED)
                if [ "$(HestiaBOOLEANS_Is_True "$3")" -ne $HestiaSIGNALS_OK ]; then
                        # printout is requested
                        HestiaOS_To_STDERR "${____output}\n" "92"
                fi

                unset ____process ____output
                return $HestiaTESTS_PASSED
                ;;
        $HestiaTESTS_SKIPPED)
                if [ "$(HestiaBOOLEANS_Is_True "$3")" -ne $HestiaSIGNALS_OK ]; then
                        # printout is requested
                        HestiaOS_To_STDERR "${____output}\n" "93"
                fi

                unset ____process ____output
                return $HestiaTESTS_SKIPPED
                ;;
        *)
                HestiaOS_To_STDERR "${____output}\n" "91"
                unset ____process ____output
                return $HestiaTESTS_FAILED
                ;;
        esac
}




# report import status
return 0
