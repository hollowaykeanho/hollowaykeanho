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
Interactors_FS_Read

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
command -V Interactors_FS_Read > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
        exit 1
fi




____input_file="./test_file.conf"
____input_encoder=""
____input_IFS=""
____input_content="Hello World
Gardalina"
____input_function="_read_line"
____output=""
_read_line() {
        ____output="${____output}${1}
"
        return 0
}
____expect="Hello World
Gardalina
"

rm -rf "$____input_file" 2> /dev/null
printf -- "%s" "$____input_content" > "$____input_file"


Interactors_FS_Read \
        "$____input_file" \
        "$____input_function" \
        "$____input_encoder" \
        "$____input_IFS"
____process=$?


rm -rf "$____input_file" 2> /dev/null


1>&2 printf --  "Given input (file)       :\n|%s|\n\n" "$____input_file"
1>&2 printf --  "Given input (content)    :\n|%s|\n\n" "$____input_content"
1>&2 printf --  "Given input (function)   :\n|%s|\n\n" "$____input_function"
1>&2 printf --  "Given input (encoder)    :\n|%s|\n\n" "$____input_encoder"
1>&2 printf --  "Given input (IFS)        :\n|%s|\n\n" "$____input_IFS"
1>&2 printf --  "Got expect               :\n|%s|\n\n" "$____expect"
1>&2 printf --  "Got output               :\n|%s|\n\n" "$____output"
1>&2 printf --  "Got return code          :\n|%s|\n\n" "$____process"




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
