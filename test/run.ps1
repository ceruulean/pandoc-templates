$BIN=(Resolve-Path "$PSScriptRoot/../bin/" )
$RESULTS="$PSScriptRoot/results"

$fH="`n`t{0}`n"
$fS="`n`t{0}`n`t{1}`n"
$line='----------------------------------------'

New-Item -Path $PSScriptRoot/results -ItemType directory -ErrorAction SilentlyContinue

Write-Output ($fH -f '=============== Powershell Tests ===============')

Write-Output ($fS -f '1. [Short] Single input', $line)
.("$BIN\md2short.ps1") -overwrite $PSScriptRoot/short/guidelines.md -output $RESULTS/short-ps.docx

Write-Output ($fS -f '2. [Short] Modern style', $line)
.("$BIN\md2short.ps1") -x -modern $PSScriptRoot/short/line-break.md -o $RESULTS/short-modern-ps.docx

Write-Output ($fS -f '3. [Long] Wildcard inputs', $line)
.("$BIN\md2long.ps1") -x $PSScriptRoot/long/*.md $PSScriptRoot/short/*.md -o $RESULTS/long-ps.docx

Write-Output ($fS -f '4. [Long] Modern style', $line)
.("$BIN\md2long.ps1") -x -modern $PSScriptRoot/long/0-prologue.md $PSScriptRoot/long/1-the-beginning.md -o $RESULTS/long-modern-ps.docx