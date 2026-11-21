# Gera ctan/gmap-ufrgs.zip com uma unica pasta de primeiro nivel (gmap-ufrgs/)
# contendo SOMENTE o que vai para o CTAN. Nao sobe nada: o envio e manual em
# https://ctan.org/upload
#
# Antes de empacotar, recompila o manual (doc/gmap-ufrgs-doc.pdf) e confere
# que a versao do manual e do README coincide com a do \ProvidesClass.
# Os logos (fig/logo-example-*.pdf) NAO vao para o CTAN: sao distribuidos pelo
# repositorio Git e pelo template do Overleaf
# (ctan/build-overleaf.ps1). O texto da LPPL tambem nao vai: a nota do README
# basta (orientacao do CTAN).
#
# Uso (a partir da pasta gmap-ufrgs):  .\ctan\build-zip.ps1

$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

# --- versao: \ProvidesClass{gmap-ufrgs}[aaaa/mm/dd vX.Y ...]
$Cls = Get-Content -Raw -Encoding UTF8 (Join-Path $Root "gmap-ufrgs.cls")
if ($Cls -notmatch '\\ProvidesClass\{gmap-ufrgs\}\[(\d{4}/\d{2}/\d{2}) (v[\d.]+)') {
    Write-Error "Nao encontrei a versao em \ProvidesClass"; exit 1
}
$Date = $Matches[1]; $Ver = $Matches[2]
$Doc = Get-Content -Raw -Encoding UTF8 (Join-Path $Root "doc\gmap-ufrgs-doc.tex")
$Readme = Get-Content -Raw -Encoding UTF8 (Join-Path $Root "README.md")
if (-not $Doc.Contains("$Ver -- $Date")) { Write-Error "Manual nao esta em $Ver -- $Date (\date)"; exit 1 }
if (-not $Readme.Contains("$Ver ($Date)")) { Write-Error "README nao esta em $Ver ($Date)"; exit 1 }
Write-Host "Versao: $Ver ($Date)"

# --- recompila o manual (usa a classe da pasta raiz, nao a instalada)
# (latexmk escreve mensagens em stderr; com "Stop" o PowerShell 5.1 as trataria
# como erro se a saida for redirecionada, por isso o codigo de saida decide)
Push-Location (Join-Path $Root "doc")
$OldPref = $ErrorActionPreference; $ErrorActionPreference = "Continue"
try {
    & latexmk -pdf -interaction=nonstopmode -halt-on-error -silent gmap-ufrgs-doc.tex
    $rc = $LASTEXITCODE
} finally { $ErrorActionPreference = $OldPref; Pop-Location }
if ($rc -ne 0) { Write-Error "Falha ao compilar o manual (veja doc/gmap-ufrgs-doc.log)"; exit 1 }

# --- monta a pasta
$Stage = Join-Path ([System.IO.Path]::GetTempPath()) ("gmap-ufrgs-ctan-" + [guid]::NewGuid().ToString("N"))
$Pkg = Join-Path $Stage "gmap-ufrgs"
New-Item -ItemType Directory -Force -Path $Pkg, (Join-Path $Pkg "doc"), (Join-Path $Pkg "example") | Out-Null

Copy-Item (Join-Path $Root "gmap-ufrgs.cls"), (Join-Path $Root "gmap-math.sty"), (Join-Path $Root "gmap-codigo.sty"), (Join-Path $Root "gmap-figuras.sty"), (Join-Path $Root "README.md") -Destination $Pkg
Copy-Item (Join-Path $Root "doc\gmap-ufrgs-doc.tex"), (Join-Path $Root "doc\gmap-ufrgs-doc.pdf") -Destination (Join-Path $Pkg "doc")
Copy-Item (Join-Path $Root "example\exemplo-minimo.tex"), (Join-Path $Root "example\exemplo-classico.tex"), (Join-Path $Root "example\latexmkrc") -Destination (Join-Path $Pkg "example")

$Zip = Join-Path $Root "ctan\gmap-ufrgs.zip"
if (Test-Path $Zip) { Remove-Item $Zip }
# tar.exe (bsdtar, Windows 10+) grava caminhos com "/" como o CTAN espera;
# Compress-Archive do PowerShell 5.1 grava "\\" e quebra no Linux.
& tar.exe -a -c -f $Zip -C $Stage gmap-ufrgs
if ($LASTEXITCODE -ne 0) { Write-Error "tar.exe falhou"; exit 1 }
Remove-Item -Recurse -Force $Stage
Write-Host "Criado: $Zip"
& tar.exe -t -f $Zip
# garantia: nenhum logo dentro do pacote do CTAN
if ((& tar.exe -t -f $Zip) -match 'logo-example-') { Write-Error "Ha logos no zip do CTAN"; exit 1 }
