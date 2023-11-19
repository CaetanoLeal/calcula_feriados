# Function complexa que calcula e filtra feriados
Olá! Há algum tempo, precisei desenvolver um código que calculasse datas de feriados e filtrasse esses feriados para a empresa onde trabalho. Durante minha pesquisa, percebi que há poucos recursos disponíveis na internet sobre este tópico, e que a tarefa é mais complexa do que parece inicialmente. Com a ajuda da minha equipe, conseguimos desenvolver um código eficaz e uma metodologia que se adequou perfeitamente ao nosso sistema. Com base nessa experiência, decidi fazer e compartilhar este código para auxiliar outras pessoas que possam estar enfrentando o mesmo desafio. Espero que este recurso seja útil para aqueles que se depararem com esta tarefa.

## Metodologia
Cada feriado cadastrado deve ter um tipo sendo eles:<br>
**1 = especifico**  --> para feriados que são específicos para uma data única<br>
**2 = fixo** --> para feriados que se repetem todo o ano no mesmo dia<br>
**3 = variavel** --> para feriados que acontecem em determinado dia da semana em determinada semana do mês (ex: Domingo de ramos)<br>

Para cadastrar um feriado fixo, não é necessário informar o ano, pois este sempre se repetirá. Ao informar um feriado variável, não é necessário informar o dia e o ano, apenas o dia da semana, qual semana do mês ocorrerá e o mês.
A função fn_calcula_feriado calculará a data exata dos feriados cadastrados e os converterá para date (convertendo até feriados específicos, que para não dar conflitos, este, apesar de ser uma data exata, não é do tipo date).

## A Function
Apesar do código complexo a function **fn_calcula_feriado** tem um funcionalidade bem simples. ela pede como parametros uma data inicial e uma data final. Todos os feriados cadastrados que estiverem entre a data inicial e a data final serão exibidos!<br>
 -Mas como ela sabe a data exata dos feriados?<br>
Ela faz uma especie de cálculo com base no tipo do feriado cadastrado, para cada tipo existe um cálculo e uma verificação diferente. Após isto ela converte os resultados para o tipo date, resultando assim na data exata dos feriados cadastrados. Com a data exata então, ela consegue fazer o filtro de feriados presentes entre data inicial e data final.

## Instalação
Faça os processos padrões do github que dará certo!<br>
Mas não esqueça de rodar primeiro o arquivo **important_querys** lá contem a query que fará ser possivel a function **fn_calcula_feriado** funcionar sem erros.

## Considerações
código 100% postgres sem nenhum tipo de front end pois meu intuito é apenas ajudar pessoas que precisam fazer algo semelhante para seu sistema, sinta-se à vontade para fazer suas adaptações, seu próprio front end ou até mesmo integrar a function no seu sistema quem sabe...<br>
se esse repositório te ajudou não esquece do follow😉
