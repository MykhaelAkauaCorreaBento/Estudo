import Image from "next/image";
import estilos from "./Produto.module.css";

export default function Produto() {
  return (
    <section id="produtos" className={estilos.secaoProdutos}>
      <div className={estilos.limitarSecao}>
        <h3>Nossos produtos</h3>

        <p>
          Trabalhamos com óculos de grau, óculos de sol, lentes transition nos
          modelos masculino, feminino e infantil.
        </p>

        <p>
          Todos os nossos preços são acessíveis e contam com a melhor qualidade
          do mercado.
        </p>

        <div className={estilos.containerProdutos}>
          <div className={estilos.boxProduto}>
            <h4>Óculos de grau</h4>
            <Image src="/oculos01.png" alt="Óculos de grau" width={300} height={150} />
            <p>R$ 500,00</p>
          </div>

          <div className={estilos.boxProduto}>
            <h4>Óculos transition</h4>
            <Image src="/oculos02.png" alt="Óculos transition" width={300} height={150} />
            <p>R$ 750,00</p>
          </div>

          <div className={estilos.boxProduto}>
            <h4>Óculos de sol</h4>
            <Image src="/oculos03.png" alt="Óculos de sol" width={300} height={150} />
            <p>R$ 700,00</p>
          </div>

          <div className={estilos.boxProduto}>
            <h4>Óculos infantil</h4>
            <Image src="/oculos04.png" alt="Óculos infantil" width={300} height={150} />
            <p>R$ 500,00</p>
          </div>
        </div>

        <p>Todos os nossos produtos incluem:</p>

        <ul>
          <li>Garantia de 1 ano</li>
          <li>Manutenção preventiva</li>
          <li>Descontos especiais na compra da segunda unidade</li>
          <li>Flexibilidade de pagamento</li>
        </ul>
      </div>
    </section>
  );
}
