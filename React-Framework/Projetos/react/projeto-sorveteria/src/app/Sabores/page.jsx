import estilos from "./sobre.module.css";
import Image from "next/image";

export default function Sabores() {
  return (
    <main className={estilos.container_principal}>

      {/* BANNER */}
      <section className={estilos.secao_banner_sabores}>
        <div className={estilos.titulo_banner_sabores}>
          <h1>NOSSOS SABORES</h1>
        </div>
      </section>

      {/* SABORES */}
      <section className={estilos.secao_sabores}>
        <h2>SABORES DE GELATO</h2>

        <div className={estilos.container_gelatos}>

          <div className={estilos.card_gelato}>
            <div className={estilos.container_imagem}>
              <Image src="/sabor-oreo.png" alt="Sabor Oreo" fill />
            </div>
            <h3>Gelato de Oreo</h3>
            <p>Delicioso gelato sabor Oreo. Uma explosão de sabor.</p>
          </div>

          <div className={estilos.card_gelato}>
            <div className={estilos.container_imagem}>
              <Image src="/sabor-pistache.png" alt="Sabor Pistache" fill />
            </div>
            <h3>Gelato Pistache</h3>
            <p>Cremoso gelato sabor pistache com pedacinhos de semente.</p>
          </div>

          <div className={estilos.card_gelato}>
            <div className={estilos.container_imagem}>
              <Image src="/sabor-cookies-avela.png" alt="Sabor Cookies e Avelã" fill />
            </div>
            <h3>Gelato Cookies & Avelã</h3>
            <p>O nosso melhor gelato. Você vai adorar o sabor.</p>
          </div>

          <div className={estilos.card_gelato}>
            <div className={estilos.container_imagem}>
              <Image src="/sorbet-kiwi.png" alt="Sabor Kiwi" fill />
            </div>
            <h3>Gelato de Kiwi</h3>
            <p>Delicioso e refrescante gelato sabor kiwi. Rico em vitamina C.</p>
          </div>

          <div className={estilos.card_gelato}>
            <div className={estilos.container_imagem}>
              <Image src="/sorbet-morango.png" alt="Sabor Morango" fill />
            </div>
            <h3>Gelato de Morango</h3>
            <p>Gelato de morango gourmet. Tradicional e saboroso.</p>
          </div>

          <div className={estilos.card_gelato}>
            <div className={estilos.container_imagem}>
              <Image src="/sorbet-limao.png" alt="Sabor Limão" fill />
            </div>
            <h3>Gelato de Limão Siciliano</h3>
            <p>O incrível gelato gourmet de limão siciliano vai te encantar.</p>
          </div>

        </div>
      </section>
    </main>
  );
}