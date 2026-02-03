import estilos from "./ItemJogos.module.css";
import Image from "next/image";
import xboxLogo from "../../../../public/xbox-logo.png";
import playstationLogo from "../../../../public/playstation-logo.jpg";
import nintendoLogo from "../../../../public/nintendo-logo.jpg";

export default function ItemJogos({nome, plataforma}){
    return(
        <div className={estilos.card}>
            <figure>
                <Image
                src={
                    plataforma === 'xbox'
                    ? xboxLogo
                    : plataforma === 'playstation'
                    ? playstationLogo
                    : nintendoLogo
                }
                alt="logo"
                />
            </figure>
            <div>
                <p>{nome}</p>
            </div>
        </div>
    );
}