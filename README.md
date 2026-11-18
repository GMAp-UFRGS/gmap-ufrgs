gmap-ufrgs -- LaTeX class for technical reports of GMAp/UFRGS
==============================================================

Name:        gmap-ufrgs
Version:     v0.1 (2026/11/14)
Maintainer:  Boris N. Rojo Tanzi
Repository:  https://github.com/GMAp-UFRGS/gmap-ufrgs
Bug tracker: https://github.com/GMAp-UFRGS/gmap-ufrgs/issues
License:     LaTeX Project Public License (LPPL), version 1.3c or later
             (https://ctan.org/license/lppl1.3c)

Summary
-------
`gmap-ufrgs` is a LaTeX class built on top of `abntex2` for the technical
reports, technical notes and letters of the Grupo de Mecanica Aplicada
(GMAp), Universidade Federal do Rio Grande do Sul (UFRGS), following the
Brazilian ABNT standards (NBR 10719, 14724, 6023, 10520, 6024, 6027, 6028).
Portuguese is the default language; English is available with the `english`
option. Project-specific data (team, process numbers, footer text, signatures)
are given by commands in the document, never hard-coded in the class.

Files
-----
- `gmap-ufrgs.cls`   the class
- `gmap-math.sty`    optional: vector/matrix/derivative shortcuts
- `gmap-codigo.sty`  optional: code and command-line environments
- `doc/gmap-ufrgs-doc.tex` / `.pdf`  manual (Portuguese, with an English summary)
- `example/exemplo-minimo.tex`  minimal compilable example
- `example/exemplo-classico.tex`  `classico` profile: automatic cover, table of
  contents, lists of acronyms/symbols and glossary

Only in the Git repository (not distributed on CTAN):
- `fig/gmap-logo-ufrgs.pdf`, `fig/gmap-logo-gmap.pdf`  UFRGS and GMAp logos,
  used by default on the cover and header (NOT under the LPPL; see "Logos")
- `install.ps1`, `install.sh`  install the class and the logos into TEXMFHOME
- `texstudio/*.cwl`  TeXstudio completion files, installed by the scripts above
- `ctan/`  scripts that build the CTAN archive and the Overleaf template

Class options
-------------
`relatorio` (default), `notatecnica`, `carta`, `english`, `confidencial`,
`preliminar`, `sans`, and the layout profile `abnt` (default) or `classico`.

`classico` reproduces the former GMAp layout: Latin Modern Sans throughout,
2 cm side margins, single spacing, numeric citations `[1]`, captions below
figures, revision on the cover, `dd/mm/yyyy` dates and the project name in the
footer. No abstract is required. (`petrobras`, its former internal name, is
still accepted as an alias.)

Figures
-------
`\figura[keys]{file}{caption}` inserts an image at scale 1 (shrunk with a
warning only if it does not fit), with the automatic label `fig:<file>`;
`\figura*` places it exactly there. Images are searched in `fig/` and
`figuras/`. Keys: `fonte`, `rotulo`, `pos`, `tamanho`, `escala`, `largura`,
`altura` and any `\includegraphics` key. `tamanho=0.6`, or just
`\figura[0.6]{file}{caption}`, makes the image 60% of the text width;
`\tamanhofiguras{0.8}` sets that default for every figure without its own size.

Signatures
----------
`\blocoassinatura[keys]{Name \\ Role \\ Group \\ Institution}` prints a
right-aligned sans-serif signature block anywhere in the text. For several
people side by side, put the blocks inside
`\begin{assinaturas} ... \end{assinaturas}`. Keys: `imagem` (signature image),
`altura`, `linha` (line for a handwritten signature), `posicao`
(`direita`/`centro`/`esquerda`) and `espaco`; `\configurarassinatura{keys}`
sets document-wide defaults.

Requirements
------------
LaTeX 2022-06-01 or newer (TeX Live 2022+ or an up-to-date MiKTeX) with
`abntex2`, `etoolbox`, `iftex`, `xcolor`, `booktabs`, `enumitem`, `microtype`.
Recommended engine: pdfLaTeX + BibTeX; LuaLaTeX and XeLaTeX also work.

Installation
------------
From a TeX distribution: install the package `gmap-ufrgs` with `tlmgr` or the
MiKTeX console. Manually: copy the `.cls` and `.sty` files to
`TEXMFHOME/tex/latex/gmap-ufrgs/` (and refresh the file-name database), or put
them in the folder of your main `.tex` file. GMAp/UFRGS documents also need
the two logo files (see "Logos").

From the Git repository: run `install.ps1` (Windows) or `install.sh`
(Linux/macOS); they install the class together with the logos and, if
TeXstudio is configured, its completion files (restart TeXstudio afterwards).

On Overleaf: start from the GMAp template (class, packages and logos already
in the project), or upload the `.cls`, `.sty` and logo files to the root of
the project.

Quick start
-----------
```
\documentclass{gmap-ufrgs}
\projeto{...}  \numerodoc{...}  \titulo{...}  \local{Porto Alegre}  \data{...}
\addautor{Name}{Title}{Registration}
\begin{document}
\imprimircapa
\imprimirfolhadecontrole
...
\end{document}
```

Logos
-----
`gmap-logo-ufrgs.pdf` and `gmap-logo-gmap.pdf` are trademarks of the
Universidade Federal do Rio Grande do Sul (UFRGS) and of its Grupo de Mecanica
Aplicada (GMAp). They are NOT covered by the LPPL and are NOT part of the
CTAN/TeX Live package. They are available in the `fig/` folder of the Git
repository (https://github.com/GMAp-UFRGS/gmap-ufrgs), are installed by
`install.ps1`/`install.sh` and are included in the GMAp Overleaf template.
Their use is reserved for documents of UFRGS/GMAp and must follow the UFRGS
brand guidelines (https://www.ufrgs.br/site/marca-ufrgs/).

The class looks for them in the folder of the document, in `fig/`, in
`figuras/` and in the TeX installation. If a file is missing, it issues a
warning and leaves the space blank. Users outside UFRGS should replace them
with `\logoesquerda{file}`, `\logodireita{file}` and `\logotopoesquerda{file}`,
or disable them (and the warning) with an empty argument, e.g.
`\logoesquerda{}`.

Bibliography tip
----------------
To print compound surnames in upper case in citations and references, glue the
words with an empty group in the `.bib` file: `author = {Da{ }Silva, Ana}`
gives `(DA SILVA, 2020)` instead of `(SILVA, 2020)`.

License
-------
Copyright (C) 2026 Boris N. Rojo Tanzi and GMAp/UFRGS.
The code and documentation (`.cls`, `.sty`, `.tex`) are distributed under the
LaTeX Project Public License, version 1.3c or later
(https://www.latex-project.org/lppl.txt).
The logo files are not part of this work (see "Logos").
This work has the LPPL maintenance status `maintained`.
