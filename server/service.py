from concurrent import futures

import time

import grpc

from pyne import greeter_pb2
from pyne import greeter_pb2_grpc

class GreeterServicerImpl(greeter_pb2_grpc.GreeterServicer):
    def SayHello(self, request, context):
        print(f'{request.name} said Hello.')
        return greeter_pb2.HelloReply(greetings=f'Hello, {request.name}.')

def Serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=1))
    greeter_pb2_grpc.add_GreeterServicer_to_server(GreeterServicerImpl(), server)
    server.add_insecure_port('0.0.0.0:3000')
    server.start()
    print('Waiting for greeting requests...')
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        server.stop(0)


if __name__ == '__main__':
    Serve()
