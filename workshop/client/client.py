import grpc

from pyne import greeter_pb2
from pyne import greeter_pb2_grpc

def SayHello(text):
    with grpc.insecure_channel('greeter:3000') as channel:
        stub = greeter_pb2_grpc.GreeterStub(channel)
        response = stub.SayHello(greeter_pb2.HelloRequest(name=text))
        print(response)

if __name__ == '__main__':
    SayHello('dev')

