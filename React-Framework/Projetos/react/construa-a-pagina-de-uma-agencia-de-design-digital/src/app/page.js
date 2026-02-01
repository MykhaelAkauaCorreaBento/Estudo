'use client';
import { useState } from 'react';
import Topo from './componentes/Topo';
import SecaoBanner from './componentes/SecaoBanner';
import SecaoExperienciaTrabalho from './componentes/SecaoExperienciaTrabalho';
import Rodape from './componentes/Rodape';
import estilos from './page.module.css';

export default function Home() {

  const [ehTemaEscuro, setTemaEscuro] = useState(false)

  function alterarTema() {
    setTemaEscuro(!ehTemaEscuro)
  }

  return (
    <div className={estilos.container}>
      <Topo alterarTema={alterarTema} ehTemaEscuro={ehTemaEscuro}/>
      <main>
        <SecaoBanner ehTemaEscuro={ehTemaEscuro}/>
        <SecaoExperienciaTrabalho ehTemaEscuro={ehTemaEscuro}/>
      </main>
      <Rodape ehTemaEscuro={ehTemaEscuro}/>
    </div>
  );
}