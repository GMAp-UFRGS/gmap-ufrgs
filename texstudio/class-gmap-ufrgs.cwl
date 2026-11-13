# gmap-ufrgs class -- TeXstudio completion (cwl)
# Instalado por install.ps1 / install.sh em <config do TeXstudio>/completion/user/
# Mantenha em dia com gmap-ufrgs.cls.
#include:class-abntex2
#include:etoolbox
#include:iftex
#include:fontenc
#include:inputenc
#include:lmodern
#include:graphicx
#include:xcolor
#include:microtype
#include:indentfirst
#include:amsmath
#include:amssymb
#include:booktabs
#include:tabularx
#include:multirow
#include:longtable
#include:float
#include:xspace
#include:abntex2cite
#include:enumitem

#keyvals:\documentclass/gmap-ufrgs
relatorio
notatecnica
carta
abnt
classico
petrobras
english
brazil
confidencial
preliminar
sans
#endkeyvals

# Metadados
\projeto{nome do projeto}
\tipodoc{tipo de documento}
\numerodoc{numero}
\revisao{revisao}
\subtitulo{subtitulo}
\equipe{nomes}
\codigosprojeto{codigos}
\gerenciatecnica{gerencia}
\rodapeprojeto{texto}
\gmapendereco{endereco}
\destinatario{destinatario}
\aoscuidados{nome}
\assunto{assunto}

# Pessoas
\addautor{nome}{titulo}{registro}
\addautor[imagem da assinatura]{nome}{titulo}{registro}
\verificador{nome}{titulo}{registro}
\verificador[imagem da assinatura]{nome}{titulo}{registro}
\aprovador{nome}{titulo}{registro}
\aprovador[imagem da assinatura]{nome}{titulo}{registro}

# Logos
\logoesquerda{imagefile}
\logodireita{imagefile}
\logotopoesquerda{imagefile}

# Capa, folha de controle e carta
\imprimircapa
\imprimirfolhadecontrole
\confidencial
\fecharcarta{nome}{cargo}

# Figuras
\figura{imagefile}{legenda}
\figura[chaves%keyvals]{imagefile}{legenda}
\figura*{imagefile}{legenda}
\figura*[chaves%keyvals]{imagefile}{legenda}
\posicaofiguras{posicao}
\tamanhofiguras{fracao da largura}

#keyvals:\figura,\figura*
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

# Tabelas e listas
\cinza
\linhacinza
\begin{listalfa}
\end{listalfa}
\begin{listtraco}
\end{listtraco}
\begin{checklist}
\end{checklist}

# Cores
gmapazul#B
gmapcinza#B
