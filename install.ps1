#Requires -Version 5.1
<#
.SYNOPSIS
  Install Claude Like Typora theme into %APPDATA%\Typora\themes
.NOTES
  Run from repo root. Fully quit Typora before/after for clean reload.
#>
$ErrorActionPreference = "Stop"
$RepoRoot = $PSScriptRoot
$Target = Join-Path $env:APPDATA "Typora\themes"

if (-not (Test-Path $Target)) {
    throw "Typora themes folder not found: $Target`nInstall Typora first."
}

$files = @(
    "claude-like.css",
    "claude-like-dark.css",
    "claude-like-grey.css",
    "claude-like-base.css",
    "claude-like.user.css"
)

Write-Host "Source: $RepoRoot"
Write-Host "Target: $Target"

foreach ($f in $files) {
    $src = Join-Path $RepoRoot $f
    if (-not (Test-Path $src)) { throw "Missing: $src" }
    Copy-Item $src (Join-Path $Target $f) -Force
    Write-Host "  OK  $f"
}

$fontSrc = Join-Path $RepoRoot "claude_fonts"
$fontDst = Join-Path $Target "claude_fonts"
if (-not (Test-Path $fontSrc)) { throw "Missing fonts: $fontSrc" }
if (Test-Path $fontDst) {
    Remove-Item $fontDst -Recurse -Force
}
Copy-Item $fontSrc $fontDst -Recurse -Force
Write-Host "  OK  claude_fonts/"

# Optional docs
foreach ($doc in @("THEME-DEFAULTS.md", "claude-like-README.md")) {
    $src = Join-Path $RepoRoot $doc
    if (Test-Path $src) {
        Copy-Item $src (Join-Path $Target $doc) -Force
        Write-Host "  OK  $doc"
    }
}

Write-Host ""
Write-Host "Installed. Fully quit Typora, reopen, then Theme → Claude Like."
Write-Host "Variants: Claude Like / Claude Like Dark / Claude Like Grey"
