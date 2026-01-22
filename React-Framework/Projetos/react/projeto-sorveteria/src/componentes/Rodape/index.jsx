import Image from "next/image";
import estilos from "./Rodape.module.css";

export default function Rodape(){
    return(
        <footer>
        <section>
            <div>
            <Image src="/logo.png" alt="Logomarca1"
            width={200}
            height={200}/>
            
            <div>
                <h4>ENDEREÇO</h4>
                <p>
                    Av. Borges de Medeiros, 250 Porto Alegre, RS 90020-021
                </p>
            
            </div>

            <div>
                <h4>CONTATO</h4>
                <p>contato@gelateria.com.br</p>
                <p>Tel / WhatsApp: (51) 3456-7890</p>        
            </div>

            <div>
                <h4>HORÁRIOS</h4>
                <p>ABERTO TODOS OS DIAS</p>
                <p>10:00 – 22:00</p>        
            </div>    
        </div>
        <div>
            <p>Gelateria. Orgulhosamente desenvolvido por Mykhael</p>
        </div>
        </section>
        </footer>
    );
}