import Image from "next/image";
import estilos from "./Capa.module.css";

export default function Capa() {
  return (
    <section>
        <div className={estilos.Capa}>
            <Image 
        src="/capa.png"  // caminho direto da pasta public
        alt="Capa"
        fill // ocupa todo o container
        style={{ objectFit: 'cover' }}
        priority
      />
        <div className={estilos.textoCapa}>
            <p>Preços baixos em </p>
            <h1>Óculos de grau e de sol</h1>
            <p>Você só encontra aqui</p>
        </div>
    </div>    
    </section>
  );
}