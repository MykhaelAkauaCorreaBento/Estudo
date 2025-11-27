//Funções sem parâmetros

//Parâmetro é um valor que uma função recebe para usar no seu bloco de código.
//Funções sem parâmetro não vão receber valores para executar em seus blocos de códigos.


//Exemplo de função sem parâmetro

function retorna_versao()//Nenhum parâmetro foi passado para a função.
{
    return 1.1;//retorno da versão.
}

let versao = retorna_versao();//Atribuímos na variável versao a função que nos retorna a versão de uma aplicação.

console.log(versao);//E por fim, imprimimos a variável.

//A função retorna_versao apenas retorna a versão de uma aplicação. 
//Note que entre os parênteses, não há nenhum valor, o que significa
//dizer que se trata de uma função sem parâmetro.

//Reaproveitando a função em diferentes partes da aplicação.

//Informação do painel administrativo
let versao = retorna_versao();
let texto_versao = " Versão aplicação: " + versao;

console.log(texto_versao);

//Rodapé da aplicação

let versao = retorna_versao();
let texto_versao = "Aplicação DevMidia - Versão: " + versao;

console.log(texto_versao);

//Quando uma aplicação precisa executar o mesmo código em lugares direfentes,
//criamos uma função para usar nesse tipo de situação.

//Obs.:Eu sei que não pode ter variáves com os mesmos valores no let, mas isso
//é apenas uma anotação do curso.



//funcoes-sem-parametros.js