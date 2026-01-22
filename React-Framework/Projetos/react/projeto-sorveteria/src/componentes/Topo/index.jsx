import estilos from "./Topo.module.css";
import Image from "next/image";


import Link from "next/link";

export default function Topo(){
    return(
        <header className={estilos.header}>
            <div className={estilos.container}>
            <Image src="/logo.png" alt="Logomarca" width={200} height={200}/>
            <nav className={estilos.menu}>
                <Link href="/">Home</Link>
                <Link href="/Sabores">Sabores</Link>
                <Link href="/Sobre">Sobre</Link>
            </nav>
            </div>
        </header>
    );
}