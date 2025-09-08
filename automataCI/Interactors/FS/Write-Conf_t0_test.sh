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
Interactors_FS_Write_Conf

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




____target="${PWD}/interactors/FS/Write-Conf.sh"
1>&2 printf --  "Checking '%s'...\n" "$____target"
if [ ! -f "$____target" ]; then
        1>&2 printf --  "[ FAILED ] missing file!\n"
        exit 1
fi


1>&2 printf --  "Importing function library...\n"
. "$____target"
command -V Interactors_FS_Write_Conf > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
        exit 1
fi




____target="${PWD}/interactors/FS/Read-Conf.sh"
1>&2 printf --  "Checking '%s'...\n" "$____target"
if [ ! -f "$____target" ]; then
        1>&2 printf --  "[ FAILED ] missing file!\n"
        exit 1
fi


1>&2 printf --  "Importing function library...\n"
. "$____target"
command -V Interactors_FS_Read_Conf > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
        exit 1
fi




____input_file="./test_file.conf"
____input_key="T3sT2"
____input_value="So3meValueHere
With Multilin
# and comment
Hwo23423
"
____input_doc="\
# ${____input_key}
# This is some input documentation describing this configuration.
# It can be long type as shown here.
"
____expect="$(printf -- "%b" "${____input_value%"\n"}")"

unset "$____input_key"
rm -rf "$____input_file" 2> /dev/null

Interactors_FS_Write_Conf \
        "$____input_file" \
        "$____input_key" \
        "$____input_value" \
        "$____input_doc"
____process=$?


____artifact="$(cat "$____input_file" 2> /dev/null)"

Interactors_FS_Read_Conf "$____input_file" "$____input_query"
____process_read=$?
____output="$T3sT2"


unset "$____input_key"
rm -rf "$____input_file" 2> /dev/null


1>&2 printf --  "Given input (file)     :\n|%s|\n\n" "$____input_file"
1>&2 printf --  "Given input (license)  :\n|%s|\n\n" "$____input_license"
1>&2 printf --  "Given input (key)      :\n|%s|\n\n" "$____input_key"
1>&2 printf --  "Given input (value)    :\n|%s|\n\n" "$____input_value"
1>&2 printf --  "Given input (doc)      :\n|%s|\n\n" "$____input_doc"
1>&2 printf --  "Got expect             :\n|%s|\n\n" "$____expect"
1>&2 printf --  "Got output             :\n|%s|\n\n" "$____output"
1>&2 printf --  "Got artifact           :\n|%s|\n\n" "$____artifact"
1>&2 printf --  "Got return code        :\n|%s|\n\n" "$____process"
1>&2 printf --  "Got return code (read) :\n|%s|\n\n" "$____process_read"




# assert result
if [ $____process -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on execution!\n"
        exit 1
fi

if [ "$____output" = "$____expect" ] &&
[ "$____process_read" -eq 0 ]; then
        1>&2 printf --  "[ PASSED ]\n"
        exit 0
fi

1>&2 printf --  "[ FAILED ] unexpected/inconsistent output!\n"
exit 1
