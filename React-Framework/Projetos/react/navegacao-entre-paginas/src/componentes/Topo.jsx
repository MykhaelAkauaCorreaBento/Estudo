import Image from "next/image";
import estilos from "./Topo.module.css";


export default function Topo() {
  return (
    <div className={estilos.topo_container}>
      <Image className={estilos.img_logo}src="/vercel.svg" alt="Vercel Logo" width={200}
      height={200}/>
      <h1>Topo</h1>
    </div>
  );
}