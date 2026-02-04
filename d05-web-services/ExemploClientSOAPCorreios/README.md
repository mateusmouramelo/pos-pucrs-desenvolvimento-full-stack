<h2>Código Portifólio - PUC</h2> 
<h3>Web Service</h3>

<h3>ClientSoap para consumo de webservice para consulta de CEP</h3>

<p>Criar e acessar uma pasta</p> 
<li><b>mkdir ExemploClientSOAP && cd ExemploClientSOAP</b></li>
</br>
<p>Inicializar o projeto e criar o arquivo <b>package.json</b></p>
<li><b>npm init</b></li>
</br>
<p>Instalar a biblioteca SOAP</p>
<li><b>npm install soap</b></li>
</br>
<p>Ao executar a instalação do soap, será inserida a dependência do soap no arquivo <b>package.json</b> e irá criar a pasta <b>node_modules</b> - raiz de todas as bibliotecas do projeto</p>

<h5>Webservice:</h5> 
<b>Url:</b> https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl

<h5>Informações importantes do webservice:</h5>
<ul>
    <li>wsdl:service name = AtendeClienteService</li>
    <li>wsdl:port name= AtendeClientePort</li>
</ul>

<b>wsdl</b> - Linguagem de Descrição do Webservice. 

<b>Certifique-se</b> de que o <b>Node.js</b> instalado em sua máquina estejá na versão acima da 18, para evitar o erro <b>new xml_crypto_1.SignedXml(options?.signerOptions?.idMode</b> o erro está relacionado ao uso da sintaxe opcional de encadeamento (?.), que não é suportada por versões mais antigas do Node.js.

<p>Executando o client</p>
<li><b>node index.js</b></li>
