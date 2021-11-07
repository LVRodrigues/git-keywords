# git-keywords

Substituição de palavras durante o checkout e commit do GIT.

A idéia é usar como o Subversion, trocando palavras reservadas por informações obtidas no log do GIT:

| TAG             | Significado                                                  | Exemplo                                                      |
| --------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| $Author$        | Nome e endereço eletrônico de quem criou o arquivo e data de criação do aruqivo. | Luciano Vieira Rodrigues <<lvrodriguesline@gmail.com>>, 2021-11-07 11:22:23 -0300 |
| $AuthorName$    | Nome de quem criou o arquivo.                                | Luciano Vieira Rodrigues                                     |
| $AuthorEmail$   | Endereço eletrônico de quem criou o arquivo.                 | lvrodriguesline@gmail.com                                    |
| $AuthorDate$    | Data de criação do arquivo.                                  | 2021-11-07 11:22:23 -0300                                    |
| $Committer$     | Nome e endereço eletrônico de quem alterou o arquivo e data da última alteração. | Luciano Vieira Rodrigues <<lvrodriguesline@gmail.com>>, 2021-11-07 11:22:23 -0300 |
| $CommiterName$  | Nome de quem realizou a última alteração.                    | Luciano Vieira Rodrigues                                     |
| $CommiterEmail$ | Endereço eletrônico de quem realizou a última alteração.     | lvrodriguesline@gmail.com                                    |
| $CommitterDate$ | Data da última alteração.                                    | 2021-11-07 11:22:23 -0300                                    |
| $Branch$        | Ramificação de registro do arquivo.                          | main                                                         |

