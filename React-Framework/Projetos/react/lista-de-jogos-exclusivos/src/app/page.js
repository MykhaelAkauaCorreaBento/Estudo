'use client';
import Image from "next/image";
import estilos from "./page.module.css";
import Lupa from "../../public/lupa.png";
import ItemJogos from "./componentes/ItemJogos";
import {useState} from "react";
import { jogosExclusivos } from "./dados/jogos";

export default function Home() {
  const [listaJogos, setListaJogos] = useState(jogosExclusivos);
  const [textoBusca, setTextoBusca] = useState("");

  const handleFiltrarJogoPlataforma = (plataforma) => {
    setListaJogos(jogosExclusivos.filter((jogo) => jogo.plataforma === plataforma));
    setTextoBusca("");
  }

  const handleLimparFiltro = () => {
    setListaJogos(jogosExclusivos);
    setTextoBusca("");
  }

  const handleBuscarJogo = (textoDigitado) => {
    setTextoBusca(textoDigitado);
    setListaJogos(jogosExclusivos.filter((jogo) =>
      jogo.nome.toLowerCase().includes(textoDigitado.toLowerCase()) || 
      jogo.plataforma.toLowerCase().includes(textoDigitado.toLowerCase()))
    );
  };

  return (
    <div className={estilos.container_principal}>
      <h2>Lista de Jogos Exclusivos</h2>
      <div className={estilos.container_btns}>
        <button onClick={() => handleFiltrarJogoPlataforma("xbox")}>XBOX</button>
        <button onClick={() => handleFiltrarJogoPlataforma("playstation")}>PlayStation</button>
        <button onClick={() => handleFiltrarJogoPlataforma("nintendo")}>Nintendo</button>
        <button onClick={() => handleLimparFiltro()}>Limpar Filtro</button>
      </div>

      <div className={estilos.container_input}>
        <Image src={Lupa} alt="ícone" />
        <input
          type="text"
          value={textoBusca}
          onChange={(event) => handleBuscarJogo(event.target.value)}
          placeholder="Pesquise um jogo ou plataforma"
        />
      </div>

      <div className={estilos.container_cards}>
        {listaJogos.map((jogo, index) => (
          <ItemJogos
            key={index}
            nome={jogo.nome}
            plataforma={jogo.plataforma}
          />
        ))}
      </div>
    </div>
  );
}