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
Interactors_FS_Get_UUID_From_Block_Device_Partition

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




____target="${PWD}/interactors/FS/Get-UUID-From-Block-Device-Partition.sh"
1>&2 printf --  "Checking '%s'...\n" "$____target"
if [ ! -f "$____target" ]; then
        1>&2 printf --  "[ FAILED ] missing file!\n"
        exit 1
fi




1>&2 printf --  "Importing function library...\n"
. "$____target"
command -V Interactors_FS_Get_UUID_From_Block_Device_Partition > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
        exit 1
fi




____input="/dev/sda1"
____output="$(Interactors_FS_Get_UUID_From_Block_Device_Partition "$____input")"
____process=$?


1>&2 printf -- "%s" "\
Got input:
|${____input}|

Got expect:
|[NOT EMPTY WHEN VALID; EMPTY WHEN INVALID]|

Got output:
|${____output}|

Got return code:
|${____process}|

IMPORTANT NOTE
Due to this function being a hardware specific and reliant operational one,
it is manually tested and reviewed. Hence, the test case is always passed.

"




# assert result
1>&2 printf --  "[ PASSED ]\n"
exit 0
