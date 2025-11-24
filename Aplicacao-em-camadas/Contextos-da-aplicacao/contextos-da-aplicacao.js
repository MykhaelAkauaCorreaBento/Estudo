//Contextos da aplicação


//O contexto de uma aplicação é a separação do seu conteúdo em grupos menores
//com base em suas semelhanças.


//O contexto é um conjunto de informações com um objetivo em comum.

//Exemplo, algoritmo de produção de um bolo de uma confeitaria:

const produçaoDeBolo =[
{Passo1:'Pegue os ingredientes necessários'},
{Passo2:'Separe os ingredientes em recipientes'},
{Passo3:'Coloque os ingredientes na batedeira e misture'},
{Passo4:'Coloque a massa em uma forma, deixe-a descansar'},
{Passo5:'Após alguns minutos leve a forma até o forno'},
{Passo6:'Verifique se o bolo está pronto e retire-o se estiver'},
{Passo7:'Quando o bolo esfriar, adicione o recheio e os confeitos'},
{Passo8:'Com o bolo pronto, coloque-o em exposição na vitrine'},

];
//__________________________________________________________________________


//Nesse caso, queremos fazer um bolo e para isso precisamos olhar para
//o nosso algoritmo e encontrar os contextos dessa tarefa.
//É possível observar 3 contextos distintos no nosso algoritmo.
//A separação em grupos de contexto se deu pelo objetivo das tarefas:

//*Preparação da massa- processo de preparo da massa;

//*Produção do bolo - processo de transformação da massa em bolo;

//*Vender o bolo - ato de exibir o bolo na vitrine para venda;

// Do 1 ao 4 seria a preparação da massa.
const produçaoDeBolo =[
{Passo1:'Pegue os ingredientes necessários'},
{Passo2:'Separe os ingredientes em recipientes'},
{Passo3:'Coloque os ingredientes na batedeira e misture'},
{Passo4:'Coloque a massa em uma forma, deixe-a descansar'},

//Do 5 ao 7 seria a produção do bolo
{Passo5:'Após alguns minutos leve a forma até o forno'},
{Passo6:'Verifique se o bolo está pronto e retire-o se estiver'},
{Passo7:'Quando o bolo esfriar, adicione o recheio e os confeitos'},

//O 8 seria a venda do bolo.
{Passo8:'Com o bolo pronto, coloque-o em exposição na vitrine'},

];
//contextos-da-aplicacao.js