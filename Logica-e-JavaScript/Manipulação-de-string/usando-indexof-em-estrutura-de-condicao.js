//Exemplo prático

//Existem situações em que é útil verificar se uma palavra está dentro
//de um texto. Por exemplo, pode ser necessário bloquear uma palavra inadequada.
//O método indexOf nos ajuda com essa tarefa

let expressao_proibida = "passaporte falso";

let comentario="   venda de PASSAPORTE FALSO";

comentario = comentario.trim();
comentario = comentario.toLowerCase();

if(comentario.indexOf(expressao_proibida) > -1){
    console.log("No seu comentário há palavras probidas. Atualize seu comentário e envie novamente");

}else{
    console.log("Seu comentário foi aprovado");
}

console.log(comentario);


//Obs.: O método indexOf é um ótimo recurso da linguagem JavaScript para 
//encontrar termos simples dentro de textos grandes

//usando-indexof-em-estrutura-de-condicao.js
