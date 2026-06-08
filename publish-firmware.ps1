param(
  [Parameter(Mandatory = $true)][string]$BinPath,
  [string]$Version = "v0.16b"
)
$ErrorActionPreference = "Stop"

if (-not (Test-Path $BinPath)) { throw "Bin niet gevonden: $BinPath" }

$name = "powerbarn-heltec-v3-$Version.bin"
$dest = Join-Path $PSScriptRoot ("firmware/" + $name)
Copy-Item -Force $BinPath $dest
Write-Host "Copied -> firmware/$name"

git -C $PSScriptRoot add ("firmware/" + $name)
git -C $PSScriptRoot commit -m "firmware: publish Heltec V3 $Version"
git -C $PSScriptRoot push origin main
Write-Host "Published and pushed firmware/$name"
Write-Host "Controleer dat manifests/heltec-v3.json naar '$name' wijst."
