const express = require('express'); //usando o exppress
const app = express(); 
const PORT= 3010

// propriedade express p interpretar arquivos .json
app.use(express.json()); 

// definir formatos de caracteres da aplicação 
app.use(express.urlencoded({ extended:true })); 
app.listen(PORT, function(){
    console.log('server inicialized ' + PORT);
});

require('./src/routes/index')(app)