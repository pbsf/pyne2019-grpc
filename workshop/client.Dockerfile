FROM grpc/python:1.13

COPY client/ /client/
COPY protos /protos/

WORKDIR /client

RUN python -m grpc_tools.protoc \
    -I/protos \
    --python_out=/client \
    --grpc_python_out=/client \
    /protos/pyne/greeter.proto \
    /protos/google/api/annotations.proto \
    /protos/google/api/http.proto \
    /protos/google/rpc/code.proto \
    /protos/google/rpc/error_details.proto \
    /protos/google/rpc/status.proto

# Weird... but these files are required to avoid ModuleNotFoundError exception.
RUN touch /client/google/__init__.py \
  && touch /client/google/api/__init__.py \
  && touch /client/google/rpc/__init__.py

RUN pip install --no-cache-dir -r ./requirements.txt

EXPOSE 9000

CMD ["python", "-u", "client.py"]
