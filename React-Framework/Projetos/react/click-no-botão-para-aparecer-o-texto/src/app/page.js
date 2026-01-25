'use client';
import { useState } from "react";
import estilos from "./page.module.css";

export default function Home() {
  const [novoTexto, setNovoTexto] = useState();

  function alterarTexto() {
    setNovoTexto("Hello World!");
  }

  return (
    <main className={estilos.main_container}>
      <div className={estilos.conteudo_centralizado}>
        <div className={estilos.area_texto}>
          <h2>{novoTexto}</h2>
        </div>
        <div className={estilos.area_botao}>
          <label>Click no botão abaixo para aparecer um texto:</label>
          <button onClick={alterarTexto}>Gerar texto</button>
        </div>
      </div>
    </main>
  );
}