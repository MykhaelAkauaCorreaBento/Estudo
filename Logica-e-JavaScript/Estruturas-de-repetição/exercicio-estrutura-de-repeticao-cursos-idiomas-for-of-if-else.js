//Praticando Código-do-arquivo-cursos-idiomas.js


//Aqui temos o array cursos_idiomas
//Cada objeto representa um curso, que tem os seguintes atributos:nome,preco,carga_horaria.

let cursos_idiomas = [
    {nome:"Inglês",   preco:2500, carga_horaria:160},
    {nome:"Espanhol", preco:1500, carga_horaria:110},
    {nome:"Frânçes",  preco:3600, carga_horaria:200},
    {nome:"Chinês",   preco:5500, carga_horaria:400},
    {nome:"Alemão",   preco:3800, carga_horaria:230},
];
//


//A variável curso será usada para acessar os atributos de cada curso na estrutura for..of.

for(let curso of cursos_idiomas){

    //Cada uma das variáveis irá representar um attributo do curso
    let nome_curso = curso.nome;
    let preco_curso = curso.preco;
    let carga_horaria = curso.carga_horaria;
    //


    
    //preco_hora_curo representa o valor da hora do curso. Esse valor é a divisão
    //do preço do curso pela carga horária.
    let preco_hora_curso =preco_curso/carga_horaria;
    //
    
    
    //imprimindo os dados dos cursos
    console.log("\nnome do curso " + nome_curso);
    console.log("Carga horári do curso: " + carga_horaria + " horas");
    console.log("Preço do curso R$" + preco_curso+ ",00");
    //

    
    //Uma mensagem será exibida de acordo com a condição da estrutura condicional
    if(preco_hora_curso >= 15){
        console.log("Hora/aula supeior ou igual a R$15.00");
    
    }else{
        console.log("Hora/aula inferior a R$15,00")
    }
    //

    console.log("\n");
}
//




//exercicio-estrutura-de-repeticao-cursos-idiomas-for-of-if-else.js