FROM grpc/python:1.13

COPY server/ /server/
COPY protos /protos/

WORKDIR /server

RUN python -m grpc_tools.protoc \
    -I/protos \
    --python_out=/server \
    --grpc_python_out=/server \
    /protos/pyne/greeter.proto \
    /protos/google/api/annotations.proto \
    /protos/google/api/http.proto \
    /protos/google/rpc/code.proto \
    /protos/google/rpc/error_details.proto \
    /protos/google/rpc/status.proto

# Weird... but these files are required to avoid ModuleNotFoundError exception.
RUN touch /server/google/__init__.py \
  && touch /server/google/api/__init__.py \
  && touch /server/google/rpc/__init__.py

RUN pip install --no-cache-dir -r ./requirements.txt

EXPOSE 3000

CMD ["python", "-u", "service.py"]
