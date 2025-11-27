//Em alguns casos queremos remover o último ou o primeiro elemento de um
// array. Para isso utilizamos as funções pop e shift

const diasDaSemana = [
    "domingo","segunda-feira","terça-feira",
    "quarta-feira","quinta-feira","sexta-feira","sábado"
];

diasDaSemana.pop();//pop revome o último elemento, no caso sábado.
diasDaSemana.shift();//Shift remove o primeiro elemento, no caso domingo.

console.log(diasDaSemana.length);

//pop-e-shift.js