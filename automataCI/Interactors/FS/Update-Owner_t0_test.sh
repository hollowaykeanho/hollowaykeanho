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
Interactors_FS_Update_Owner

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




____target="${PWD}/interactors/FS/Update-Owner.sh"
1>&2 printf --  "Checking '%s'...\n" "$____target"
if [ ! -f "$____target" ]; then
        1>&2 printf --  "[ FAILED ] missing file!\n"
        exit 1
fi




1>&2 printf --  "Importing function library...\n"
. "$____target"
command -V Interactors_FS_Update_Owner > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
        exit 1
fi




if [ "$(id -u)" -ne 0 ]; then
        1>&2 printf -- "%s" "\
W: HestiaFS_Update_Owner can only be done by root and this test is not
W: ran by 'root' account. Therefore, skipping.
"
        exit 2
fi



____input_file="./test_file.txt"
____input_owner_before="1755"
____input_group_before="1756"
____input_owner_after="1111"
____input_group_after="1112"
____expect=""
____expect_actual="${____input_owner_after}:${____input_group_after}"

rm -rf "$____input_file" 2> /dev/null
printf -- "hello world\n" > "$____input_file"

____output="$( \
        Interactors_FS_Update_Owner \
                "$____input_file" \
                "$____input_owner_after" \
                "$____input_group_after" \
)"
____process=$?

____actual="$(stat -c "%u:%g" "$____input_file")"
rm -rf "$____input_file" 2> /dev/null

1>&2 printf --  "Given input (file)         :\n|%s|\n\n" "$____input_file"
1>&2 printf --  "Given input owner (before) :\n|%s|\n\n" "$____input_owner_before"
1>&2 printf --  "Given input group (before) :\n|%s|\n\n" "$____input_group_before"
1>&2 printf --  "Given input owner (after)  :\n|%s|\n\n" "$____input_owner_after"
1>&2 printf --  "Given input group (after)  :\n|%s|\n\n" "$____input_group_after"
1>&2 printf --  "Got expect                 :\n|%s|\n\n" "$____expect"
1>&2 printf --  "Got expect (actual)        :\n|%s|\n\n" "$____expect_actual"
1>&2 printf --  "Got output                 :\n|%s|\n\n" "$____output"
1>&2 printf --  "Got actual                 :\n|%s|\n\n" "$____actual"
1>&2 printf --  "Got return code            :\n|%s|\n\n" "$____process"




# assert result
if [ $____process -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on execution!\n"
        exit 1
fi

if [ "$____output" = "$____expect" ] && \
[ "$____actual" = "$____expect_actual" ]; then
        1>&2 printf --  "[ PASSED ]\n"
        exit 0
fi

1>&2 printf --  "[ FAILED ] unexpected/inconsistent output!\n"
exit 1
