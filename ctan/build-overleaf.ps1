# Gera ctan/gmap-ufrgs-overleaf.zip: projeto pronto para o Overleaf
# (New Project -> Upload Project), com a classe, os pacotes, os logos da
# UFRGS e do GMAp e um main.tex de exemplo, tudo na raiz do projeto.
#
# Diferente do pacote do CTAN, este zip INCLUI os logos: e o caminho de
# distribuicao para os usuarios do GMAp/UFRGS. O Overleaf usa o TeX Live, que so e atualizado uma vez
# por ano; com a classe dentro do projeto o template funciona ja, e a versao
# usada e sempre a deste zip.
#
# Uso (a partir da pasta gmap-ufrgs):  .\ctan\build-overleaf.ps1

$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

$Stage = Join-Path ([System.IO.Path]::GetTempPath()) ("gmap-ufrgs-overleaf-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $Stage | Out-Null

Copy-Item (Join-Path $Root "gmap-ufrgs.cls"), (Join-Path $Root "gmap-math.sty"), (Join-Path $Root "gmap-codigo.sty"), (Join-Path $Root "gmap-figuras.sty") -Destination $Stage
$Logos = Get-ChildItem -Path (Join-Path $Root "fig") -Filter "gmap-logo-*"
if ($Logos.Count -ne 2) { Write-Error "Esperava 2 logos em fig/, encontrei $($Logos.Count)"; exit 1 }
foreach ($l in $Logos) { Copy-Item $l.FullName -Destination $Stage }

# main.tex = exemplo minimo, com um cabecalho explicando o template
$Ex = Get-Content -Raw -Encoding UTF8 (Join-Path $Root "example\exemplo-minimo.tex")
$Ex = $Ex -replace '(?m)^% Exemplo minimo.*\r?\n', ''
$Header = @"
% Template do GMAp/UFRGS para o Overleaf (classe gmap-ufrgs).
% A classe, os pacotes opcionais (gmap-math, gmap-codigo, gmap-figuras) e os logos da UFRGS
% e do GMAp estao na raiz deste projeto. Manual e versao mais nova:
% https://ctan.org/pkg/gmap-ufrgs e https://github.com/GMAp-UFRGS/gmap-ufrgs

"@
$Utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText((Join-Path $Stage "main.tex"), $Header + $Ex, $Utf8NoBom)

$Zip = Join-Path $Root "ctan\gmap-ufrgs-overleaf.zip"
if (Test-Path $Zip) { Remove-Item $Zip }
$Names = Get-ChildItem $Stage | ForEach-Object { $_.Name }
& tar.exe -a -c -f $Zip -C $Stage @Names
if ($LASTEXITCODE -ne 0) { Write-Error "tar.exe falhou"; exit 1 }
Remove-Item -Recurse -Force $Stage
Write-Host "Criado: $Zip"
& tar.exe -t -f $Zip
