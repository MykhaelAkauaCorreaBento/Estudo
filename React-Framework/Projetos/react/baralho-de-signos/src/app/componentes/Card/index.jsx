import Image from 'next/image';
import estilos from './Card.module.css';

export default function Card({ signo, dataInicio, dataFim, imagem }) {
  return (
    <div className={estilos.card_signo}>
      <h3>{signo}</h3>

      <Image
        src={imagem}
        alt={signo}
        width={150}
        height={150}
      />

      <span>{dataInicio} - {dataFim}</span>
    </div>
  );
}