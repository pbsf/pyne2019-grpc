import grpc

import pyne_pb2
import pyne_pb2_grpc

def SayHello(text):
    with grpc.insecure_channel('pyne:3000') as channel:
        stub = pyne_pb2_grpc.GreeterStub(channel)
        req = pyne_pb2.HelloRequest(name=text)
        response = stub.SayHello(req)
        print(response.greetings)

if __name__ == '__main__':
    SayHello('dev')
