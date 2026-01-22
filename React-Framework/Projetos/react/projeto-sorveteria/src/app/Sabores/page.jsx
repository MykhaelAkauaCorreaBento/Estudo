import estilos from "./sobre.module.css";
import Image from "next/image";

export default function Sabores(){
    return(
        <div>
            <header>
            <h1>NOSSOS SABORES</h1>
            <Image src="/banner-sabores.jpg" alt="Banner Sabores"
            width={200}
            height={200}/>
            </header>

            <section>

                <h2>SABORES DE GELATO</h2>
                <div>
                    <div>
                        <Image src="/sabor-oreo.png" alt="Sabor Oreo"
                        width={200}
                        height={200}/>
                        <h3>Gelato de Oreo</h3>
                        <p>Delicioso sorvete sabor Oreo. Uma explosão de sabor.</p>
                    </div>

                    <div>
                        <Image src="/sabor-pistache.png" alt="Sabor Pistache"
                        width={200}
                        height={200}/>
                        <h3>Gelato Pistache</h3>
                        <p>Cremoso sorvete sabor pistache com pedacinhos de semente.</p>
                    </div>

                    <div>
                        <Image src="/sabor-cookies-avela.png" alt="Sabor Cookies e Avelã"
                        width={200}
                        height={200}/>
                        <h3>Gelato Cookies & Avelã</h3>
                        <p>O nosso melhor sorvete. Você vai adorar o sabor.</p>
                    </div>

                    <div>
                        <Image src="/sorbet-kiwi.png" alt="Sabor Kiwi"
                        width={200}
                        height={200}/>
                        <h3>Gelato de Kiwi</h3>
                        <p>Delicioso e refrescante sorvete sabor kiwi. Rico em vitamina C.</p>
                    </div>

                    <div>
                        <Image src="/sorbet-morango.png" alt="Sabor Morango"
                        width={200}
                        height={200}/>
                        <h3>Gelato de Morango</h3>
                        <p>Gelato de morango gourmet. Tradicional e saboroso.</p>
                    </div>

                    <div>
                        <Image src="/sorbet-limao.png" alt="Sabor Limão"
                        width={200}
                        height={200}/>
                        <h3>Gelato de Limão Siciliano</h3>
                        <p>O incrivel sorvete gourmet de limão siciliano vai te encantar.</p>
                    </div>


                </div>
            </section>



        </div>
    );
}