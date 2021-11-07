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

BRANCH=

function getAuthorName {
    AUTHOR_NAME=$(git log --pretty=format:"%an" --reverse "$1" | sed -n 1p)
    echo "   Nome do Autor......: $AUTHOR_NAME"
}

function getAuthorEmail {
    AUTHOR_EMAIL=$(git log --pretty=format:"%ae" --reverse "$1" | sed -n 1p)
    echo "   E-Mail do Autor....: $AUTHOR_EMAIL"
}

function getAuthorDate {
    AUTHOR_DATE=$(git log --pretty=format:"%ad" --reverse --date=iso "$1" | sed -n 1p)
    echo "   Data de criação....: $AUTHOR_DATE"
}

function processAuthor {
    getAuthorName $1
    getAuthorEmail $1
    getAuthorDate $1
}

function getCommitterName {
    COMMITTER_NAME=$(git log --pretty=format:"%cn" -1 "$1")
    echo "   Nome do Alterador..: $COMMITTER_NAME"
}

function getCommitterEmail {
    COMMITTER_EMAIL=$(git log --pretty=format:"%ae" -1 "$1")
    echo "   E-Mail do Alterador: $COMMITTER_EMAIL"
}

function getCommitterDate {
    COMMITTER_DATE=$(git log --pretty=format:"%ad" -1 --date=iso "$1")
    echo "   Data de alteração..: $COMMITTER_DATE"
}

function processCommitter {
    getCommitterName $1
    getCommitterEmail $1
    getCommitterDate $1
}

function processBranch {
    BRANCH=$(git branch --show-current)
    echo "   Branch.............: $BRANCH"
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
processCommitter $FILE
processBranch $FILE

echo "Arquivo $FILE processado."
exit 0