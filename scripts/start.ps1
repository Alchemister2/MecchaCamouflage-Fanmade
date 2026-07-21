param(
    [Parameter(Mandatory = $true)][string]$SourceExe,
    [string]$LaunchRoot = (Join-Path ([Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)) "MecchaCamouflage\launch")
)

$ErrorActionPreference = "Stop"

function Test-FileHash {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$ExpectedHash
    )

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        return $false
    }
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.Equals(
        $ExpectedHash,
        [System.StringComparison]::OrdinalIgnoreCase)
}

$sourcePath = (Resolve-Path -LiteralPath $SourceExe -ErrorAction Stop).ProviderPath
if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
    throw "Executable not found: $sourcePath. Run make build first."
}

$sourceHash = (Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash.ToLowerInvariant()
$exeName = Split-Path -Leaf $sourcePath
$exeBaseName = [System.IO.Path]::GetFileNameWithoutExtension($exeName)
$stageDirectory = Join-Path $LaunchRoot ("{0}-{1}" -f $exeBaseName, $sourceHash.Substring(0, 16))
$stagedExe = Join-Path $stageDirectory $exeName

New-Item -ItemType Directory -Force -Path $stageDirectory | Out-Null
if (-not (Test-FileHash -Path $stagedExe -ExpectedHash $sourceHash)) {
    $stagingExe = "$stagedExe.staging-$PID-$([Guid]::NewGuid().ToString('N'))"
    try {
        Copy-Item -LiteralPath $sourcePath -Destination $stagingExe -Force
        if (-not (Test-FileHash -Path $stagingExe -ExpectedHash $sourceHash)) {
            throw "Staged executable hash did not match source: $stagingExe"
        }
        Move-Item -LiteralPath $stagingExe -Destination $stagedExe -ErrorAction Stop
    }
    finally {
        if (Test-Path -LiteralPath $stagingExe) {
            Remove-Item -LiteralPath $stagingExe -Force -ErrorAction SilentlyContinue
        }
    }
}

$process = Start-Process -FilePath $stagedExe -PassThru
Write-Host "Staged runtime exe: $stagedExe"
Write-Host "Started runtime pid: $($process.Id)"
