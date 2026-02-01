//01b_callback.js
const fs = require('fs')

fs.readFile(
    './d02-programacao-orientada-a-objetos/code05-async/01a_textoQualquer.txt', 
    (err, buf) => {
        if(err)
            throw err
        else
            console.log(buf.toString())
    })