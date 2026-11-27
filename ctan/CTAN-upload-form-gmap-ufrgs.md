# Formulario de subida a CTAN — respuestas sugeridas para `gmap-ufrgs`

Referencia para completar el formulario de `https://ctan.org/upload`.
El envío es un paso manual (con tu cuenta); este archivo no sube nada.

Estado: v0.0 publicada el 2026-11-13 (con logos, licencia `lppl1.3c other-nonfree`,
fuera de TeX Live). v0.1 es una **actualización** que saca los logos para que
el paquete sea 100 % LPPL y pueda entrar en TeX Live (pedido del CTAN, Erik Braun).

## Antes de subir — checklist

- [ ] Repositorio `GMAp-UFRGS/gmap-ufrgs` público (los logos y el aviso de la
      clase apuntan a su carpeta `fig/`).
- [ ] Versión y fecha iguales en `\ProvidesClass`, `README.md` y `\date` del
      manual (`build-zip.ps1` lo verifica y aborta si no coinciden).
- [ ] `grep -ri "cenpes\|processo:\|sap:\|riser"` sobre el paquete sin resultados reales.
- [ ] Ejecutar `.\ctan\build-zip.ps1` (recompila el manual, arma el `.zip` y
      aborta si encuentra un logo dentro) y revisar la lista de archivos.

## Campos del formulario

**Name of your contribution**
```
gmap-ufrgs
```

**Version**
```
0.1 2026-11-20
```
(coincide con `\ProvidesClass{gmap-ufrgs}[2026/11/20 v0.1 ...]`).

**Maintainer**
```
Boris N. Rojo Tanzi
```

**Your name** — dejar vacío si subes el paquete tú mismo.

**Your email** — el mismo de la v0.0 (no se publica).

**Summary**
```
LaTeX class for technical reports of GMAp/UFRGS, compliant with ABNT standards
```

**Description** (actualizada para la v0.1: pre-textuales automáticos, listas de
siglas/símbolos/glosario y `gmap-figuras`)
```
The gmap-ufrgs class extends abntex2 to typeset the technical reports, technical notes and letters of the Applied Mechanics Group (GMAp) at the Universidade Federal do Rio Grande do Sul (UFRGS), Brazil, following the Brazilian ABNT standards (NBR 10719, 14724, 6023, 10520, 6024, 6027, 6028). It provides the cover page, a control sheet with author/checker/approver signatures, an optional confidentiality notice, a "preliminary" mark, a one-line figure command, signature blocks, and automatic front matter with lists of acronyms, symbols and a glossary (glossaries-extra, no external tool). Portuguese is the default language and English is available as an option. Project data (team, process numbers, footer text) are set by commands in the document and never hard-coded in the class. Optional packages provide math shortcuts (gmap-math), code environments (gmap-codigo) and figures with subfigures split across pages (gmap-figuras).
```

**Suggested CTAN directory**
```
macros/latex/contrib/gmap-ufrgs
```

**Announcement** — opcional. La v0.1 trae funciones nuevas; si quieres anunciarla:
```
Version 0.1 removes the institutional logos from the package (now entirely under the LPPL 1.3c+) and adds automatic front matter (cover, control sheet, table of contents), lists of acronyms and symbols and a glossary based on glossaries-extra (no external tool), signature blocks that can be deferred to the end of the document, and the optional package gmap-figuras for subfigures split across pages and figure series.
```

**Administrative notes** (interno)
```
Update to v0.1, following your note on v0.0: the two institutional logos (gmap-logo-ufrgs.png, gmap-logo-gmap.pdf) have been removed from the package, so it is now entirely under the LPPL 1.3c+. Please change the license in the catalogue from "lppl1.3c other-nonfree" to "lppl1.3c" and, if possible, include the package in TeX Live. The logos remain available to GMAp/UFRGS users through the Git repository; the class works without them (warning, blank space). As suggested, the LPPL text is no longer included; the README states the license.
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
  gmap-figuras.sty
  README.md
  doc/gmap-ufrgs-doc.tex
  doc/gmap-ufrgs-doc.pdf
  example/exemplo-minimo.tex
  example/exemplo-classico.tex
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

## Template de Overleaf (con logos)

`.\ctan\build-overleaf.ps1` genera `ctan/gmap-ufrgs-overleaf.zip` (clase,
paquetes, logos y `main.tex`, todo en la raíz). En Overleaf:

1. **New Project → Upload Project** y elegir el zip; compilar para verificar.
2. Para el grupo: **Share → Turn on link sharing** (solo lectura); cada uno
   abre el enlace y hace **Menu → Copy Project**.
3. Opcional, galería pública: **Submit → Overleaf Gallery** (Overleaf revisa
   el template antes de publicarlo).

Al publicar una versión nueva de la clase, regenerar el zip y actualizar el
proyecto del template (subir los `.cls`/`.sty` nuevos encima).
