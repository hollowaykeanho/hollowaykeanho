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




# user configurations
# LIBS_HESTIA
# The location of all Hestia libraries packages. Since this is a self-test
# script, the current default value is set to 1 level lower since you're
# expected to be inside the package.
LIBS_HESTIA="${PWD%/*}"


# CURRENT_PACKAGE
# This is the name of the Hestia package being tested upon. This is used
# for printout and package identifications.
CURRENT_PACKAGE="HestiaKERNEL"




# setup test workspaces
if [ ! -x "${LIBS_HESTIA}/${CURRENT_PACKAGE}/.Self-Test.sh" ]; then
        1>&2 printf -- "%s" "\
E: You Are Not Inside '${CURRENT_PACKAGE}' Actual Package.
E: Please Go Into The Package and Restart This Self-Test Script Again.
E: Unable to Proceed.
E: Bailing Out...

"
        exit 1
fi

. "${LIBS_HESTIA}/${CURRENT_PACKAGE}/Init.sh" 2> /dev/null
command -v Hestia_Import > /dev/null
if [ $? -ne 0 ]; then
        1>&2 printf -- "%s" "\
E: Missing ${CURRENT_PACKAGE}/.Init.sh
"
        exit 1
fi

Hestia_Import "\
HestiaKERNEL/HestiaFS/List.sh
HestiaKERNEL/HestiaOS/To-STDERR.sh
HestiaKERNEL/HestiaTESTS/Codes-Verdict.sh
HestiaKERNEL/HestiaTESTS/Exec-Case.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




# check log settings
case "$QUIET_MODE" in
false)
        QUIET_MODE="false"
        ;;
*)
        QUIET_MODE="true"
        ;;
esac




# check if single script is provided
if [ -f "$1" ]; then
        if [ "${1%%"_test.sh"*}" = "$1" ]; then
                1>&2 printf -- "%s" "\
E: Not A Test File (${1}).
E: Unable to Proceed.
E: Bailing Out...

"
                exit 1
        fi

        1>&2 printf -- "%s" "\
I: Executing '${1}'...
"
        HestiaTESTS_Exec_Case "$1" "" "false"
        return $?
elif [ ! "$1" = "" ] && [ ! -f "$1" ]; then
        1>&2 printf -- "%s" "\
E: Missing File (${1}).
E: Unable to Proceed.
E: Bailing Out...

"
        exit 1
else
        : # fallback to running all
fi




# execute all scripts
____test_stat_total=0
____test_stat_passed=0
____test_stat_skipped=0
____test_stat_failed=0
____test_old_IFS="$IFS"
while IFS="" read ____test_script || [ -n "$____test_script" ]; do
        if [ ! -f "$____test_script" ]; then
                continue
        fi

        if [ "${____test_script%%"_test"*}" = "$____test_script" ]; then
                continue
        fi


        # it's a valid test script - begin testing
        HestiaOS_To_STDERR "\
I: Executing '${____test_script}'...
" \
        "" \
        "bold"
        ____test_stat_total=$(($____test_stat_total + 1))

        HestiaTESTS_Exec_Case "$____test_script" "" "$QUIET_MODE"
        case $? in
        $HestiaTESTS_PASSED)
                ____test_stat_passed=$(($____test_stat_passed + 1))
                ;;
        $HestiaTESTS_SKIPPED)
                ____test_stat_skipped=$(($____test_stat_skipped + 1))
                ;;
        *)
                ____test_stat_failed=$(($____test_stat_failed + 1))
                ;;
        esac
done <<EOF
$(HestiaFS_List "$PWD" "100" "true")
EOF
IFS="$____test_old_IFS"
unset ____test_old_IFS ____test_script




# print overall test report
____stderr_color="92"
if [ "$____test_stat_failed" -gt 0 ]; then
        ____stderr_color="91"
fi
HestiaOS_To_STDERR "\
TEST RESULTS (${CURRENT_PACKAGE:-Unspecified})
--------------------------------------------------------------------------------
TOTAL   : ${____test_stat_total}
PASSED  : ${____test_stat_passed}
SKIPPED : ${____test_stat_skipped}
FAILED  : ${____test_stat_failed}
--------------------------------------------------------------------------------
" "$____stderr_color" "bold"




# report status
if [ $____test_stat_failed -eq 0 ]; then
        exit 0
fi

exit 1
