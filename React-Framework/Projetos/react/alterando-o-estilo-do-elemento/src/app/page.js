'use client';
import {useState} from "react";
import estilos from "./page.module.css";

export default function Home() {
  const [novoEstilo, setNovoEstilo]= useState(estilos.bg_vermelho);

  function alterarEstilo(){
    setNovoEstilo(estilos.bg_azul)
  }
  return (
    
    <main classNAme={estilos.main}>
      <div className={estilos.container}>
        <h2>Alterando estilos de elemento</h2>
        <div className={novoEstilo}></div>
        <p>Clique no botão para alterar o estilo do elemento acima</p>
        <button onClick={alterarEstilo}>Alterar</button>
      </div>

    </main>
  );
}
