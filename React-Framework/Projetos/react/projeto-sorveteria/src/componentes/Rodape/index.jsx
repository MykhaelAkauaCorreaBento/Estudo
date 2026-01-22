import Image from "next/image";
import estilos from "./Rodape.module.css";

export default function Rodape() {
  return (
    <footer className={estilos.container_rodape}>
      
      <div className={estilos.container_informacoes}>
        
        <Image
          className={estilos.img}
          src="/logo.png"
          alt="Logomarca"
          width={100}
          height={100}
        />

        <div>
          <h4>ENDEREÇO</h4>
          <p>Av. Borges de Medeiros, 250</p>
          <p>Porto Alegre, RS 90020-021</p>
        </div>

        <div>
          <h4>CONTATO</h4>
          <p>contato@gelateria.com.br</p>
          <p>(51) 3456-7890</p>
        </div>

        <div>
          <h4>HORÁRIOS</h4>
          <p>Aberto todos os dias</p>
          <p>10:00 – 22:00</p>
        </div>

      </div>

      <div className={estilos.container_direito_autoral}>
        <p>Gelateria. Orgulhosamente desenvolvido por Mykhael</p>
      </div>

    </footer>
  );
}