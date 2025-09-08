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




# initialize
export APPCORE_PATH_CURRENT="$PWD"
export APPCORE_PATH_AUTOMATACI="automataCI"
export APPCORE_PATH_INIT="Presenters"
export APPCORE_SCRIPT_START="start.sh"


if [ -f "${APPCORE_PATH_CURRENT}/${APPCORE_PATH_AUTOMATACI}/${APPCORE_PATH_INIT}/${APPCORE_SCRIPT_START}" ]; then
        # current directory is the root directory.
        APPCORE_PATH_ROOT="$PWD"
elif [ -f "${APPCORE_PATH_CURRENT}/${APPCORE_PATH_INIT}/${APPCORE_SCRIPT_START}" ]; then
        # inside $APPCORE_PATH_AUTOMATACI - 1 level out
        APPCORE_PATH_ROOT="${APPCORE_PATH_CURRENT%/*}"
else
        ____pathing="$APPCORE_PATH_CURRENT"
        ____previous=""
        while [ "$____pathing" != "" ]; do
                APPCORE_PATH_ROOT="${APPCORE_PATH_ROOT}${____pathing%%/*}/"
                ____pathing="${____pathing#*/}"
                if [ -f "${APPCORE_PATH_ROOT}${APPCORE_PATH_AUTOMATACI}/${APPCORE_PATH_INIT}/${APPCORE_SCRIPT_START}" ]; then
                        break
                fi

                # stop the scan if the previous pathing is the same as current
                if [ "$____previous" = "$____pathing" ]; then
                        1>&2 printf "%s" "\
E: Failed to Locate Init File - Missing Root Repository Directory.
E: Make Sure You Are On The Correct Path.
E: Unable to Proceed.
E: Bailing Out...

"
                        return 1
                fi
                ____previous="$____pathing"
        done
        unset ____pathing ____previous
        export APPCORE_PATH_ROOT="${APPCORE_PATH_ROOT%/*}"
fi

if [ ! -f "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/${APPCORE_PATH_INIT}/${APPCORE_SCRIPT_START}" ]; then
        1>&2 printf "%s" "\
E: Failed to Locate Init File.
E: Make Sure You Are On The Correct Path.
E: Unable to Proceed.
E: Bailing Out...

"
        return 1
fi




# initialize application
if [ ! -f "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Routers/init.sh" ]; then
        1>&2 printf "%s" "\
E: Failed to Locate Init Router.
E: Unable to Proceed.
E: Bailing Out...

"
        return 1
fi


. "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Routers/init.sh"
if [ $? -ne 0 ]; then
        1>&2 printf "%s" "\
E: Failed to Initialize AutomataCI App.
E: Unable to Proceed.
E: Bailing Out...

"
        return 1
fi




# execute by command
case "$1" in
init|Init|INIT)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Init/Main.sh"
        return $?
        ;;
env|Env|ENV)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Env/Main.sh"
        return $?
        ;;
setup|Setup|SETUP)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Setup/Main.sh"
        return $?
        ;;
start|Start|START)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Start/Main.sh"
        return $?
        ;;
test|Test|TEST)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Test/Main.sh"
        return $?
        ;;
prepare|Prepare|PREPARE)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Prepare/Main.sh"
        return $?
        ;;
materialize|Materialize|MATERIALIZE)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Materialize/Main.sh"
        return $?
        ;;
build|Build|BUILD)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Build/Main.sh"
        return $?
        ;;
notarize|Notarize|NOTARIZE)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Notarize/Main.sh"
        return $?
        ;;
package|Package|PACKAGE)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Package/Main.sh"
        return $?
        ;;
release|Release|RELEASE)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Release/Main.sh"
        return $?
        ;;
stop|Stop|STOP)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Stop/Main.sh"
        return $?
        ;;
deploy|Deploy|DEPLOY)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Deploy/Main.sh"
        return $?
        ;;
compose|Compose|COMPOSE)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Compose/Main.sh"
        return $?
        ;;
publish|Publish|PUBLISH)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Publish/Main.sh"
        return $?
        ;;
archive|Archive|ARCHIVE)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Archive/Main.sh"
        return $?
        ;;
clean|Clean|CLEAN)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Clean/Main.sh"
        return $?
        ;;
purge|Purge|PURGE)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Purge/Main.sh"
        return $?
        ;;
help|Help|HELP)
        . "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/Presenters/Help/Main.sh"
        return 0
        ;;
*)
        Interactors_OS_Print_Error "\
Unknown Command.
Nothing to Do.
Use '--help' to Explore Options.
Bailing Out...
"
        return 1
        ;;
esac
