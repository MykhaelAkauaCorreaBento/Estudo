import Image from "next/image";
import estilos from "./page.module.css";

export default function Home() {
  return (
    <main>
      <div>
        <section className={estilos.secao_banner}>
          <div className={estilos.texto_banner}>
          <h1>GELATO ARTESANAL</h1>
          </div>
        </section>
        
        <section className={estilos.secao_nossos_sabores}>

            <div className={estilos.img_card}>
              <Image  src="/banner-sabores.jpg" alt="Sabores"
               fill
               />
            </div>

            <div className={estilos.container_texto}>
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
        </section>
        
        <section className={estilos.secao_nossos_eventos}>
            <div className={estilos.container_texto}>
              <h2>NOSSOS EVENTOS</h2>
              <h3>Delicias com gelato!</h3>
              <p>
              Mais do que uma gelateria, é como se fosse a continuação da tua casa.
              Aqui o pessoal é recebido de braços abertos, sempre prontos pra atender
              bem e preparar eventos caprichados, com os melhores gelatos que tu vai
              provar na vida. Vem nos conhecer, puxar uma cadeira e passar um tempo
              bom aqui com a gente!
             </p>              
            </div>

            <div className={estilos.img_card}>
              <Image src="/eventos-image.jpg" alt="Evento"
              fill/>
            </div>
        </section>

        <section className={estilos.secao_sobre_nos}>
            <div className={estilos.img_card}>
              <Image src="/sobre-image.jpg" alt="Sobre Imagem"
              fill/>
            </div>
              
            <div className={estilos.container_texto}>
              <h2>SOBRE NÓS</h2>
              <h3>Alegria em cada casquinha!</h3>
              <p>
                Vem tomar o melhor gelato da região com a gente!
                Já são anos de estrada, trabalhando com capricho e dedicação
                pra entregar sempre o que tem de melhor pra quem chega.
                Aqui o atendimento é de primeira e o gelato é daqueles 
                que dão vontade de voltar.
                Não fica de fora, tchê — chega mais, faz uma visita e 
                aproveita o melhor gelato da cidade!
              </p>
             </div>
         </section>

        
        
      </div>
    </main>
  );
}
