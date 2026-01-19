import Image from "next/image";
import estilos from "./Contato.module.css";

export default function Contato(){
    return(
    <section id="contato" className={estilos.secaoContato}>
      <div className={estilos.limitarSecao}>
        <h3>Fale conosco</h3>
        <p>
          Não perca tempo, venha conhecer uma de nossas lojas ou entre em
          contato através de nossas redes sociais ou da central de atendimento.
        </p>

        <div className={estilos.contatoContainer}>
          {/* Bloco Contato */}
          <div className={estilos.contatoConteudo}>
            <h4>Contato</h4>

            <div className={estilos.item}>
              <Image src="/local.png" alt="Localização" width={24} height={24} />
              <span>Porto Alegre, RS</span>
            </div>

            <div className={estilos.item}>
              <Image src="/telefone.png" alt="Telefone" width={24} height={24} />
              <span>(51) 99999-9999</span>
            </div>

            <div className={estilos.item}>
              <Image src="/email.png" alt="Email" width={24} height={24} />
              <span>contato@oticavida.com</span>
            </div>
          </div>

          {/* Bloco Redes Sociais */}
          <div className={estilos.contatoConteudo}>
            <h4>Nossas Redes Sociais</h4>

            <div className={estilos.item}>
              <Image src="/fb.png" alt="Facebook" width={24} height={24} />
              <span>/OticaVida</span>
            </div>

            <div className={estilos.item}>
              <Image src="/ig.png" alt="Instagram" width={24} height={24} />
              <span>@oticavidaRS</span>
            </div>

            <div className={estilos.item}>
              <Image src="/tt.png" alt="Twitter" width={24} height={24} />
              <span>@oticavidaRS</span>
            </div>
          </div>
        </div>
      </div>
    </section>
    );
}