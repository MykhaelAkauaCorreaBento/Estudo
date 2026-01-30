'use client';
import { useState } from "react";
import estilos from "./page.module.css";
import CardAnimal from './componentes/CardAnimal';
import CardInformacoes from './componentes/CardInformacoes';
import Topo from "./componentes/Topo";

export default function Home() {
  const [tipoDoComponenteCard, setTipoDoComponenteCard] = useState("cachorro");

  return (
    <div className={estilos.container_principal}>
      <Topo tipoAnimal={tipoDoComponenteCard} setState={setTipoDoComponenteCard} />
      <main>
        <CardAnimal tipoAnimal={tipoDoComponenteCard}/>
        <CardInformacoes tipoAnimal={tipoDoComponenteCard}/>
      </main>
    </div>
  );
}