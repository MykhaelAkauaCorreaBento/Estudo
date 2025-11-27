import retornaDiaSemana from "./diaSemana.js";

let serie = [
    "CSI: Crime Scene Investigation",
    "Eu, a Patroa e as Crianças",
    "Malcolm in the Middle",
    "The Big Bang Theory",
    "Two and a Half Men",
    "Friends",
    "Bernie Mac - Um Tio da Pesada",
];

function retornaSerieDia(){
  let diaSemana = retornaDiaSemana();
  let serieDoDia = serie[diaSemana];
  return serieDoDia;
}

export default retornaSerieDia;