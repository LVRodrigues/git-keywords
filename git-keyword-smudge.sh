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
    if [ -z "$AUTHOR_NAME" ]; then
        AUTHOR_NAME=$(git log --pretty=format:"%an" --reverse "$1" | sed -n 1p)
    fi
}

function getAuthorEmail {
    if [ -z "$AUTHOR_EMAIL" ]; then
        AUTHOR_EMAIL=$(git log --pretty=format:"%ae" --reverse "$1" | sed -n 1p)
    fi
}

function getAuthorDate {
    if [ -z "$AUTHOR_DATE" ]; then
        AUTHOR_DATE=$(git log --pretty=format:"%ad" --reverse --date=iso "$1" | sed -n 1p)
    fi
}

function getCommitterName {
    if [ -z "$COMMITER_NAME" ]; then
        COMMITTER_NAME=$(git log --pretty=format:"%cn" -1 "$1")
    fi
}

function getCommitterEmail {
    if [ -z "$COMMITTER_EMAIL" ]; then
        COMMITTER_EMAIL=$(git log --pretty=format:"%ae" -1 "$1")
    fi
}

function getCommitterDate {
    if [ -z "$COMMITTER_DATE" ]; then
        COMMITTER_DATE=$(git log --pretty=format:"%ad" -1 --date=iso "$1")
    fi
}

function processAuthor {
    getAuthorName "$1"
    getAuthorEmail "$1"
    getAuthorDate "$1"
    SEARCH='\$Author\$'
    REPLACE='\$Criado por: '$AUTHOR_NAME' <'$AUTHOR_EMAIL'>, '$AUTHOR_DATE'\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"
}

function processAuthorName {
    getAuthorName "$1"
    SEARCH='\$AuthorName\$'
    REPLACE='\$Criado por: '$AUTHOR_NAME'\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"
}

function processAuthorEmail {
    getAuthorEmail "$1"
    SEARCH='\$AuthorEmail\$'
    REPLACE='\$Criado por: '$AUTHOR_EMAIL'\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"
}

function processAuthorDate {
    getAuthorDate "$1"
    SEARCH='\$AuthorDate\$'
    REPLACE='\$Criado em: '$AUTHOR_DATE'\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"
}

function processCommitter {
    getCommitterName "$1"
    getCommitterEmail "$1"
    getCommitterDate "$1"
    SEARCH='\$Committer\$'
    REPLACE='\$Alterado por: '$COMMITTER_NAME' <'$COMMITTER_EMAIL'>, '$COMMITTER_DATE'\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"    
}

function processCommitterName {
    getCommitterName "$1"
    SEARCH='\$CommitterName\$'
    REPLACE='\$Alterado por: '$COMMITTER_NAME'\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"    
}

function processCommitterEmail {
    getCommitterEmail "$1"
    SEARCH='\$CommitterEmail\$'
    REPLACE='\$Alterado por: '$COMMITTER_EMAIL'\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"    
}

function processCommitterDate {
    getCommitterDate "$1"
    SEARCH='\$CommitterDate\$'
    REPLACE='\$Alterado por: '$COMMITTER_DATE'\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"    
}

function processBranch {
    if [ -z "$BRANCH" ]; then 
        BRANCH=$(git branch --show-current)
    fi
    SEARCH='\$Branch\$'
    REPLACE='\$Ramo: '$BRANCH'\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"
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

processAuthor "$FILE"
processAuthorName "$FILE"
processAuthorEmail "$FILE"
processAuthorDate "$FILE"
processCommitter "$FILE"
processCommitterName "$FILE"
processCommitterEmail "$FILE"
processCommitterDate "$FILE"
processBranch "$FILE"

exit 0