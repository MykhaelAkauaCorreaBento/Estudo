import estilos from './Menu.module.css';

export default function Menu(){
    return(
        <div className={estilos.menu}>
            <ul>
                <li>Opção 1</li>
                <li>Opção 2</li>
                <li>Opção 3</li>
                <li>Opção 4</li>
                <li>Opção 5</li>
                
            </ul>
        </div>
    );
}