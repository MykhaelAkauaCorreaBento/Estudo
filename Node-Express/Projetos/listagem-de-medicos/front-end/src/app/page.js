'use client';

import { useEffect, useState } from "react";
import estilos from "./page.module.css";

export default function Home() {
  const [medicos, setMedicos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [erro, setErro] = useState(null);

  useEffect(() => {
    async function buscarMedicos() {
      try {
        const resposta = await fetch("http://localhost:9000/medicos");
        if (!resposta.ok) throw new Error("Erro ao buscar médicos");
        const dados = await resposta.json();
        setMedicos(dados);
      } catch (error) {
        setErro(error.message);
      } finally {
        setLoading(false);
      }
    }
    buscarMedicos();
  }, []);

  if (loading) return <p>Carregando médicos...</p>;
  if (erro) return <p>Erro: {erro}</p>;

  return (
    <main className={estilos.principal}>
      <h2 className={estilos["titulo-principal"]}>Nossa Equipe Médica</h2>

      <div className={estilos["container-medicos"]}>
        {medicos.map((medico) => (
          <div key={medico.id} className={estilos["cartao-medico"]}>
            <div className={estilos["container-avatar"]}>
              <span className="material-symbols-outlined">person</span>
            </div>
            <h3 className={estilos["nome-medico"]}>{medico.nome}</h3>
            <p className={estilos["descricao-medico"]}>{medico.descricao}</p>
            <div className={estilos["info-contato"]}>
              <div className={estilos["item-contato"]}>
                <span className="material-symbols-outlined">phone</span>
                {medico.telefone}
              </div>
              <div className={estilos["item-contato"]}>
                <span className="material-symbols-outlined">email</span>
                {medico.email}
              </div>
            </div>
          </div>
        ))}
      </div>
    </main>
  );
}