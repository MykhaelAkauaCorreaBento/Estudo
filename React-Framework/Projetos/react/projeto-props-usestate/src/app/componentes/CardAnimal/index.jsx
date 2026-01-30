import estilos from "./CardAnimal.module.css";
import Image from 'next/image';
import imagemCachorro from '../../../../public/cachorro.jpg';
import imagemGato from '../../../../public/gato.jpg';

export default function CardAnimal(props) {
  return (
    <div className={estilos.card_animal}>
      <Image src={props.tipoAnimal === "cachorro" ? imagemCachorro : imagemGato} alt="animal" />
    </div>
  );
}
