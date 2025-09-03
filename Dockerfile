# ==========================
# CI Build & Test Container
# ==========================
FROM ubuntu:22.04 AS build

ENV DEBIAN_FRONTEND=noninteractive

# Install build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    g++ \
    cmake \
    make \
    ninja-build \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy project files
COPY CMakeLists.txt .
COPY main.cpp .
COPY test.cpp .

# Configure with CMake
RUN cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release

# Build app and test targets
RUN cmake --build build --target my_app
RUN cmake --build build --target test_runner

# Run tests (if they fail, Docker build fails)
RUN cd build && ctest --output-on-failure

# Keep final binary in /app/build/
# GitHub Actions workflow will extract it using:
#   docker cp <container_id>:/app/build/my_app ./my_app
