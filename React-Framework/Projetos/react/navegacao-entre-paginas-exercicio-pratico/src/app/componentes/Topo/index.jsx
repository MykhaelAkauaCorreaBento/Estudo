import estilos from "./Topo.module.css";
import Link from "next/link";

export default function Topo(){
    return(

        <header className={estilos.container_topo}>
            <h1>Navegação React</h1>
            <nav>
                <Link className={estilos.link_frontend} href="/frontend">Front-end</Link>
                <Link className={estilos.link_backend} href="backend">Back-end</Link>
                <Link className={estilos.link_mobile} href="mobile">Mobile</Link>
            </nav>
            </header>
    );
}