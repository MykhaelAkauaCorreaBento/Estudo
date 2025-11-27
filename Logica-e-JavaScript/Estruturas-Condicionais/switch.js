//Switch
//Essa é uma estrutura condicional switch

var produto = "Smartphone";

switch(produto) //expressão a ser validade.
{
    case "Smartphone": // A cláusula case compara o valor "smartphone" com o valor da empressão.
       
        console.log("produto: Smartphone");//Mensagem impressa se o valor da empressão for "Smartphone".
        break;
    case "TV":
        console.log("Produto: TV");
        break;
    
    
    default:                             //Define o código padrão a ser executado caso nenhuma cláusula case seja atendida.
        console.log("produto inválido");
        break;
}


//______________________________________________________________________________

//Além do formato simples visto a cima, também é possível utilizar múltiplas
//cláusulas case para um mesmo resultado.


var produto = "Smartphone";

switch(produto)
{

    //A mensagem "Produto Smartphone" será impresa se pelo manos uma das três cláusulas case for atendida.
    case "Smartphone":
    case "Celular":
    case "Telefone":
         console.log("produto: Smartphone");
         break;
    case "TV":
        console.log("Produto: TV");
        break;
    default:
        console.log("Produto inválido");
        break;
}










