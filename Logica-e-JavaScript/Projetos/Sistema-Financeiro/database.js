import fs from "fs";

export function carregarDados(){
    const conteudoJSON = fs.readFileSync("dados.json", "utf-8");
    return JSON.parse(conteudoJSON);
}

export function salvarDados(dados){
    fs.writeFileSync("dados.json", JSON.stringify(dados, null, 2));
}