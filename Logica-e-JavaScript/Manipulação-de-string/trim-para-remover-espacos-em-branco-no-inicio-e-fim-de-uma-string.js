//Removendo espaços em branco do início e do final de uma string


//É comum que algumas strings tenham espaços em branco no início e/ou no final.
//Como esses espaços normalmente são desnecessários, devem ser removidos 
//deixando apenas o conteúdo da string.

//método nativo
//'trim'


let nome = "    Gogmazios   ";
let resultado = nome.trim();

console.log(resultado);

//trim-para-remover-espacos-em-branco-no-inicio-e-fim-de-uma-string.js


let monster1="Rathalos";
let monster2="  Rathalos  ";

//Mesmo que os monstros sejam os mesmos,
//serão considerados diferentes por causa dos espaços.
if(monster1 == monster2){
//

    console.log("São os mesmos monstros");
}else{
    console.log("São monstros diferentes");
}


//Com o método 'trim()' removemos os espaços em branco desnecessários na comparação entre as string.


let monsterhunter1="MonsterHunter2Dos";
let monsterhunter2="       MonsterHunter2Dos     ";

if(monsterhunter1.trim() == monsterhunter2.trim()){
    console.log("São os mesmos jogos de Monster Hunter");
}else{
    console.log("São jogos diferentes de Monster Hunter");
}

//Obs.: Geralmente o método trim() é usado no cadastro e na validação de dados.