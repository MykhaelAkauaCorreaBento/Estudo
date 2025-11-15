//UTC e timestamp

//O que é UTC?
//UTC é a abreviação para Tempo Universal Coordenado. Ele é referência para se calcular
//os fusos horários. 


//Por exemplo, criando uma data levando em considderação que estamos no RS.

const hoje = new Date();

//Sat Nov 15 2025 11:48:35 GTM-0300 (Horário padrão de Brasília).


//Imprimindo uma string com data armazenada

console.log(hoje.toString());

//Sat Nov 15 2025 '11':48:35 GTM-0300 (Horário padrão de Brasília).

//Imprimindo uma string com a data universal(UTC)

console.log(hoje.toUTCString());

//Sat Nov 15 2025 '14':48:35 GTM

//Obs.:UTC é o tempo universal que serve de base para os fusos horários

//Através do UTC conseguimos exibir corretamente uma data em cada fuso horário.

//Por exemplo, se um amigo que vive na Chica eviar uma mensagem às 21:34 o 
//horário que deve aparecer para mim é 10:34. Da mesma for ma o inverso.

//_____________________________________________________________________________

// Toda data é representada por um timestamp.

//O que é Timestamp?
//é uma representação númerica de uma data UTC.

const hoje2 = new Date();
console.log(hoje2.valueOf());

//Timestamp impresso 1763220005545
//O valor retornado é a quantidade de milissegundos que se passaram desde 
//Unix Epoch (1 ded janeiro 1970 às 00:00:00)


//Por que o Timestamp é útil?
//Através dele conseguimos verificar quanto tempo se passou entre uma
//data e outra.

//Exemplo:
//Data da postagem -> 2025-11-11 00:00
//Data atual -> 2025-11-11 16:00
//Quanto tempo se passou -> 16 horas

const dataAtual1 = new Date();
const dataPostagem = new Date('2025-11-11T00:00');


//(----Pegando o timestamp das datas----)
const timeAtual = dataAtual1.getTime();
const timePostagem = dataPostagem.getTime();
//

//(----Verificando a diferença em milissegundos----)
const diferenca = timeAtual - timePostagem;
//

//(----Convertendo em horas----)
const segundos = diferenca / 1000;
const minutos = segundos / 60;
const horas = minutos / 60;
//

//(----Exibindo a diferença----)
console.log(horas);
//Resultado 108.54266444444444 (hoje é dia 15/11/2025 12:33:40) 

//Obs.:Através do UTC conseguimos manipular uma data independente
//do fuso horário e através do Timestamp conseguimos verificar a
//diferença entre uma data e outra



//UTC-e-timestamp.js

