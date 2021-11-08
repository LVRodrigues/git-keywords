#/bin/bash
#
# git-keyword-clean.sh
#
#   Reverte a substituição de palavras reservadas durante um checkout de arquivos 
# com o GIT.
#
#   Criado por Luciano Vieira Rodrigues
#   lvrodriugesline@gmail.com
#   06/11/2021
####################################################################################

function processAuthor {
    SEARCH='\$Criado por:.*@.*\,.*-.*-.*\$'
    REPLACE='\$Author\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"
}

function processAuthorName {
    SEARCH='\$Criado por:.*\$'
    REPLACE='\$AuthorName\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"
}

function processAuthorEmail {
    SEARCH='\$Criado por:.*@.*\..*\$'
    REPLACE='\$AuthorEmail\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"
}

function processAuthorDate {
    SEARCH='\$Criado em: [0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}.*\$'
    REPLACE='\$AuthorDate\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"
}

function processCommitter {
    SEARCH='\$Alterado por:.*@.*\,.*-.*-.*\$'
    REPLACE='\$Committer\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"    
}

function processCommitterName {
    SEARCH='\$Alterado por:.*\$'
    REPLACE='\$CommitterName\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"
}

function processCommitterEmail {
    SEARCH='\$Alterado por:.*@.*\..*\$'
    REPLACE='\$CommitterEmail\$'
    sed -i -e "s|$SEARCH|$REPLACE|g" "$1"    
}

function processCommitterDate {
    SEARCH='\$Alterado por: [0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}.*\$'
    REPLACE='\$CommitterDate\$'
    sed -i -e "s/$SEARCH/$REPLACE/g" "$1"    
}

function processBranch {
    SEARCH='\$Ramo\:.*\$'
    REPLACE='\$Branch\$'
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

# A ordem de execução é importante, devido as características
# das expressões regulares.
processBranch "$FILE"
processCommitter "$FILE"
processCommitterDate "$FILE"
processCommitterEmail "$FILE"
processCommitterName "$FILE"
processAuthor "$FILE"
processAuthorDate "$FILE"
processAuthorEmail "$FILE"
processAuthorName "$FILE"

exit 0