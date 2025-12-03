import express from "express";
import servicoBuscarFatoPorAno from "./servico/servico.js";


const app = express();

app.get("/", (req, res) => {
    const anoFato = req.query.ano;

    const fato = servicoBuscarFatoPorAno(anoFato);

    res.json({
        ano: anoFato,
        fato: fato
    });
});

app.listen(8080, () => {
    console.log("Servidor iniciado na porta 8080");
});