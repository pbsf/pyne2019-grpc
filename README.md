# Tutorial PYNE 2019
# gRPC - Alternativa à REST utilizada pelo Google e Netflix para intercomunicação de serviços

Esse repositório contém um exercício envolvendo boas práticas recomendadas pelo
[Twelve-Factor App](https://12factor.net/).

Está presente um arquivo `.proto` contendo vários métodos referentes à serviços
de Banking, e também um par cliente-servidor que implementa um dos métodos
definidos nesse proto: `Ping`.

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
$ client_1  | message: "Hello dev"
```
