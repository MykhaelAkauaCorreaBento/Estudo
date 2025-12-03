import express from "express";
import servicoBuscarFatoPorAno from "./servico/servico.js";


const app = express();

app.get("/", (req, res) => {
    const anoFato = req.query.ano;

    if(servicoValidaAno(anoFato))
    {
        var fato = servicoBuscarFatoPorAno(anoFato);
        res.json({fato:fato});
    }
    else
    {
        res.status(400).json({erro:'Parâmetro ano inválido'});
    }
});


app.listen(8080, () => {
    console.log("Servidor iniciado na porta 8080");
});