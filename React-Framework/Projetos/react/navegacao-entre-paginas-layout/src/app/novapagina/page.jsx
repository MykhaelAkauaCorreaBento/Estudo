import Link from "next/link";
import estilos from "./novapagina.module.css";

export default function NovaPagina() {
  return (
    <main className={estilos.main_container}>
      <div className={estilos.card_container}>
        <h1>Nova Página</h1>
        <p>Essa é a nova página da aplicação.</p>
        <p>Essa é a nossa primeira página criada no React.</p>
        <Link href="/">Link para a página inicial</Link>
      </div>
    </main>
  );
}