export function ValidaDadosAutenticacao(usuario, senha) {
    if(usuario == 'admin' && senha == '123456') {
        return true;
    } else {
        return false;
    }
}