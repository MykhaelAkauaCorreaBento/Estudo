import Link from "next/link";

import estilos from "./mobile.module.css";

export default function Mobile (){
    return(
        <div className={estilos.container_mobile}>
            <h2>React Native</h2>
            <p>
          React Native é um framework de desenvolvimento de aplicativos móveis que
          permite a criação de aplicativos nativos usando JavaScript e React. Ele
          permite o desenvolvimento de aplicativos para iOS e Android usando uma
          base de código compartilhada, proporcionando uma experiência de
          desenvolvimento eficiente e rápida. Com React Native, os desenvolvedores
          podem criar aplicativos móveis robustos e de alto desempenho de forma
          simplificada.
            </p>
            <Link className="link_guia"
            href="https://www.devmedia.com.br/carreira-programador/?slug=mobile"
            target="_blank"
            >
                Guia de Mobile
            </Link>
            <Link className="link_retorno" href="/">Voltar</Link>
        </div>
    );
}