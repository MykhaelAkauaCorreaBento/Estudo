//statustemperatura.js

function retornaStatusTemperaturaFahrenheit(fahrenheit){
    let status;

    if(fahrenheit >= 99){
        status = 'Temperatura alta';
    }else if(fahrenheit <= 41){
        status = 'Temperatura baixa';
    }else{
        status = 'Temperatura normal';
    }

    return status

    
}

export default retornaStatusTemperaturaFahrenheit;