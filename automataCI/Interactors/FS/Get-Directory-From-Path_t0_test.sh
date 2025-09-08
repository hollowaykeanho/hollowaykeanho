#!/bin/sh
# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho's Proprietary License (the 'License').
# You must comply with the license to use the content. Get the License at:
#
# https://doi.org/10.5281/zenodo.13767361
#
# DO NOT SOURCE, USE, READ, MODIFY, REPRODUCE, DISTRIBUTE, RE-DISTRIBUTE,
# REVERSE ENGINEER, OR ANY OTHER ACTIONS WITH ANY PART OF THE CONTENT WITHOUT
# WRITTEN AND RATIFIED CONSENT from the copyright owners, unless the license
# explicitly allowing it.
1>&2 printf --  "%s\n" "\
TEST CASE  :
Interactors_FS_Get_Directory_From_Path

TEST ID    :
t0

DESCRIPTION:
Function can run properly with valid inputs.
"




1>&2 printf --  "Initializing Application...\n"
if [ ! -f "${PWD}/routers/init.sh" ]; then
        1>&2 printf -- "%s" "\
[ FAILED ] missing 'routers/init.sh'.
"
fi

. "${PWD}/routers/init.sh"
if [ $? -ne 0 ]; then
        1>&2 printf -- "%s" "\
[ FAILED ] error importing 'routers/init.sh'.
"
        exit 1
fi




____target="${PWD}/interactors/FS/Get-Directory-From-Path.sh"
1>&2 printf --  "Checking '%s'...\n" "$____target"
if [ ! -f "$____target" ]; then
        1>&2 printf --  "[ FAILED ] missing file!\n"
        exit 1
fi


1>&2 printf --  "Importing function library...\n"
. "$____target"
command -V Interactors_FS_Get_Directory_From_Path > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
        exit 1
fi




____input_directory="/some/directory"
____input_filename="file.ext1.ex2.ex3"
____input_path="${____input_directory}/${____input_filename}"
____expect="$____input_directory"
____output="$(Interactors_FS_Get_Directory_From_Path "$____input_path")"
____process=$?


1>&2 printf -- "%s" "\
Got input path:
|${____input_path}|

Got expect:
|${____expect}|

Got output:
|${____output}|

Got return code:
|${____process}|

"




# assert result
if [ $____process -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on execution!\n"
        exit 1
fi

if [ "$____output" = "$____expect" ]; then
        1>&2 printf --  "[ PASSED ]\n"
        exit 0
fi

1>&2 printf --  "[ FAILED ] unexpected/inconsistent output!\n"
exit 1
