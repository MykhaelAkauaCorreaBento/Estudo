// exemplo da estrutura de repetição for .. of

let clientes_array = [

    //Objetos do array ex.: "{id:1, nome:"Eliane",  telefone:"99999-9956" }"
    
    //Cada objeto do array será atribuido à variável "cliente" a cada iteração.
    //
    {id:1, nome:"Eliane",  telefone:"99999-9956" },
    {id:2, nome:"Ramon",   telefone:"99999-9995" },
    {id:3, nome:"Sérgio",  telefone:"99999-9996" },
    {id:4, nome:"Dandara", telefone:"99999-9977" },
    {id:5, nome:"Mykhael", telefone:"99999-9997" },
];
       //"cliente"
for(let cliente of clientes_array){


    //Guardando os valores das propriedades dos objetos em cariáveis.
    let nome = cliente.nome;
    let telefone = cliente.telefone;
    //


    console.log("Nome: " +nome+ " - Telefone "+ telefone);
}

//clientes_array será percorrido pelo laço for..of

//clientes-array-sera-percorrido-pelo-laco-for-in.js