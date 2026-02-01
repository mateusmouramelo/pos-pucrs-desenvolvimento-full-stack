//01a_callback.js
const fs = require('fs')

fs.readFile(
    './d02-programacao-orientada-a-objetos/code05-async/01a_textoQualquer.txt', 
    (err, buf) => {
        if(err)
            console.log("houve um erro")
        else
            console.log(buf.toString())
    })