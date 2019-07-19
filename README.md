# Tutorial PyNE 2019

# gRPC - Alternativa à REST utilizada pelo Google e Netflix para intercomunicação de serviços

## Pré-requisitos
1. Ter git, docker ([Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows), [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/), [Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)) e [docker-compose](https://docs.docker.com/compose/install/) instalados em sua máquina.
   Para validar as instalações, os seguintes comandos devem funcionar:
   ```
   docker version
   docker-compose version
   ```
2. Clonar esse repositório.
3. Execute `docker pull grpc/python:1.13` para baixar a imagem que será utilizada no tutorial.
4. Abrir seu editor de texto favorito, e pelo menos duas janelas de terminal.

## Observação
A infra-estrutura deste tutorial utiliza docker. Porém, como o foco do tutorial é gRPC, iremos abstrair essa infra. Apenas as pastas `client`, `protos` e `server` serão alteradas nesse tutorial.

## Introdução
O serviço `Greeter` está definido no arquivo `protos/pyne.proto`. Esse serviço contém o RPC `SayHello`,
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
Modifique `pyne.proto` adicionando um campo de idade ao `HelloRequest`. Você pode usar o tipo `int32` para isso. Rode o cliente novamente para ter certeza de que nada quebrou.

## Atividade 3:
Modifique o código do cliente e do servidor para que o `Greeter` além de dar as boas vindas para você, informe também a sua idade. Por exemplo:
`Hello, Paulo. I heard you are 29.`

## Atividade 4:
Modifique `pyne.proto` adicionando um novo serviço: `Calculator`. Esse serviço deve conter um RPC chamado `Sum`, que recebe como entrada uma mensagem `SumRequest`, que contém dois inteiros, e retorna um `SumResponse`, que contém apenas um inteiro.

## Atividade 5:
Implemente a lógica do serviço `Calculator` no servidor. Altere o cliente para validar o seu serviço.

## Atividade 6:
A regra `repeated` pode ser adicionada a um campo de uma mensagem protobuf para especificar que aquele campo pode aparecer mais de uma vez na mensagem. Por exemplo, `repeated int32 value = 1;`, significa que `value` pode não estar presente, estar presente, ou estar presente várias vezes.
Altere a mensagem `SumRequest` para possuir apenas um campo, ao invés de dois, porém com o modificador `repeated`. Altere o código do servidor para dar suporte a um somátorio de uma quantidade qualquer de inteiros, presentes no campo `repeated`, e modifique o cliente para validar a implementação.

## Atividade 7:
Adicione um novo Serviço, `Ntp` (Network Time Protocol), com um rpc de `UtcNow`:
```
service Ntp {
  rpc UtcNow (UtcNowRequest) returns (stream UtcNowResponse) {}
}

message UtcNowRequest {
  int32 interval_in_secs = 1;
  int32 max_amount = 2;
}

message UtcNowResponse {
  string yyMMddHHmmss = 1;
}
```
Note a regra `stream`, isso significa que ao chamar essa função a conexão se manterá aberta, e permite que o servidor faça push de resultados. Implemente essa função de forma que `yyMMddHHmmss`, contendo o horário atual, seja retornado a cada `interval_in_secs` segundos, um total de `max_amount` vezes.

## Atividade 8:
Altere `Ntp.UtcNow` para o modo de stream bi-direcional: `rpc UtcNow (stream UtcNowRequest) returns (stream UtcNowResponse)`. O servidor deve funcionar como antes, porém agora deve sempre atualizar `interval_in_secs` e `max_amount` para os últimos valores recebidos. Você pode utilizar um console iterativo no cliente para atualizar esses valores, enquanto uma outra thread imprime os resultados do servidor.

## Opcional - Atividade 9:
Implemente um aplicativo de chat utilizando gRPC. Você pode se basear em https://github.com/melledijkstra/python-grpc-chat. Teste com vários clientes na mesma máquina.
