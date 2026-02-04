
<h2>Código Portifólio - PUC</h2> 
<h3>Web Service</h3>

<p>Projeto node com Express, realizado a criação de um Web Service local para ser acessado e consumido por um clienSOAP local</p>

<p>Criar e acessar uma pasta</p> 
<li><b>mkdir ExemploServerSOAPExpress && cd ExemploServerSOAPExpress</b></li>
</br>

<p>Inicializar o projeto e criar o arquivo <b>package.json</b></p>
<li><b>npm init</b></li>
</br>

<p>Instalar a biblioteca SOAP</b></p>
<li><b>npm install soap</b></li>
</br>

<p>Instalar a biblioteca Express</b></p>
<li><b>npm install express</b></li>
</br>

<p>Baixar o arquivo wsdl no repositório git do professor</p>
https://github.com/cassiowt/CursoWEBService/blob/master/ExemploServerSOAP/wscalc1.wsdl
</br>
<p>O wsdl define as funcionalidades e as expoem para serem consumidas</p>

<p>Teste para verificar se o servidor subiu</p>
<li><b>node index.js</b></li>
</br>

<p>Será exibido no terminal a mensagem <b>Server initialized 8001</b></p>

<p>Para saber se o web service esta funcionando corretamente, necessário criar um cliente para consumir o serviço</p>

<p>Criar e acessar uma pasta</p> 
<li><b>mkdir ExemploClientSOAPExpress && cd ExemploClientSOAPExpress</b></li>
</br>

<p>Inicializar o projeto e criar o arquivo <b>package.json</b></p>
<li><b>npm init</b></li>
</br>

<p>Instalar a biblioteca Express</b></p>
<li><b>npm install express</b></li>
</br>

<p>Teste para verificar se o ClientSOAP conseguiu realizar os calculos</p>
<li><b>node index.js</b></li>
</br>
