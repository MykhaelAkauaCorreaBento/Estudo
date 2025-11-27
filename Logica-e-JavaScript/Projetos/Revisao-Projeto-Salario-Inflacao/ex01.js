function calcularPercentual(anterior, atual){

    const diferenca = atual - anterior;

    const percentual = (diferenca / anterior) * 100;

    return Number(percentual.toFixed(2));
}
console.log(calcularPercentual(500, 750));
console.log(calcularPercentual(1000, 1100));
//ex01.js