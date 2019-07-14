from concurrent import futures

import time

import grpc

import pyne_pb2
import pyne_pb2_grpc

class GreeterServicerImpl(pyne_pb2_grpc.GreeterServicer):
    def SayHello(self, request, context):
        print(f'{request.name} said Hello.')
        return pyne_pb2.HelloReply(greetings=f'Hello, {request.name}.')

def Serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=1))
    pyne_pb2_grpc.add_GreeterServicer_to_server(GreeterServicerImpl(), server)
    server.add_insecure_port('0.0.0.0:3000')
    server.start()
    print('Waiting for requests...')
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        server.stop(0)


if __name__ == '__main__':
    Serve()
