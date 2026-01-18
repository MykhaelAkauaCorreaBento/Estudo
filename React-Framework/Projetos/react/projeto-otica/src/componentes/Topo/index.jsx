import Image from "next/image";
import Link from "next/link";
import estilos from "./Topo.module.css";

export default function Topo() {
  return (
    <header className={estilos.header}>
      <div className={estilos.container}>
        <Image 
          src="/logo.png"
          alt="logomarca"
          width={150}
          height={80}
        />

        <nav className={estilos.menu}>
          <Link href="/produtos">PRODUTOS</Link>
          <Link href="/sobre">SOBRE</Link>
          <Link href="/contato">CONTATO</Link>
        </nav>
      </div>
    </header>
  );
}
