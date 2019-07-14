FROM grpc/python:1.13

COPY client/ /client/
COPY protos /protos/

WORKDIR /client

RUN python -m grpc_tools.protoc \
    -I/protos \
    --python_out=/client \
    --grpc_python_out=/client \
    /protos/pyne/greeter.proto

CMD ["python", "-u", "client.py"]
