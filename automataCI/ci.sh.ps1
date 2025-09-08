echo \" <<'RUN_AS_BATCH' >/dev/null ">NUL "\" \`" <#"
@ECHO OFF
REM LICENSE CLAUSES HERE
REM ----------------------------------------------------------------------------




REM ############################################################################
REM # Windows BATCH Codes                                                      #
REM ############################################################################
echo "[ ERROR ] --> powershell.exe !!!"
exit /b 1
REM ############################################################################
REM # Windows BATCH Codes                                                      #
REM ############################################################################
RUN_AS_BATCH
#> | Out-Null




echo \" <<'RUN_AS_POWERSHELL' >/dev/null # " | Out-Null
################################################################################
# Windows POWERSHELL Codes                                                     #
################################################################################
$PSDefaultParameterValues['*:Encoding'] = 'utf8'
$OutputEncoding = [console]::InputEncoding `
                = [console]::OutputEncoding `
                = New-Object System.Text.UTF8Encoding


# Scan for fundamental pathing
${env:APPCORE_PATH_CURRENT} = Get-Location
${env:APPCORE_PATH_AUTOMATACI} = "automataCI"
${env:APPCORE_PATH_INIT} = "Presenters"
${env:APPCORE_SCRIPT_START} = "start.ps1"


if (Test-Path "${env:APPCORE_PATH_CURRENT}\${env:APPCORE_PATH_AUTOMATACI}\${env:APPCORE_PATH_INIT}\${env:APPCORE_SCRIPT_START}") {
        # current directory is the root repository.
        ${env:APPCORE_PATH_ROOT} = ${env:APPCORE_PATH_CURRENT}
} elseif (Test-Path "${env:APPCORE_PATH_CURRENT}\${env:APPCORE_PATH_INIT}\${APPCORE_SCRIPT_START}") {
        # inside $APPCORE_PATH_AUTOMATACI - 1 level out
        ${env:APPCORE_PATH_ROOT} = Split-Path -Parent "${env:APPCORE_PATH_CURRENT}"
} else {
        # scan from current directory - bottom to top
        $____pathing = "${env:APPCORE_PATH_CURRENT}"
        ${env:APPCORE_PATH_ROOT} = ""
        foreach ($____pathing in (${env:APPCORE_PATH_CURRENT}.Split("\"))) {
                if (-not [string]::IsNullOrEmpty(${env:APPCORE_PATH_ROOT})) {
                        ${env:APPCORE_PATH_ROOT} += "\"
                }
                ${env:APPCORE_PATH_ROOT} += $____pathing

                if (Test-Path -Path `
                        "${env:APPCORE_PATH_ROOT}\${env:APPCORE_PATH_AUTOMATACI}\${env:APPCORE_PATH_INIT}\${env:APPCORE_SCRIPT_START}") {
                        break
                }
        }
        $null = Remove-Variable -Name $____pathing
}

if (-not (Test-Path "${env:APPCORE_PATH_ROOT}\${env:APPCORE_PATH_AUTOMATACI}\${env:APPCORE_PATH_INIT}\${env:APPCORE_SCRIPT_START}")) {
        Write-Error @"
E: Failed to Locate Init File - Missing Root Repository Directory.
E: Make Sure You Are On The Correct Path.
E: Unable to Proceed.
E: Bailing Out...

"@
        exit 1
}


# execute
$____process = . "${env:APPCORE_PATH_ROOT}\${env:APPCORE_PATH_AUTOMATACI}\${env:APPCORE_PATH_INIT}\${env:APPCORE_SCRIPT_START}" $args
################################################################################
# Windows POWERSHELL Codes                                                     #
################################################################################
exit $____process
<#
RUN_AS_POWERSHELL




################################################################################
# Unix Main Codes                                                              #
################################################################################
# Scan for fundamental pathing
export APPCORE_PATH_CURRENT="$PWD"
export APPCORE_PATH_AUTOMATACI="automataCI"
export APPCORE_PATH_INIT="Presenters"
export APPCORE_SCRIPT_START="start.sh"


if [ -f "${APPCORE_PATH_CURRENT}/${APPCORE_PATH_AUTOMATACI}/${APPCORE_PATH_INIT}/${APPCORE_SCRIPT_START}" ]; then
        # current directory is the root repository.
        APPCORE_PATH_ROOT="$APPCORE_PATH_CURRENT"
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
                        exit 1
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
        exit 1
fi


# execute
. "${APPCORE_PATH_ROOT}/${APPCORE_PATH_AUTOMATACI}/${APPCORE_PATH_INIT}/${APPCORE_SCRIPT_START}" "$@"
################################################################################
# Unix Main Codes                                                              #
################################################################################
exit $?
#>
