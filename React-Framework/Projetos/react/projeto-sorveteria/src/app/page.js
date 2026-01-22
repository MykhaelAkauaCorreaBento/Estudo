import Image from "next/image";
import estilos from "./page.module.css";

export default function Home() {
  return (
    <div>
      <main className={estilos.main}>
        <header>
          <h1>SORVETE ARTESANAL</h1>
          <Image src="/banner-home.png" alt="Banner"
           width={200}
           height={200}/>
        </header>
        
        <section>

            <div>
              <Image src="/banner-sabores.jpg" alt="Sabores"
               width={200}
               height={200}/>
            </div>

            <div>
              <h2>NOSSOS SABORES</h2>
                <h3>Novos e deliciosos!</h3>
                <p>
                Aqui na nossa gelateria, o gelato é produzido no jeito gaúcho, só com
                ingredientes naturais, à base de frutas e sem conservantes. Também
                temos opções sem lactose e sem açúcar, pra atender todo mundo. Chega 
                mais, tchê, e prova que dá sim pra ter um gelato saboroso e saudável
                ao mesmo tempo!
                </p>
            </div>

            <div>
              <h2>NOSSOS EVENTOS</h2>
              <h3>Delicias com sorvete!</h3>
              <p>
              Mais do que uma sorveteria, é como se fosse a continuação da tua casa.
              Aqui o pessoal é recebido de braços abertos, sempre prontos pra atender
              bem e preparar eventos caprichados, com os melhores sorvetes que tu vai
              provar na vida. Vem nos conhecer, puxar uma cadeira e passar um tempo
              bom aqui com a gente!
             </p>              
            </div>

            <div>
              <Image src="/eventos-image.jpg" alt="Evento"
              width={200}
              height={200}/>
            </div>
              
            <div>
              <Image src="/sobre-image.jpg" alt="Sobre Imagem"
              width={200}
              height={200}/>
            </div>
              
            <div>
              <h2>SOBRE NÓS</h2>
              <h3>Alegria em cada casquinha!</h3>
              <p>
                Vem tomar o melhor sorvete da região com a gente!
                Já são anos de estrada, trabalhando com capricho e dedicação
                pra entregar sempre o que tem de melhor pra quem chega.
                Aqui o atendimento é de primeira e o sorvete é daqueles 
                que dão vontade de voltar.
                Não fica de fora, tchê — chega mais, faz uma visita e 
                aproveita o melhor sorvete da cidade!
              </p>
             </div>

        </section>
        
      </main>
    </div>
  );
}
