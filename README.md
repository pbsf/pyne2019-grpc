# Tutorial PYNE 2019

# gRPC - Alternativa à REST utilizada pelo Google e Netflix para intercomunicação de serviços

Pré-requisitos para realizar o tutorial:
1. Ter git, docker e docker-compose instalados em sua máquina.
2. Clonar esse repositório.
3. Executar o script `pull-images.sh`.
4. Abrir seu editor de texto favorito, e pelo menos duas janelas de terminal.

A infra-estrutura desse tutorial utiliza docker. Porém, como o foco do tutorial é gRPC, iremos abstrair essa infra. Apenas as pastas `client`, `protos` e `server` serão alteradas nesse tutorial.

O serviço `Greeter` está definido no arquivo `protos/pyne/greeter.proto`. Esse serviço contém o RPC `SayHello`,
que recebe uma mensagem com um nome, e retorna uma mensagem de boas vindas.

Testando o `Greeter`:
```
Iniciando o servidor:
$ ./restart-server.sh

Chamando o cliente em um outro terminal:
$ ./restart-client.sh

Saída esperada no terminal do servidor:
$ greeter_1  | dev said Hello.

Saida esperada no terminal do cliente:
$ client_1  | Hello, dev.
```

## Atividade 1:
Modifique o código do cliente para que ao invés do termo genérico "dev", o `Greeter` dê as boas vindas para você.

## Atividade 2:
Modifique o `greeter.proto` adicionando um parâmetro de idade ao `HelloRequest`. Você pode usar o tipo `int32` para isso.
Rode o cliente novamente para ter certeza de que nada quebrou.

## Atividade 3:
Modifique o código do cliente e do servidor para que o `Greeter` além de dar as boas vindas para você, informe também a sua idade.
Por exemplo: `Hello, Paulo. I heard you are 29.`
