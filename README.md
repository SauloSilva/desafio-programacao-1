## README

Esta é uma aplicação para testar os conhecimentos sobre a tecnologia Ruby on Rails.
Abaixo você encotrará vários itens para auxiliá-lo a executar esse projeto

## Pré requisitos

Ter instalado na máquina os seguintes recursos com suas respectivas versões:

- Ruby `2.5.1`
- Postgres `11.1`
- Redis `5.0.3`
- Bundler `1.16.1`

## Instalação

Depois de obter todos os [pré requisitos](#pré-requisitos), basta executar os seguintes comandos na sequência:

1. `gem install pg -v '1.1.4'`
2. `bin/setup`

Após isso, deve-se levantar as duas instâncias, sendo elas:

**1. WEB** com o seguinte comando:
`rails s`

**2. SIDEKIQ**  com o seguinte comando:
`sidekiq`

Pronto agora é so acessar no browser a URL: [`http://localhost:3000`](http://localhost:3000)

## Testes

Para executar os testes é necessário ter os [pré requisitos](#pré-requisitos) e também ter finalizado a [instalação](#instalação) das dependências com sucesso.

Sendo assim, agora é so executar o seguinte comando:

`rspec`

## Servidor

A aplicação foi hospedada no heroku.
Basta [entrar neste link](https://desafio-programacao-1-saulo.herokuapp.com/) para acessar.

## Prints das telas

**Tela inicial**

![](https://raw.githubusercontent.com/SauloSilva/desafio-programacao-1/master/public/imgs/tela_inicial.png)

**Tabela de importações**

![](https://raw.githubusercontent.com/SauloSilva/desafio-programacao-1/master/public/imgs/tabela.png)

**Formulário para envio(upload) do arquivo**

![](https://raw.githubusercontent.com/SauloSilva/desafio-programacao-1/master/public/imgs/formul%C3%A1rio.png)
