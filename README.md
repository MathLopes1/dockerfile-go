🐳 Dockerfile Multi-Stage Building 🚀

Este Dockerfile utiliza a técnica de Multi-Stage Building para reduzir o tamanho da imagem Docker em 2MB. Aqui está uma explicação técnica do que foi feito:

🔍 Primeira Etapa - Construção:<br>

Utilizando a imagem base golang:1.20-alpine, criei a etapa builder-go.
Defini o diretório de trabalho como /app dentro do contêiner.
Copiei os arquivos com extensão .go do diretório local para /app.
Utilizei go build -ldflags "-s -w" fullcycle-rocks.go para compilar o arquivo fullcycle-rocks.go com flags que reduzem o tamanho do binário resultante. <br>

🔍 Segunda Etapa - Imagem Final:<br>

Iniciei com uma imagem vazia chamada scratch.<br>
Defini o diretório de trabalho como /app novamente.
Copiei o binário fullcycle-rocks gerado na primeira etapa para o diretório /app do contêiner atual.
Configurei o comando CMD ["/app/fullcycle-rocks"] para ser executado quando o contêiner for iniciado.<br>

💡 Essa abordagem do Multi-Stage Building resulta em uma imagem Docker notavelmente menor, pois a etapa final é construída a partir de uma imagem vazia (scratch), eliminando a necessidade de incluir uma distribuição completa do sistema operacional. Com isso, podemos reduzir o tamanho da imagem Docker em cerca de 2MB, tornando-a mais eficiente em termos de armazenamento, transferência e implantação.

🌟 Você pode encontrar a imagem Docker no meu [Docker Hub](https://hub.docker.com/r/mathlopes/fullcycle-go). 🐳🚀
