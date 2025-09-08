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
if [ ! -x "${LIBS_HESTIA}/${CURRENT_PACKAGE}/.Remove-Test-Files.sh" ]; then
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
E: Missing ${CURRENT_PACKAGE}/Init.sh
"
        exit 1
fi

Hestia_Import "\
HestiaKERNEL/HestiaFS/Delete.sh
HestiaKERNEL/HestiaFS/List.sh
HestiaKERNEL/HestiaOS/Print-Info.sh
HestiaKERNEL/HestiaOS/Print-Success.sh
"
if [ $? -ne 0 ]; then
        exit 1
fi




# execute all scripts
while IFS="" read ____test_script || [ -n "$____test_script" ]; do
        if [ ! -f "$____test_script" ]; then
                continue
        fi

        if [ "${____test_script%%"_test"*}" = "$____test_script" ]; then
                continue
        fi

        HestiaOS_Print_Info "Deleting '${____test_script}'..."
        HestiaFS_Delete "$____test_script"
done <<EOF
$(HestiaFS_List "$PWD" "100" "true")
EOF
IFS="$____test_old_IFS"
unset ____test_old_IFS ____test_script

HestiaOS_Print_Success "Purge Successful."




# report status
exit 0
