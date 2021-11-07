#/bin/bash
#
# git-keyword-smudge.sh
#
#   Aplicada a substituição de palavras reservadas durante um checkout de arquivos 
# com o GIT.
#
#   Criado por Luciano Vieira Rodrigues
#   lvrodriugesline@gmail.com
#   06/11/2021
####################################################################################

AUTHOR_NAME=
AUTHOR_EMAIL=
AUTHOR_DATE=

COMMITTER_NAME=
COMMITTER_EMAIL=
COMMITER_DATE=

function getAuthorName {
    FILE=$1
    AUTHOR_NAME=$(git log --pretty=format:"%an" --reverse $FILE | sed -n 1p)
}

function processAuthor {
    FILE=$1
    echo $(getAuthorName $FILE)
}

if [ ! -d ".git" ]; then
    echo "Não é um repositório GIT."
    exit 1
fi

FILE=$1
if [ ! -f "$FILE" ]; then
    echo "Arquivo $FILE não localizado."
    exit 2
fi

echo "Processando o arquivo: $FILE."

processAuthor $FILE

echo "Arquivo $FILE processado."
exit 0