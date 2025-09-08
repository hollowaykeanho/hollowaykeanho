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
Interactors_FS_Append_Conf

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




____target="${PWD}/interactors/FS/Append-Conf.sh"
1>&2 printf --  "Checking '%s'...\n" "$____target"
if [ ! -f "$____target" ]; then
        1>&2 printf --  "[ FAILED ] missing file!\n"
        exit 1
fi


1>&2 printf --  "Importing function library...\n"
. "$____target"
command -V Interactors_FS_Append_Conf > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
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
____input_key1="T3sT2"
____input_value1="So3meValueHere
With Multilin
# and comment
Hwo23423
"
____input_doc1="\
# ${____input_key1}
# This is some input documentation describing this configuration.
# It can be long type as shown here.
"
____input_key2="T3sTX"
____input_value2="So3m33333t43t34ValueHere
With Multilin
# and comment
Hwo23423
"
____input_doc2="\
# ${____input_key2}
# This is some different input documentation describing this configuration.
# It can be long type as shown here.
"
____input_query="$____input_key2"
____expect_key1=""
____expect_key2="$(printf -- "%b" "${____input_value2%"\n"}")"

unset "$____input_key1" "$____input_key2"
rm -rf "$____input_file" 2> /dev/null

Interactors_FS_Write_Conf \
        "$____input_file" \
        "$____input_key1" \
        "$____input_value1" \
        "$____input_doc1"
____process_write=$?

Interactors_FS_Append_Conf \
        "$____input_file" \
        "$____input_key2" \
        "$____input_value2" \
        "$____input_doc2"
____process=$?


____artifact="$(cat "$____input_file" 2> /dev/null)"

Interactors_FS_Read_Conf "$____input_file" "$____input_query"
____process_read=$?
____output_key1="$T3sT2"
____output_key2="$T3sTX"


unset "$____input_key1" "$____input_key2"
rm -rf "$____input_file" 2> /dev/null


1>&2 printf --  "Given input (file)      :\n|%s|\n\n" "$____input_file"
1>&2 printf --  "Given input (license)   :\n|%s|\n\n" "$____input_license"
1>&2 printf --  "Given input (key1)      :\n|%s|\n\n" "$____input_key1"
1>&2 printf --  "Given input (value1)    :\n|%s|\n\n" "$____input_value1"
1>&2 printf --  "Given input (doc1)      :\n|%s|\n\n" "$____input_doc1"
1>&2 printf --  "Given input (key2)      :\n|%s|\n\n" "$____input_key2"
1>&2 printf --  "Given input (value2)    :\n|%s|\n\n" "$____input_value2"
1>&2 printf --  "Given input (doc2)      :\n|%s|\n\n" "$____input_doc2"
1>&2 printf --  "Given input (query)     :\n|%s|\n\n" "$____input_query"
1>&2 printf --  "Got expect (key1)       :\n|%s|\n\n" "$____expect_key1"
1>&2 printf --  "Got expect (key2)       :\n|%s|\n\n" "$____expect_key2"
1>&2 printf --  "Got output (key1)       :\n|%s|\n\n" "$____output_key1"
1>&2 printf --  "Got output (key2)       :\n|%s|\n\n" "$____output_key2"
1>&2 printf --  "Got artifact            :\n|%s|\n\n" "$____artifact"
1>&2 printf --  "Got return code         :\n|%s|\n\n" "$____process"
1>&2 printf --  "Got return code (read)  :\n|%s|\n\n" "$____process_read"
1>&2 printf --  "Got return code (write) :\n|%s|\n\n" "$____process_write"




# assert result
if [ $____process -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on execution!\n"
        exit 1
fi

if [ "$____output_key1" = "$____expect_key1" ] &&
[ "$____output_key2" = "$____expect_key2" ] &&
[ "$____process_read" -eq 0 ] &&
[ "$____process_write" -eq 0 ]; then
        1>&2 printf --  "[ PASSED ]\n"
        exit 0
fi

1>&2 printf --  "[ FAILED ] unexpected/inconsistent output!\n"
exit 1
