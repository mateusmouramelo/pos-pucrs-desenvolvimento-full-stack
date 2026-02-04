const express = require('express')
const bodyParser = require('body-parser')

const fs = require('fs')
const soap = require('soap')
const PORT = 8001;
const app = express() //servidor

var myservice = {
    ws: {
        calc: {
            somar : function(args) {
                var n = 1*args.a + 1*args.b;
                return { sumres : n };
            },

            multiplicar : function(args) {
                var n = args.a * args.b;
                return { mulres : n };
            }
        }
    }
};
//Importar o arquivo que define o wsdl
const xml = require('fs').readFileSync('wscalc1.wsdl', 'utf8');


//body parser middleware are supported (optional)
app.use(bodyParser.raw({type: function(){return true;}, limit: '5mb'}));

//Escutando o servidor na porta 8001, passando para o soap
app.listen(PORT, function(){
    /*Nota: a rota /wsdl será tratada pelo módulo soap
      e todas as outras rotas e middleware continuarão funcionando*/
    soap.listen(app, '/wscalc1', myservice, xml, function(){
        console.log('server initialized ' + PORT);
    });
});