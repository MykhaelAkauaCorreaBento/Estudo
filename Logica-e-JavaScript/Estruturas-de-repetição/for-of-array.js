//For..of
//A estrutura de repetição for .. of permite iterar coleções, 
//onde podemos manipular os valores iterados no loop.

let emails_alunos=[
    "eliane@gmail.com",
    "ramon@gmail.com",
    "sergio@gmail.com",
    "dandara@gmail.com",
    "mykhael@gmail.com",
];

for(let email of emails_alunos){
    console.log("Email: "+ email);// cada valor de emails_alunos será impresso aqui.
}

//Os valores do array serão percorridos e em cada iteração um valor será
//atribuido a variável email.

//Obs.:A estrutura for..of não precisa de um contador para iterar os valores 
//de uma array, diferente das estruturas while,do..while e for.

//for-of-array.js