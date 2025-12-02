function efetuarCalculoIMC(peso, altura){
    let imc = peso / (altura * altura);

    return imc;
}

function retornaStatusIMC(imc)
{
    let status;

    if(imc < 18.5)
    {
        status = 'Abaixo do peso';
    }
    else if(imc >= 18.5 && imc < 24.9)
    {
        status = 'Peso Normal';
    }
    else if(imc >= 24.9 && imc < 30)
    {
        status = 'Acima do peso';
    }
    else
    {
        status = 'Obeso';
    }

    return status;
}

function validaParametro(parametro)
{
    if(isNaN(parametro))
    {
        return false;
    }
    else
    {
        return true;
    }
}

exports.efetuarCalculoIMC = efetuarCalculoIMC;
exports.retornaStatusIMC = retornaStatusIMC;
exports.validaParametro = validaParametro;

//O tratamento de erros é uma tarefa muito importante quando falamos de APIs,
//pois através dessas validações impedimos que o sistema quebre e corrigimos
//falhas de segurança. O uso de recursos de validação e retorno de erros
//são essenciais na carreira de todo desenvolvedor que deseja construir
//uma API segura.