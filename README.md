# git-keywords

Substituição de palavras durante o checkout e commit do GIT.

A idéia é usar como o Subversion, trocando palavras reservadas por informações obtidas no log do GIT:

| TAG             | Significado                                                  |
| --------------- | ------------------------------------------------------------ |
| $Author$        | Nome e endereço eletrônico de quem criou o arquivo e data de criação do aruqivo. |
| $AuthorName$    | Nome de quem criou o arquivo.                                |
| $AuthorEmail$   | Endereço eletrônico de quem criou o arquivo.                 |
| $AuthorDate$    | Data de criação do arquivo.                                  |
| $Committer$     | Nome e endereço eletrônico de quem alterou o arquivo e data da última alteração. |
| $CommiterName$  | Nome de quem realizou a última alteração.                    |
| $CommiterEmail$ | Endereço eletrônico de quem realizou a última alteração.     |
| $CommitterDate$ | Data da última alteração.                                    |

