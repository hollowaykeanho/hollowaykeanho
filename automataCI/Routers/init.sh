#!/bin/sh
# Copyright 2025 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
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




# identify LIBS_HESTIA
export LIBS_HESTIA="${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Entities"
if [ ! -d "$LIBS_HESTIA" ]; then
        Interactors_OS_Print_Error "\
Failed to Initialize \$LIBS_HESTIA.
Unable to Proceed.
Bailing Out...

"
        exit 1
fi

# perform basic initialization
. "${LIBS_HESTIA}/HestiaKERNEL/HestiaOS/Print-Info.sh"
. "${LIBS_HESTIA}/HestiaKERNEL/HestiaOS/Print-Error.sh"




# import all functional libraries
____import_lib() {
        #____path="$1"

        for ____item in "${1}/"*; do
                if [ -d "$____item" ]; then
                        ____import_lib "$____item"
                elif [ ! -f "$____item" ]; then
                        continue
                fi

                if [ ${____item%".sh"} = "$____item" ]; then
                        # not a shell script
                        continue
                fi

                if [ ! ${____item%"_test.sh"} = "$____item" ]; then
                        # do not import test script
                        continue
                fi

                if [ ! ${____item#"_"} = "$____item" ] ||
                [ ! ${____item#"."} = "$____item" ]; then
                        # not a hidden or placeholder shell script
                        continue
                fi

                . "$____item"
                if [ $? -ne 0 ]; then
                        HestiaOS_Print_Error "Failed to Import '${____item}'."
                        HestiaOS_Print_Error "Contact Developer / Maintainer."
                        HestiaOS_Print_Error "Unable to Proceed."
                        HestiaOS_Print_Error "Bailing Out..."
                        HestiaOS_Print_Error ""
                        return 1
                fi
        done
}


HestiaOS_Print_Info "Initializing Entities Libraries..."
____import_lib "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Entities"
if [ $? -ne 0 ]; then
        return 1
fi

HestiaOS_Print_Info "Initializing Views Libraries..."
____import_lib "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Views"
if [ $? -ne 0 ]; then
        return 1
fi

HestiaOS_Print_Info "Initializing Interactors Libraries..."
____import_lib "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Interactors"
if [ $? -ne 0 ]; then
        return 1
fi

unset ____import_lib




# identify LIBS_AUTOMATACI
export LIBS_AUTOMATACI="${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Interactors"
if [ ! -d "$LIBS_AUTOMATACI" ]; then
        unset LIBS_AUTOMATACI
        Interactors_OS_Print_Error "\
E: Failed to Initialize \$LIBS_AUTOMATACI.
E: Unable to Proceed.
E: Bailing Out...

"
        exit 1
fi




# get hardware information
export APPCORE_LANG="$(Interactors_OS_Get_Lang)"
if [ "$APPCORE_LANG" = "" ]; then
        Interactors_OS_Print_Error "\
Failed to Initialize \$APPCORE_LANG (${APPCORE_LANG}).
Unable to Proceed.
Bailing Out...

"
        return 1
fi


export APPCORE_ARCH="$(Interactors_OS_Get_Arch)"
if [ "$APPCORE_ARCH" = "" ]; then
        Interactors_OS_Print_Error "\
Failed to Initialize \$APPCORE_ARCH (${APPCORE_ARCH}).
Unable to Proceed.
Bailing Out...

"
        return 1
fi




# report status
return 0
