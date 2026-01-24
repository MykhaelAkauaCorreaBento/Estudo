'use client';
import estilos from './page.module.css';
import { useState } from "react";

export default function Home() {
  const [nomeBtn, setNomeBtn] = useState('Abrir');

  function mudarNomeBotao() {
    setNomeBtn('Fechar');
  }

  return (
    <main className={ estilos.main }>
      <div>
        <button onClick={ mudarNomeBotao }>{ nomeBtn }</button>
      </div>
    </main>
  );
}