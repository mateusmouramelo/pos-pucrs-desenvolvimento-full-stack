const fibonacci = []; // criação do vetor atribuindo a constante fibonacci

//console.log(fibonacci); // retonará um vetor vazio

fibonacci[0] = 0;
fibonacci[1] = 1; // manipulando o indice 1 do vetor atribuindo o valor 1
fibonacci[2] = 1; // manipulando o indice 2 do vetor atribuindo o valor 1

for(let i = 3; i < 20; i++) {
    fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2] 
}

console.log("Sequência de Fibonacci:")
console.log(fibonacci); 