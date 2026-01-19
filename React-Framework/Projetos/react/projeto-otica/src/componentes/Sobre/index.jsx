import Image from "next/image";
import estilos from "./Sobre.module.css";
export default function Sobre() {
    return (
           <section id="sobre" className={estilos.sobre}>
            <h2>QUEM SOMOS NÓS</h2>
            <p>
                Fundada em 2001, em Porto Alegre, no Rio Grande do Sul, a Ótica Vida iniciou suas atividades no atendimento ao público gaúcho, sempre com o objetivo de proporcionar bom atendimento, qualidade e preços acessíveis.
            </p>

            <div className={estilos.sobre_grid}>
                {/* Caixa 1: Apenas imagem */}
                <div className={`${estilos.sobre_card} ${estilos.card_img}`}>
                    <Image
                        src="/loja.png"
                        alt="Loja"
                        layout="fill"
                        objectFit="cover"
                        priority
                    />
                </div>

                {/* Caixa 2: Apenas texto */}
                <div className={`${estilos.sobre_card} ${estilos.card_text}`}>
                    <h3>NOSSAS FILIAIS</h3>
                    <p>Hoje temos mais de 200 filiais pela América</p>
                </div>

                {/* Caixa 3: Apenas texto */}
                <div className={`${estilos.sobre_card} ${estilos.card_text}`}>
                    <h3>ATENDIMENTO FLEXÍVEL</h3>
                    <p>Nossa equipe é treinada para te atender</p>
                </div>

                {/* Caixa 4: Apenas imagem */}
                <div className={`${estilos.sobre_card} ${estilos.card_img}`}>
                    <Image
                        src="/atendimento.png"
                        alt="Atendimento"
                        layout="fill"
                        objectFit="cover"
                        priority
                    />
                </div>
            </div>
        </section>
    );
}