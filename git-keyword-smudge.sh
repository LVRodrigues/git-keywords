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

if [ ! -d ".git" ]; then
    echo "Não é um repositório GIT."
    exit 1
fi

FILE="$1"
if [ ! -f "$FILE" ]; then
    echo "Arquivo $FILE não localizado."
    exit 2
fi

AUTHOR_NAME=$(git log --pretty=format:"%an" --reverse "$FILE" | sed -n 1p)
AUTHOR_EMAIL=$(git log --pretty=format:"%ae" --reverse "$FILE" | sed -n 1p)
AUTHOR_DATE=$(git log --pretty=format:"%ad" --reverse --date=iso "$FILE" | sed -n 1p)
COMMITTER_NAME=$(git log --pretty=format:"%cn" -1 "$FILE")
COMMITTER_EMAIL=$(git log --pretty=format:"%ae" -1 "$FILE")
COMMITTER_DATE=$(git log --pretty=format:"%ad" -1 --date=iso "$FILE")
BRANCH=$(git branch --show-current)

SEARCH_AUTHOR='\$Author\$'
SEARCH_AUTHOR_NAME='\$AuthorName\$'
SEARCH_AUTHOR_EMAIL='\$AuthorEmail\$'
SEARCH_AUTHOR_DATE='\$AuthorDate\$'
SEARCH_COMMITTER='\$Committer\$'
SEARCH_COMMITTER_NAME='\$CommitterName\$'
SEARCH_COMMITTER_EMAIL='\$CommitterEmail\$'
SEARCH_COMMITTER_DATE='\$CommitterDate\$'
SEARCH_BRANCH='\$Branch\$'

sed -e "s|$SEARCH_AUTHOR|\$Criado por: $AUTHOR_NAME <$AUTHOR_EMAIL>, $AUTHOR_DATE\$|g" \
    -e "s|$SEARCH_AUTHOR_NAME|\$Criado por: $AUTHOR_NAME\$|g" \
    -e "s|$SEARCH_AUTHOR_EMAIL|\$Criado por: $AUTHOR_EMAIL\$|g" \
    -e "s|$SEARCH_AUTHOR_DATE|\$Criado em: $AUTHOR_DATE\$|g" \
    -e "s|$SEARCH_COMMITTER|\$Alterado por: $COMMITTER_NAME <$COMMITTER_EMAIL>, $COMMITTER_DATE\$|g" \
    -e "s|$SEARCH_COMMITTER_NAME|\$Alterado por: $COMMITTER_NAME\$|g" \
    -e "s|$SEARCH_COMMITTER_EMAIL|\$Alterado por: $COMMITTER_EMAIL\$/|g" \
    -e "s|$SEARCH_COMMITTER_DATE|\$Alterado em: $COMMITTER_DATE\$|g" \
    -e "s|$SEARCH_BRANCH|\$Ramo: $BRANCH\$|g" "$FILE"

exit 0