import estilos from "./Card.module.css";

export default function Card() {
    return(
        <div className={estilos.container_card}>
          <p>Componentes</p>
          <p>Facilita em manter partes menores funcionando corretamente.</p>
          <p>Você pode reutilizá-lo, ou seja, menos códigos para se escrever.</p>
        </div>
    );
}; 