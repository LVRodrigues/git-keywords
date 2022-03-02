# git-keywords

Substituição de palavras durante o checkout e commit do GIT.

A idéia é usar como o Subversion, trocando palavras reservadas por informações obtidas no log do GIT:

| TAG               | Significado                                                                      | Exemplo                                                        |
| ----------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| \$Author\$        | Nome e endereço eletrônico de quem criou o arquivo e data de criação do arquivo. | \$Criado por: Luciano Vieira Rodrigues (lvrodriguesline@gmail.com), 2021-11-07 11:22:23 -0300\$ |
| \$AuthorName\$    | Nome de quem criou o arquivo.                                                    | \$Criado por: Luciano Vieira Rodrigues\$                       |
| \$AuthorEmail\$   | Endereço eletrônico de quem criou o arquivo.                                     | \$Criado por: lvrodriguesline@gmail.com\$                      |
| \$AuthorDate\$    | Data de criação do arquivo.                                                      | \$Criado em: 2021-11-07 11:22:23 -0300\$                       |
| \$Committer\$     | Nome e endereço eletrônico de quem alterou o arquivo e data da última alteração. | \$Alterado por: Luciano Vieira Rodrigues (lvrodriguesline@gmail.com), 2021-11-07 11:22:23 -0300\$ |
| \$CommiterName\$  | Nome de quem realizou a última alteração.                                        | \$Alterado por: Luciano Vieira Rodrigues\$                     |
| \$CommiterEmail\$ | Endereço eletrônico de quem realizou a última alteração.                         | \$Alterado por: lvrodriguesline@gmail.com\$                    |
| \$CommitterDate\$ | Data da última alteração.                                                        | \$Alterado em: 2021-11-07 11:22:23 -0300\$                     |
| \$Branch\$        | Ramificação de registro do arquivo.                                              | \$Ramo: main\$                                                 |

## Dependências

* bash
* git
* sed

## Como usar

Crie uma configuração para um projeto específico, utilizando as configurações locais:

```bash
mkdir <PROJECT>/.git-filters
cp git-keyword-smudge.sh <PROJECT>/.git-filters/.
cp git-keyword-clean.sh <PROJECT>/.git-filters/.

git config --local filter.keyword.smudge "<PROJECT>/.git-filters/git-keyword-smudge.sh %f"
git config --local filter.keyword.clean "<PROJECT>/.git-filters/git-keyword-clean.sh %f"
```

Ou crie uma configuração global, para uso em vários projetos.

```bash
git clone https://github.com/LVRodrigues/git-keywords.git
cd git-keyworks
git config --global filter.keyword.smudge "$(pwd)/git-keyword-smudge.sh %f"
git config --global filter.keyword.clean "$(pwd)/git-keyword-clean.sh %f"
```

Para cada projeto que desejar a macro substituição, adicione informações de tipo de arquivo e filtro para aplicar no arquivo **.gitattributes", na raíz do projeto. Por exemplo, para processar arquivos do tipo java, execute:

```bash
echo "*.java filter=keyword" >> <PROJECT>/.gitattributes
```
