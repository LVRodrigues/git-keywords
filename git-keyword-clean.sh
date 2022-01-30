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

if [ ! -d ".git" ]; then
    echo "Não é um repositório GIT."
    exit 1
fi

FILE="$1"
if [ ! -f "$FILE" ]; then
    echo "Arquivo $FILE não localizado."
    exit 2
fi

SEARCH_BRANCH='\$Ramo\:.*\$'
SEARCH_COMMITTER='\$Alterado por:.*@.*\,.*-.*-.*\$'
SEARCH_COMMITTER_DATE='\$Alterado em: [0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}.*\$'
SEARCH_COMMITTER_EMAIL='\$Alterado por:.*@.*\..*\$'
SEARCH_COMMITTER_NAME='\$Alterado por:.*\$'
SEARCH_AUTHOR='\$Criado por:.*@.*\,.*-.*-.*\$'
SEARCH_AUTHOR_DATE='\$Criado em: [0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}.*\$'
SEARCH_AUTHOR_EMAIL='\$Criado por:.*@.*\..*\$'
SEARCH_AUTHOR_NAME='\$Criado por:.*\$'

sed -e "s|$SEARCH_BRANCH|\$Branch\$|g" \
    -e "s|$SEARCH_COMMITTER|\$Committer\$|g" \
    -e "s|$SEARCH_COMMITTER_DATE|\$CommitterDate\$|g" \
    -e "s|$SEARCH_COMMITTER_EMAIL|\$CommitterEmail\$|g" \
    -e "s|$SEARCH_COMMITTER_NAME|\$CommitterName\$|g" \
    -e "s|$SEARCH_AUTHOR|\$Author\$|g" \
    -e "s|$SEARCH_AUTHOR_DATE|\$AuthorDate\$|g" \
    -e "s|$SEARCH_AUTHOR_EMAIL|\$AuthorEmail\$|g" \
    -e "s|$SEARCH_AUTHOR_NAME|\$AuthorName\$|g" $FILE

exit $?