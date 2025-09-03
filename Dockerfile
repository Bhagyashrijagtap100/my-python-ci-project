# ==========================
# Stage 1: Build & Run Tests
# ==========================
FROM ubuntu:22.04 AS test-stage

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    g++ \
    cmake \
    make \
    ninja-build && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy project files
COPY CMakeLists.txt .
COPY main.cpp .
COPY test.cpp .

# Configure and build
RUN cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
RUN cmake --build build --target test_runner

# Run tests (Docker build will fail if tests fail)
RUN cd build && ctest --output-on-failure


# ==========================
# Stage 2: Build Final Binary
# ==========================
FROM ubuntu:22.04 AS build-stage

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    g++ \
    cmake \
    make \
    ninja-build && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY CMakeLists.txt .
COPY main.cpp .
COPY test.cpp .

RUN cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
RUN cmake --build build --target my_app

CMD ["/app/build/my_app"]
