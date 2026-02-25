const soap = require('soap');
const url = 'http://localhost:8001/wscalc1?wsdl';

soap.createClient(url, function(err, client) {
    /*Testando o wsdl*/
    if (err) {
        console.error('Erro ao criar o cliente SOAP:', err);
    } else {
        console.log('Descrevendo o WSDL', client.describe().ws.calc);
    }

    /*Consumindo o wsdl*/
    client.somar({a: 20, b: 20}, function(err, result) {
        if (err) {
            console.error(err);
        } else {
            console.log('A Soma é: ', result);
        }
    })

    client.multiplicar({a: 20, b: 5}, function(err, result) {
        if (err) {
            console.error(err);
        } else {
            console.log('A Multiplicação é: ', result);
        }
    }) 
    
});
