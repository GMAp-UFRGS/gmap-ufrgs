# Formulario de subida a CTAN — respuestas sugeridas para `gmap-ufrgs`

Referencia para completar el formulario de `https://ctan.org/upload`.
El envío es un paso manual (con tu cuenta); este archivo no sube nada.

## Antes de subir — checklist

- [ ] **Hacer público el repositorio** `GMAp-UFRGS/gmap-ufrgs` (hoy es privado:
      CTAN y los usuarios no podrían abrir las URL de abajo).
- [ ] Versión y fecha iguales en `\ProvidesClass`, `README.md` y `\date` del
      manual (`build-zip.ps1` lo verifica y aborta si no coinciden).
- [ ] `grep -ri "cenpes\|processo:\|sap:\|riser"` sobre el paquete sin resultados reales.
- [ ] Ejecutar `.\ctan\build-zip.ps1` (recompila el manual y arma el `.zip`) y
      revisar la lista de archivos que imprime al final.

## Campos del formulario

**Name of your contribution**
```
gmap-ufrgs
```

**Version**
```
0.0 2026-11-13
```
(coincide con `\ProvidesClass{gmap-ufrgs}[2026/11/13 v0.0 ...]`).

**Maintainer**
```
Boris N. Rojo Tanzi
```

**Your name** — dejar vacío si subes el paquete tú mismo.

**Your email** — el tuyo (no se publica).

**Summary**
```
LaTeX class for technical reports of GMAp/UFRGS, compliant with ABNT standards
```

**Description**
```
The gmap-ufrgs class extends abntex2 to typeset the technical reports, technical notes and letters of the Applied Mechanics Group (GMAp) at the Universidade Federal do Rio Grande do Sul (UFRGS), Brazil, following the Brazilian ABNT standards (NBR 10719, 14724, 6023, 10520, 6024, 6027, 6028). It provides the cover page, a control sheet with author/checker/approver signatures, an optional confidentiality notice, a "preliminary" mark and a one-line figure command. Portuguese is the default language and English is available as an option. Project data (team, process numbers, footer text) are set by commands in the document and never hard-coded in the class. Optional packages provide math shortcuts (gmap-math) and code environments (gmap-codigo).
```

**Suggested CTAN directory**
```
macros/latex/contrib/gmap-ufrgs
```

**Announcement** (solo paquete nuevo)
```
gmap-ufrgs is a new LaTeX class, built on abntex2, for the technical reports, technical notes and letters of GMAp/UFRGS (Brazil), with Portuguese and English support, cover page, signature control sheet and optional confidentiality notice.
```

**Administrative notes** (interno)
```
New package. Thin class over abntex2/abntex2cite for one research group; usable as a reference for other ABNT institutional report classes. The package is uploaded by the GMAp/UFRGS itself and includes the two institutional logos (gmap-logo-ufrgs.png, gmap-logo-gmap.pdf). They are trademarks of UFRGS/GMAp and are explicitly excluded from the LPPL in the README and in the class header: redistribution unmodified as part of the package is allowed, use is reserved for UFRGS/GMAp documents. If you prefer the package without them, the class works without the logo files (warning, blank space) and they can simply be dropped. Includes the manual (source and PDF), a minimal example, README.md and the LPPL text.
```

**License type**
```
Free -> LaTeX Project Public License 1.3c or later (LPPL 1.3c+)
```

**Archive file**
`ctan/gmap-ufrgs.zip`, generado por `build-zip.ps1`, con una única carpeta de
primer nivel:
```
gmap-ufrgs/
  gmap-ufrgs.cls
  gmap-math.sty
  gmap-codigo.sty
  README.md
  LICENSE
  gmap-logo-ufrgs.png
  gmap-logo-gmap.pdf
  doc/gmap-ufrgs-doc.tex
  doc/gmap-ufrgs-doc.pdf
  example/exemplo-minimo.tex
  example/latexmkrc
```

**Home page / Repository**
```
https://github.com/GMAp-UFRGS/gmap-ufrgs
```

**Bug tracker**
```
https://github.com/GMAp-UFRGS/gmap-ufrgs/issues
```
