gmap-ufrgs -- LaTeX class for technical reports of GMAp/UFRGS
==============================================================

Name:        gmap-ufrgs
Version:     v0.0 (2026/11/13)
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
- `gmap-logo-ufrgs.png`, `gmap-logo-gmap.pdf`  UFRGS and GMAp logos, used by
  default on the cover and header (NOT under the LPPL; see "Logos" below).
  In the Git repository they are in `fig/`.

Only in the Git repository (not distributed on CTAN):
- `install.ps1`, `install.sh`  install the class and the logos into TEXMFHOME
- `texstudio/*.cwl`  TeXstudio completion files, installed by the scripts above
- `ctan/`  script that builds the CTAN archive

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

Requirements
------------
LaTeX 2022-06-01 or newer (TeX Live 2022+ or an up-to-date MiKTeX) with
`abntex2`, `etoolbox`, `iftex`, `xcolor`, `booktabs`, `enumitem`, `microtype`.
Recommended engine: pdfLaTeX + BibTeX; LuaLaTeX and XeLaTeX also work.

Installation
------------
From a TeX distribution: install the package `gmap-ufrgs` with `tlmgr` or the
MiKTeX console. Manually: copy the `.cls`, `.sty` and logo files to
`TEXMFHOME/tex/latex/gmap-ufrgs/` (and refresh the file-name database), or put
them in the folder of your main `.tex` file.

From the Git repository: run `install.ps1` (Windows) or `install.sh`
(Linux/macOS); they also install, if TeXstudio is configured, its completion
files (restart TeXstudio afterwards).

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
`gmap-logo-ufrgs.png` and `gmap-logo-gmap.pdf` are trademarks of the
Universidade Federal do Rio Grande do Sul (UFRGS) and of its Grupo de Mecanica
Aplicada (GMAp). They are distributed with the class, by the GMAp/UFRGS, so
that the class produces the institutional layout out of the box. They are NOT
covered by the LPPL: they may be redistributed unmodified as part of this
package, but their use is reserved for documents of UFRGS/GMAp and must follow
the UFRGS brand guidelines (https://www.ufrgs.br/site/marca-ufrgs/).

Users outside UFRGS should replace them with `\logoesquerda`, `\logodireita`
and `\logotopoesquerda`. The class works without the logo files: if a file is
missing, it issues a warning and leaves the space blank.

Bibliography tip
----------------
To print compound surnames in upper case in citations and references, glue the
words with an empty group in the `.bib` file: `author = {Da{ }Silva, Ana}`
gives `(DA SILVA, 2020)` instead of `(SILVA, 2020)`.

License
-------
Copyright (C) 2026 Boris N. Rojo Tanzi and GMAp/UFRGS.
The code and documentation (`.cls`, `.sty`, `.tex`) are distributed under the
LaTeX Project Public License, version 1.3c or later; see `LICENSE`.
The logo files are excluded from this license (see "Logos").
This work has the LPPL maintenance status `maintained`.
