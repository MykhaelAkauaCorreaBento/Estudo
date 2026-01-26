'use client';
import Image from "next/image";
import {useState} from "react";
import {BsSun, BsMoon} from "react-icons/bs"
import estilos from "./page.module.css";

export default function Home() {
  const [alterarTema, setAlterarTema] = useState(false);

  function trocarTemaPagina(){
    setAlterarTema(!alterarTema)
  }
  return (
   <div className={alterarTema ? estilos.dark_mode: estilos.light_mode}>
    <header className={estilos.header_container}>
    <Image src="/barbearia.png" alt="Logomarca"
    width={100}
    height={100}
    />
    <button onClick={trocarTemaPagina}>
      {alterarTema ? <BsSun/> : <BsMoon/>}
    </button>
    </header>

    <main>
      <div className={estilos.banner_imagem}>
        <Image src="/banner.jpg" alt="Capa"
        fill
        />
      </div>
      <div className={estilos.sobre_barber_shop}>
        <h1>Bem-vindo a Barber Shop</h1>
        <p className={estilos.negrito}>
          Nossa barbearia sempre oferece profissionais de qualidade e estamos protos
           para lidar com suas maiores expectativas.
        </p>
        <p>
          Nossos serviços são dedicados ao seu sucesso pessoal. Aqui uma equipe 
          premiada que demonstrou o talento de mestres barbeiros em vários concursos
          de estilo. Deixe nosso barbeiro ser seu estilista pessoal e você não ficará
          desapontado.
        </p>
        <p className={estilos.assinatura}>
          S.Kelly
        </p>
      </div>
    </main>

   </div>
  );
}
