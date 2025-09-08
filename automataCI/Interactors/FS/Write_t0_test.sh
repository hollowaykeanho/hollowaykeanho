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
Interactors_FS_Write

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




____target="${PWD}/interactors/FS/Read.sh"
1>&2 printf --  "Checking '%s'...\n" "$____target"
if [ ! -f "$____target" ]; then
        1>&2 printf --  "[ FAILED ] missing file!\n"
        exit 1
fi


1>&2 printf --  "Importing function library...\n"
. "$____target"
command -V Interactors_FS_Write > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
        exit 1
fi




____input_file="./test_file.conf"
____input_content="Hello World
"
____expect="$____input_content"
rm -rf "$____input_file" 2> /dev/null

Interactors_FS_Write "$____input_file" "$____input_content"
____process=$?
____artifact="$(cat "$____input_file" 2> /dev/null)"


____output=""
if [ -f "$____input_file" ]; then
        ____old_IFS="$IFS"
        while IFS="" read -r ____line || [ -n "$____line" ]; do
                ____output="${____output}${____line}
"
        done < "$____input_file"
        IFS="$____old_IFS"
        unset ____line ____old_IFS
fi

rm -rf "$____input_file" 2> /dev/null


1>&2 printf --  "Given input (file)     :\n|%s|\n\n" "$____input_file"
1>&2 printf --  "Given input (content)  :\n|%s|\n\n" "$____input_content"
1>&2 printf --  "Got expect             :\n|%s|\n\n" "$____expect"
1>&2 printf --  "Got output             :\n|%s|\n\n" "$____output"
1>&2 printf --  "Got artifact           :\n|%s|\n\n" "$____artifact"
1>&2 printf --  "Got return code        :\n|%s|\n\n" "$____process"




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
