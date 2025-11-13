//Separando strings em partes
//Na programação é comum quebrar strings em partes menores e usar essas
//substrings para algum fim. No JavaScript temos um recurso nativo que cuida
//dessa tarefa

//split método

//Quando for necessário separar uma string em substrings, basta usar o método split()

let monsterhunter= "Rathalos Gogomazio Diablos Nargacuga Nergigante Rajang Deviljho";

let monster_array = monsterhunter.split(" ");

console.log(monster_array);



let pokemon_string = "Charizard,Pikachu,Eevee,Mew,Arcanaine";

let pokemon_array= pokemon_string.split(",");

console.log(pokemon_array);

//Obs.:O método split() aceita um parâmetro que tenha mais de 1 caractere
//para quebrar strings, porém é mais comum o uso de um único caractere
//para essa tarefa.

//separando-strings-em-partes-split.js