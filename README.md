# Tutorial PYNE 2019

# gRPC - Alternativa à REST utilizada pelo Google e Netflix para intercomunicação de serviços

Para realizar o tutorial clone o repositório, abra o seu editor de texto favorito, e abra pelo menos
duas janelas de terminal.

O serviço `Greeter` está definido no arquivo `protos/pyne/greeter.proto`. Esse serviço contém a função `SayHello`.

Testando o `Greeter`:
```
$ cd workshop
$ ./restart-server.sh

Em um outro terminal:
$ cd workshop
$ ./restart-client.sh

Saída esperada no terminal do servidor:
$ greeter_1  | dev said Hello.

Saida esperada no terminal do cliente:
$ client_1  | message: "Hello, dev."
```

## Atividade 1:
Modifique o cliente para que ao invés do termo genérico "dev", o `Greeter` dê as boas vindas para você.

## Atividade 2:
Modifique o `greeter.proto` adicionando um parâmetro de idade ao `HelloRequest`. Você pode usar o tipo `int32` para isso.

## Atividade 3:
Modifique o cliente e o servidor para que o `Greeter` além de dar as boas vindas para você, informe também a sua idade.
Por exemplo: `Hello, Paulo. I heard you are 29.`
