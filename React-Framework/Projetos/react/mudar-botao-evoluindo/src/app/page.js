'use client';
import styles from "./page.module.css";
import {useState} from "react";

export default function Home() {
  const [btnClicado, setBtnClicado]= useState(false);
  const [nomeBtn, setNomeBtn] = useState('Abrir');

  function mudarNomeBotao(){
    if (btnClicado === true){
      setBtnClicado(false);
      setNomeBtn('Abrir');
    }else{
      setBtnClicado(true);
      setNomeBtn('Fechar');
    }
  }
  
  
  return (
    
      <main className={styles.main}>
        <div>
          <button onClick={mudarNomeBotao}>{nomeBtn}</button>
        </div>
      </main>
    
  );
}
