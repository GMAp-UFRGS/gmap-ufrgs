# gmap-figuras package -- TeXstudio completion (cwl)
#include:graphicx

\figuras{legenda}{lista}
\figuras[chaves%keyvals]{legenda}{lista}
\figuras*{legenda}{lista}
\figuras*[chaves%keyvals]{legenda}{lista}
\serieFiguras{padrao do arquivo}{valores}{sublegenda}{legenda}
\serieFiguras[chaves%keyvals]{padrao do arquivo}{valores}{sublegenda}{legenda}
\serieFiguras*{padrao do arquivo}{valores}{sublegenda}{legenda}
\serieFiguras*[chaves%keyvals]{padrao do arquivo}{valores}{sublegenda}{legenda}
\definirmapa{nome}{chave=valor}
\mapa{nome}{chave}
\figurascontname

#keyvals:\figuras,\figuras*,\serieFiguras,\serieFiguras*
porpagina={%<1,2%>}
colunas=%<numero%>
espaco=##L
continuacao={%<texto%>}
decimal=%<separador%>
fonte={%<texto%>}
rotulo=%<fig:rotulo%>
label=%<fig:rotulo%>
pos=%<htbp%>
tamanho=%<fracao%>
escala=%<fator%>
largura=##L
altura=##L
angle=%<graus%>
trim=%<l b r t%>
clip#true,false
page=%<numero%>
#endkeyvals
