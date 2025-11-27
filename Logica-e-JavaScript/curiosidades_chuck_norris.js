// Praticando

var curiosidades_chuck_norris=[
    {titulo:"Cuidados com a higiene bucal", conteudo:"Chuck Norris usa arame farpado como fio dental."},
    {titulo:"Fórmula para maratonar séries", conteudo:"Chuck Norris pode assistir um episódio de 60 minutos em 22 segundos."},
    {titulo:"Suicida que não morre", conteudo:"Chuck Norris foi homem-bomba 34 vezes."},
    {titulo:"Olhos que tudo vêem", conteudo:"Chuck Norris bungee jump invisível."},
    {titulo:"Manipulando o tempo", conteudo:"Chuck Norris não usa relógio. Ele decide que horas são."},
    {titulo:"Praticando esportes radicais", conteudo:"Chuck Norris faz bungee jump sem corda."},
    {titulo:"Não vale chorar", conteudo:"Chuck Norris faz cebolas chorarem."},
    {titulo:"Tempere de fogo", conteudo:"Chuck Norris usa pólvora como tempero."},
    {titulo:"Extinção dos dinossauros", conteudo:"Chuck Norris encarou os dinossauros uma vez, apenas uma."},
    {titulo:"Contando sem parar", conteudo:"Chuck Norris contou até o infinito.Duas vezes."},


];


var tamanho_colecao = curiosidades_chuck_norris.length;

var numero_sorteado = Math.floor(Math.random() * tamanho_colecao);

var curiosidades_escolhida = curiosidades_chuck_norris[numero_sorteado];

var titulo_curiosidade = curiosidades_escolhida.titulo;
var conteudo_curiosidade = curiosidades_escolhida.conteudo;

console.log("Curiosidade sobre o Chuck Norris");
console.log("Título: " + titulo_curiosidade);
console.log("Conteúdo: " + conteudo_curiosidade);









