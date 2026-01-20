import estilos from "./novapagina.module.css"
import Link from "next/link";
import Topo from "@/componentes/Topo";

export default function NovaPagina(){
    return(
        <main className={estilos.main_container}>
            <Topo/>
            <div className={estilos.card_container}>
                <h1>Nova Página</h1>
                <p>Essa é a nova página da aplicação</p>
                <p>Essa é a nossa primeira página crida no React.</p>
                <Link href="/">Link para a página inicial</Link>
            </div>
        </main>
    );
}