const soap = require('soap');
const url = 'https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl';

soap.createClient(url, function(err, client) {
    /*Testando o wsdl*/
    if (err) {
        console.error('Erro ao criar o cliente SOAP:', err);
    } else {
        console.log('Descrevendo o WSDL', client.describe().AtendeClienteService.AtendeClientePort)
    }
   /*Consumindo o wsdl para consultar um CEP*/
    client.consultaCEP({cep:'22221030'}, function(err, res) {
        if (err) {
            console.error(err);
        } else {
            console.log(res);
        }
    })
});

