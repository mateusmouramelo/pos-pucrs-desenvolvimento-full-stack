//02a_consumidor
const Circulo = require('./02a_definicaoCJS.njs');
const c1 = new Circulo(4);
console.log(`Área do círculo de raio 4 é ${c1.area().toFixed(2)}`);
console.log(`Circunferência do círculo de raio 4 é ${c1.circunferencia().toFixed(2)}`);
