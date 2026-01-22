import Image from "next/image";
import estilos from "./sobre.module.css";

export default function Sobre(){
    return(
        <div>
            <header>
                <h1>A GELATERIA</h1>
                <Image src="/banner-sobre.png" alt="Banner Sobre"
                width={200}
                height={200}/>
            </header>
            <section>
                <h2>Sobre Nós</h2>
                <h3>Somos apaixonados por gelato e carregamos com orgulho a descendência italiana.</h3>
                
                <p>
                    Nossa história vem das raízes italianas, onde o fazer artesanal e o cuidado com cada detalhe sempre foram passados de geração em geração. É essa herança que colocamos em cada sorvete que produzimos, com muito carinho e dedicação.
                    Desde 1890, trabalhamos com matérias-primas de primeira qualidade, unindo a tradição italiana ao jeito gaúcho de receber bem e fazer tudo com capricho. Atendemos tanto o varejo quanto o atacado, sempre pensando em oferecer o melhor pra quem chega até nós.

                </p>

                <p>
                    Aqui, tu pode aproveitar nossos gelatos na loja, levar pra casa e dividir com a família ou contar com a gente pra atender estabelecimentos e eventos como aniversários, formaturas e eventos empresariais.
                    Pra contratar nossos serviços, é só entrar em contato. A gente garante atendimento de primeira e sorvetes artesanais feitos com história, tradição e muito sabor — do jeito que o gaúcho gosta.
                </p>
            </section>

            <div>
                <Image src="/sobre-image.jpg" alt="Sobre Image"
                width={200}
                height={200}/>

                <Image src="/sorveteria.jpg" alt="Sorveteria"
                width={200}
                height={200}/>
            </div>

        </div>
    );
}