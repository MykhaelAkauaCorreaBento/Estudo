import estilos from './page.module.css';
import Topo from './componentes/Topo';
import Card from './componentes/Card';



export default function Home() {
  return (
    <div>
      <Topo />
      <main className={estilos.main_container}>
        <section>
          <Card
            signo={"Aquário"} dataInicio={"21/01"}
            dataFim={"19/02"} imagem="/aquario.jpg"/>
          <Card
            signo={"Peixes"} dataInicio={"20/02"}
            dataFim={"20/03"} imagem="/peixes.jpg" />
          <Card
            signo={"Áries"} dataInicio={"21/03"}
            dataFim={"20/04"} imagem="/aries.jpg" />
          <Card
            signo={"Touro"} dataInicio={"21/04"}
            dataFim={"21/05"} imagem="/touro.jpg" />
          <Card
            signo={"Gêmeos"} dataInicio={" 22/05"}
            dataFim={"21/06"} imagem="/cavaleiro_de_gemeos_100x100.jpg" />
          <Card
            signo={"Câncer"} dataInicio={"21/06"}
            dataFim={"23/07"} imagem="/cancer.jpg" />
          <Card
            signo={"Leão"} dataInicio={"24/07"}
            dataFim={"23/08"} imagem="/leao.jpg" />
          <Card
            signo={"Virgem"} dataInicio={"24/08"}
            dataFim={"23/09"} imagem="/virgem.jpg" />
          <Card
            signo={"Libra"} dataInicio={"24/09"}
            dataFim={"23/10"} imagem="/libra.jpg" />
          <Card
            signo={"Escorpião"} dataInicio={"24/10"}
            dataFim={"22/11"} imagem="/escorpiao.jpg" />
          <Card
            signo={"Sagitário"} dataInicio={"23/11"}
            dataFim={"21/12"} imagem="/sagitario.jpg" />
          <Card
            signo={"Capricórnio"} dataInicio={"22/12"}
            dataFim={"20/01"} imagem="/capricornio.jpg" />
        </section>
      </main>
    </div>
  )
}