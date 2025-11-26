<#
  generate-favicons.ps1
  Decodes the base64 placeholder PNG and builds a simple ICO containing the PNG (Windows Vista+ style).

  Usage (PowerShell):
    pwsh .\scripts\generate-favicons.ps1
#>

$root = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $root

$b64path = Join-Path $root '..\favicon-32.png.b64' | Resolve-Path -Relative
$pngOut = Join-Path $root '..\favicon-32.png' | Resolve-Path -Relative
$icoOut = Join-Path $root '..\favicon.ico' | Resolve-Path -Relative

Write-Host "Decoding base64 -> $pngOut"
$b64 = Get-Content $b64path -Raw
[IO.File]::WriteAllBytes($pngOut, [Convert]::FromBase64String($b64))

Write-Host "Building ICO -> $icoOut"
$pngBytes = [IO.File]::ReadAllBytes($pngOut)
$pngLen = $pngBytes.Length

# ICO header: 6 bytes
$ms = New-Object System.IO.MemoryStream
$bw = New-Object System.IO.BinaryWriter($ms)

# Reserved (2 bytes)
$bw.Write([uint16]0)
# Type 1 = icon (2 bytes)
$bw.Write([uint16]1)
# Count (1)
$bw.Write([uint16]1)

# Directory entry (16 bytes)
# width (1) - 0 for 256, use 32
$bw.Write([byte]32)
# height (1)
$bw.Write([byte]32)
# color count
$bw.Write([byte]0)
# reserved
$bw.Write([byte]0)
# planes (2) - set to 0 for PNG
$bw.Write([uint16]0)
# bit count (2)
$bw.Write([uint16]0)
# bytes in image (4)
$bw.Write([uint32]$pngLen)
# offset (4) - header(6) + dir entry(16) = 22
$bw.Write([uint32]22)

# Write PNG bytes
$bw.Write($pngBytes)
$bw.Flush()

[IO.File]::WriteAllBytes($icoOut, $ms.ToArray())

Write-Host "Done. Generated $pngOut and $icoOut"
Write-Host "You can remove the .b64 file afterwards if desired."
