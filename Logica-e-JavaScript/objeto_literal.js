var produto = {
    id:9,
    nome: "cafeteira Elétrica",
    preco:99.00
};

console.log(produto.id); // 9
console.log(produto.nome); // Cafeteira Elétrica
console.log(produto.valor); // 99.00

var cliente ={
id:40,
nome:"Christian Becker",
telefone: "(51) 99999-9999"
};

console.log(cliente.id); // 40
console.log(cliente.nome); //Christian Becker

// O objeto literal foi criado para agrupar dados de um produto.
//Exemplo: id, nome e preco.
// Objeto literal produto reúne diversos dados relacionados a um produto.

//Um objeto literal deve ser utilizado para guardar dados de um único domínio (contexto).
//Se mais domínios (contextos) estiverem envolvidos, devem ser criados objetos literais para cada um deles
//________________________________________________________________________________________________________

var aula = {
    id:10,
    titulo:'Objetos literais',
    tecnologia: 'JavaScrip'
};

var usuario_logado = true;

console.log(aula.id); //10
console.log(aula.titulo); //Objetos literais
console.log(aula.tecnologia); // JavaScript

console.log(usuario_logado); //true

//________________________________________________________________________________________________________


//Exemplo prático

var usuario ={
    id:2,
    nome:'Mykhael Bento',
    idade:27
};

var atendeAClassificacaoEtaria = usuario.idade >= 18

if (atendeAClassificacaoEtaria === true){
    console.log("Acesso permitido do conteúdo");
}else{
    console.log("O usuário ainda não pode assistir o consteúdo");
};


///Um objeto literal só pode conter dados que pertencem a um mesmo domínio (contexto). 
// Caso existam dados que são relacionados a domínios (contextos) diferentes, será necessário criar
//  um ou mais objetos literais para guardar esses dados.