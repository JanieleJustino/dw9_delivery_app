 <h1 align="center">  APP desenvolvido na Imersão Dart Week 9° edição  </h1>
App para pedir seu lanche de forma simples e intuitiva! Com o padrão de projeto MVC, usando BloC, shared Preferences, Integração com Json rest server, provider, singletons e diversos packages auxiliares!  

<div align="center">
<img src="https://user-images.githubusercontent.com/110784724/218760877-5d01f7d0-3ca7-4410-8ec4-96ab5689d767.png" width="300px" height= "100xp"/>
</div>  


# Sobre o APP  
Desenvolvido em 5 dias, com mentoria de Rodrigo Rahman e tutores da Academia do flutter.   
* Linguagem de programação: Dart.  
* Framework: Flutter.  
* Backend: Json rest server | Postman.  
* Arquitetura: MVC.  
* Gerência de estado: Bloc.  
* Peristência de dados simples: shared_preferences.  
* Injeção de dependência: Provider.  
* Navegação: Rotas nomeadas, navigator 2.0.  
* Animação no cardápio: Hero.  
* Ferramentas: VSCode(ide) | Postman(para o backend) | Figma(protótipo)  

# Funcionalidades do APP  
* Acessar o cardápio sem realizar login no APP.  
* Acessar o detalhe do produto sem realizar login no APP.  
* Adicionar e remover produto na tela de detalhe do produto, o cardápio sem realizar login no APP.  
* Realizar cadastro com: Nome, e-mail e senha.  
* Acessar o carrinho sem realizar login no APP.  
* Realizar login com: e-mail e senha, para acessar o carrinho de compras.  
* Acessar a página de compras, é necessário estar logado.  
* Finalizar a compra, inserindo as informações de: Endereço, CPF e forma de pagamento. É necessário estar logado.  
* Acessar tela informativo sobre pedido realizado, é necessário estar logado.  

# Telas  
Ícone clicável:  
<p align="left">
  <a href="https://www.figma.com/file/qpjBCcYymlhP9cpyIMSDR9/Delivery-App-(Atualizado-por--Janiele-Justino)?node-id=0%3A1&t=InCVWZNt1GTP9Ebv-1" alt="Linkedin">
  <img src="https://user-images.githubusercontent.com/110784724/218767072-e5dfeb08-aa4a-4f2a-b9f3-4420026c9355.png" height= "25xp" /></a>
</p>  
  
![image](https://user-images.githubusercontent.com/110784724/218768020-4b4a916c-5e10-4a2c-ae24-f54c3d95aebe.png)  
  
![image](https://user-images.githubusercontent.com/110784724/218768125-f716b884-b4d7-43a6-ab1b-d59ca3b27598.png)  
  
![image](https://user-images.githubusercontent.com/110784724/218768231-f1a511d3-10cd-43e7-98ae-47d32786ae21.png)   
  
# 🚀 Como executar o projeto:   
Para executar e visualizar o projeto, você precisará seguir os próximos passos.  

* Primeiramente você deve ter o Flutter instalado em sua máquina , para saber mais sobre isso veja o doc: https://flutter.dev/docs/get-started/install ;  

* Criando seu back-end  
Para este projeto usamos json_rest_server como nosso back-end. Para criar a API você deve instalá-la em sua máquina e em seguida, criar seu projeto de back-end executando o comando:  

json_rest_server create ./name_backend_api  

* Após a criação, anote em config.yamlarquivo, em urlSkip:  

  urlSkip:  
      - /users:  
         method: post  
      - /products:  
         method: get  
      - /products/{*}:  
          method: get  
          
* Dentro do database.json, cole o seguinte json e fique a vontade para preencher "payment-types"e "products", como quiser, seguindo a estrutura abaixo:   

{  
    "users": [],  
    "payment-types": [  
        {  
            "id": 1,  
            "name": "title",  
            "acronym": "acronym",  
            "enabled": true  
        }  
  
    ],  
    "products": [  
        {  
            "id": 1,  
            "name": "title",  
            "description": "description",  
            "price": 15.0,  
            "image": "https://image"  
        }  
  
    ],  
    "orders": []  
}  

* Definindo a variável BACKEND_BASE_URL:  
Depois de criar o backend, você deve chamá-lo dentro do seu frontend. Aqui neste projeto, crie o .env e defina sua chave de API do seu servidor, exemplo: backend_base_url=http://0.0.0.0:8080/  


* Instalando dependências:   
Execute o comando para instalar as dependências do projeto.  

* flutter pub get  

* flutter create .  

* Executando o projeto:  
Os scripts abaixo executam o projeto.  

* flutter run  
Após seguir os passos anteriores, o projeto está rodando em modo de desenvolvimento.  

# Onde me encontrar:  

<p align="left">
  <a href="https://www.linkedin.com/in/desenvolvedorajanielejustino/" alt="Linkedin">
  <img src="https://img.shields.io/badge/-Linkedin-0e76a8?style=for-the-badge&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/desenvolvedorajanielejustino/" height= "25xp" /></a>
</p>   

