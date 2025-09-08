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
1>&2 printf --  "%s\n" "\
TEST CASE  :
HestiaSTRINGS_Index_Any

TEST ID    :
t0

DESCRIPTION:
Function can run properly with valid inputs.
"




LIBS_HESTIA="${LIBS_HESTIA:-"${PWD%/*}"}"
1>&2 printf --  "Checking \$LIBS_HESTIA pathing...\n"
if [ "$LIBS_HESTIA" = "" ]; then
        1>&2 printf --  "[ FAILED ] missing variable!\n"
        exit 1
else
        1>&2 printf --  "Got: %s\n" "$LIBS_HESTIA"
fi




____target="${LIBS_HESTIA}/HestiaKERNEL/HestiaSTRINGS/Index-Any.sh"
1>&2 printf --  "Checking '%s'...\n" "$____target"
if [ ! -f "$____target" ]; then
        1>&2 printf --  "[ FAILED ] missing file!\n"
        exit 1
fi




1>&2 printf --  "Importing function library...\n"
. "$____target"
command -V HestiaSTRINGS_Index_Any > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
        exit 1
fi




____input="e你feeeff你你aergaegE你F"
____target="你a"
____direction=""
____expect="1"
____output="$( \
        HestiaSTRINGS_Index_Any \
                "$____input" \
                "$____target" \
                "$____direction" \
)"
____process=$?
1>&2 printf --  "Given sample           :\n|%s|\n\n" "$____input"
1>&2 printf --  "Given target sample    :\n|%s|\n\n" "$____target"
1>&2 printf --  "Given direction sample :\n|%s|\n\n" "$____direction"
1>&2 printf --  "Given expect           :\n|%s|\n\n" "$____expect"
1>&2 printf --  "Got output             :\n|%s|\n\n" "$____output"
1>&2 printf --  "Got return code        :\n|%s|\n\n" "$____process"




# assert result
if [ $____process -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on execution!\n"
        exit 1
fi

if [ "$____output" = "$____expect" ] ||
[ "$____output" = "$____expect_fallback" ]; then
        1>&2 printf --  "[ PASSED ]\n"
        exit 0
fi

1>&2 printf --  "[ FAILED ] unexpected/inconsistent output!\n"
exit 1
