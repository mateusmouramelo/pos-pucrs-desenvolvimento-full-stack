const soap = require('soap');
const url = 'http://www.dneonline.com/calculator.asmx?wsdl';

soap.createClient(url, function(err, client) {
    /*Testando o wsdl*/
    if (err) {
        console.error('Erro ao criar o cliente SOAP:', err);
    } else {
        console.log('Descrevendo o WSDL', client.describe().Calculator.CalculatorSoap);
    }

    /*Consumindo o wsdl*/
    client.Add({intA:20, intB:20}, function(err, result) {
        if (err) {
            console.error(err);
        } else {
            console.log('A Soma é: ', result.AddResult);
        }
    })

    client.Subtract({intA:20, intB:5}, function(err, result) {
        if (err) {
            console.error(err);
        } else {
            console.log('A Subtração é: ', result.SubtractResult);
        }
    })

    client.Multiply({intA:20, intB:5}, function(err, result) {
        if (err) {
            console.error(err);
        } else {
            console.log('A Multiplicação é: ', result.MultiplyResult);
        }
    })

    client.Divide({intA:20, intB:5}, function(err, result) {
        if (err) {
            console.error(err);
        } else {
            console.log('A Divisão é: ', result.DivideResult);
        }
    })
});
