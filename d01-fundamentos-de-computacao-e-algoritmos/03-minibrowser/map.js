// TDD - Test Driven Development
var novoMapa = new Map();

class HistoryMap{
    // Inserindo regras de negócio da empresa
}

// 11/11/2023 as 23:30 da noite;
novoMapa.set('11/11/2023 - 23:30',{title: 'Google', url:'https://googlemaps.com'});
novoMapa.set('11/11/2023 - 23:30',{title: 'Google', url:'https://google.com'});
novoMapa.set('11/11/2023 - 23:31 ',{});
novoMapa.set('11/11/2023 - 23:31 ',{});
novoMapa.set('11/11/2023 - 23:31 ',{});
novoMapa.set('11/11/2023 - 23:31 ',{title:"Site"});

// Listando o último registro de cada minuto
var resultado = novoMapa;
console.log(resultado);

var novoMapa1 = new Map();

novoMapa1.set('11/11/2023 - 23:30',{title: 'Nome do Site'});
novoMapa1.set('11/11/2023 - 23:30',{});
novoMapa1.set('11/11/2023 - 23:31',{title: 'Google Maps', url:'https://googlemaps.com'});
novoMapa1.set('11/11/2023 - 23:31 - URL',{});

// Listando um registro específico, acessando direto no ponto da memória
var resultado1 = novoMapa1.get('11/11/2023 - 23:31');
console.log(resultado1);