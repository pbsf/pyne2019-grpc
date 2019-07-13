FROM grpc/python:1.13

COPY server/ /server/
COPY protos /protos/

WORKDIR /server

RUN python -m grpc_tools.protoc \
    -I/protos \
    --python_out=/server \
    --grpc_python_out=/server \
    /protos/pyne/greeter.proto

RUN pip install --no-cache-dir -r ./requirements.txt

EXPOSE 3000

CMD ["python", "-u", "service.py"]
