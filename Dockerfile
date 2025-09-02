FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN cmake . && make

CMD ["./hello"]
