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
Interactors_FS_Copy

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




____target="${PWD}/interactors/FS/Copy.sh"
1>&2 printf --  "Checking '%s'...\n" "$____target"
if [ ! -f "$____target" ]; then
        1>&2 printf --  "[ FAILED ] missing file!\n"
        exit 1
fi


1>&2 printf --  "Importing function library...\n"
. "$____target"
command -V Interactors_FS_Copy > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
        exit 1
fi




____input_dest_path="./test-dest.dir"
____input_source_path="./test-source.dir"
____input_inner_path="hello/test-file.txt"
____input_content="Hello World!\n"
____input_resolve_link=""
____input_fullpath="${____input_source_path}/${____input_inner_path}"
____expect=""
____expect_artifact="$(printf -- "%s" "$____input_content")"

rm -rf "$____input_source_path" 2> /dev/null
rm -rf "$____input_dest_path" 2> /dev/null
sync "$____input_source_path" 2> /dev/null
sync "$____input_dest_path" 2> /dev/null

mkdir -p "${____input_fullpath%/*}"
printf -- "%s" "$____input_content" > "$____input_fullpath"


____output="$( \
        Interactors_FS_Copy \
                "$____input_dest_path" \
                "$____input_source_path" \
                "$____input_resolve_link" \
)"
____process=$?
____artifact="$( \
        cat "${____input_dest_path}/${____input_inner_path}" 2> /dev/null \
)"


rm -rf "$____input_source_path" 2> /dev/null
rm -rf "$____input_dest_path" 2> /dev/null
sync "$____input_source_path" 2> /dev/null
sync "$____input_dest_path" 2> /dev/null


1>&2 printf -- "%s" "\
Got input dest path:
|${____input_dest_path}|

Got input source path:
|${____input_source_path}|

Got input resolve link:
|${____input_resolve_link}|

Got expect:
|${____expect}|

Got expect artifact:
|${____expect_artifact}|

Got output:
|${____output}|

Got artifact:
|${____artifact}|

Got return code:
|${____process}|

"




# assert result
if [ $____process -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on execution!\n"
        exit 1
fi

if [ "$____output" = "$____expect" ] &&
[ "$____artifact" = "$____expect_artifact" ]; then
        1>&2 printf --  "[ PASSED ]\n"
        exit 0
fi

1>&2 printf --  "[ FAILED ] unexpected/inconsistent output!\n"
exit 1
