import estilos from './page.module.css'
import Image from 'next/image';

import Dente from "/public/dente.png";
import Aparelho from "/public/aparelho.png";
import Cliente01 from "/public/cliente01.png";
import Cliente02 from "/public/cliente02.png";
import Cliente03 from "/public/cliente03.png";
import Dentista01 from "/public/dentista01.png";
import Dentista02 from "/public/dentista02.png";

import CardDepoimento from "./componentes/CardDepoimento";
import MolduraInformacoes from './componentes/MolduraInformacoes';

export default function Home() {
  return (
    <>
      <header className={estilos.topo}>
        <div className={estilos.container_logo}>
          <Image
            src={Dente}
            alt="logo dentes saudáveis"
            title="logo dentes saudáveis"
          />
          <p>Dentes Saudáveis</p>
        </div>
      </header>

      {/* Apresentação */}
      <section className={estilos.secao_apresentacao}>
        <div className={estilos.container_texto_apresentacao}>
          <h1>
            Os melhores <span>aparelhos dentários</span>!
          </h1>
          <p>
            Confira abaixo todas as especialidades odontológicas que temos à sua
            disposição!
          </p>
        </div>

        <ul className={estilos.lista_servicos}>
          <li>
            <Image src={Dente} alt="logo" title="logo" />
            <p>Pré-avaliação</p>
          </li>

          <li>
            <Image src={Dente} alt="logo" title="logo" />
            <p>Aparelhos Dentários</p>
          </li>

          <li>
            <Image src={Dente} alt="logo" title="logo" />
            <p>Raio-X digital</p>
          </li>

          <li>
            <Image src={Dente} alt="logo" title="logo" />
            <p>Clareamento dental</p>
          </li>
        </ul>
      </section>

      {/* Secao beneficios */}
      <section className={estilos.secao_beneficios}>
        <div>
          <h2 className={estilos.subtitulo}>
            Por que usar <span>aparelho?</span>
          </h2>
          <figure className={estilos.container_img_aparelho}>
            <Image
              src={Aparelho}
              alt="Imagem do uso de um aparelho"
              title="Imagem do uso de um aparelho"
            />
          </figure>
        </div>

        <ul className={estilos.lista_beneficios}>
          <li>
            <h3>Alinhar os dentes</h3>
            <p>
              Dentes desalinhados causam problemas nos dentes e podem afetar a
              digestão dos alimentos e a respiração.
            </p>
          </li>

          <li>
            <h3>Melhorar a dicção e a higiene dentária</h3>
            <p>
              Muitas pessoas não conseguem nem usar fio dental devido à posição
              da sua dentição. Contudo, a correção possibilita o cuidado com a
              saúde bucal de forma bem mais ampla.
            </p>
          </li>

          <li>
            <h3>Corrigir espaço entre os dentes</h3>
            <p>
              Uma dentição desalinhada e com espaços significativos incomodam
              muitas pessoas. Usar aparelho nos dentes é uma das formas mais
              eficientes para que esses problemas possam ser corrigidos.
            </p>
          </li>
        </ul>
      </section>

      {/* container depoimentos */}
      <section className={estilos.secao_depoimentos}>
        <h2 className={estilos.subtitulo}>
          Veja o que nossos <span>clientes</span> estão falando...
        </h2>

        <div className={estilos.container_depoimentos}>
          <CardDepoimento
            imagem={Cliente01}
            nome={"Alberto"}
            descricao={"Por dois anos, eu fiz um tratamento com o Dentes Saudáveis, que me atendeu com profissionalismo e cuidado."}
          />
          <CardDepoimento
            imagem={Cliente02}
            nome={"Eliana"}
            descricao={"Por dois anos, eu fiz um tratamento com o Dentes Saudáveis, que me atendeu com profissionalismo e cuidado."}
          />
          <CardDepoimento
            imagem={Cliente03}
            nome={"Carla"}
            descricao={"Por dois anos, eu fiz um tratamento com o Dentes Saudáveis, que me atendeu com profissionalismo e cuidado."}
          />
        </div>
      </section>

      {/* Seção Informações */}
      <section className={estilos.secao_informacoes}>
        <div className={estilos.container_informacoes}>
          <MolduraInformacoes>
            <ul className={estilos.lista_horarios}>
              <li>Segunda - 09:00 às 18:00</li>
              <li>Terça - 09:00 às 18:00</li>
              <li>Quarta - 09:00 às 18:00</li>
              <li>Quinta - 09:00 às 18:00</li>
              <li>Sexta - 09:00 às 17:00</li>
              <li>Sábado - 09:00 às 12:00</li>
            </ul>
          </MolduraInformacoes>

          <MolduraInformacoes>
            <div className={estilos.card}>
              <figure>
                <Image
                  className={estilos.img_aparelho}
                  src={Dentista01}
                  alt="Dr. Ana"
                  title="Dr. Ana"
                />
              </figure>
              <div>
                <p>Dra. Ana - Ortodontista</p>
                <p>Segundas e sextas</p>
              </div>
            </div>
            <div className={estilos.card}>
              <figure>
                <Image
                  className={estilos.img_aparelho}
                  src={Dentista02}
                  alt="Dr. Carlos"
                  title="Dr. Carlos"
                />
              </figure>
              <div>
                <p>Dr. Carlos - Endodontia</p>
                <p>Terças e quartas</p>
              </div>
            </div>
          </MolduraInformacoes>

          <MolduraInformacoes>
            <p>Ligue para agendar uma consulta:</p>
            <p>(51) 3699 - 9999</p>
            <p>(51) 97788 - 5566</p>
          </MolduraInformacoes>
        </div>
      </section>

      {/* Seção localização */}
      <section className={estilos.secao_localizacao}>
        <div>
          <h2 className={estilos.subtitulo}>
            Onde estamos <span>localizados?</span>
          </h2>
          <p>
            Praça Montevideo, 10 - Centro Histórico, Porto Alegre - RS, 90010-170
          </p>
        </div>
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3454.0158372186747!2d-51.24022480000002!3d-30.03640349999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x951979183779c7f1%3A0x5a76e94b105377dd!2sPra%C3%A7a%20Montevideo%2C%2010%20-%20Centro%20Hist%C3%B3rico%2C%20Porto%20Alegre%20-%20RS%2C%2090010-170!5e0!3m2!1spt-BR!2sbr!4v1769679007373!5m2!1spt-BR!2sbr"
          width="100%"
          height="350"
        ></iframe>
      </section>

      {/* Rodapé */}
      <footer className={estilos.rodape}>
        <div>© Copyright 2025 | Consultório dentes saudáveis</div>
      </footer>
    </>
  )
}