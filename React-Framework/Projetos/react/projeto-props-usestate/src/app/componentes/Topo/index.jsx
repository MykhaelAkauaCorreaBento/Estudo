import estilos from './Topo.module.css';

export default function Topo(props) {

  function alterarState() {
    props.tipoAnimal === "cachorro" ? props.setState("gato") : props.setState("cachorro");
  }

  return(
    <header className={estilos.header_container}>
      <h1>Projeto Props + useState</h1>
      <p>Clique no botão para mudar os componentes abaixo</p>
      <button onClick={alterarState}>Mudar Animal</button>
    </header>
  )
}