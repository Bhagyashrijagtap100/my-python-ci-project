# Use GCC with CMake pre-installed
FROM debian:bookworm

# Install build tools
RUN apt-get update && apt-get install -y \
    build-essential cmake && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy source
COPY . .

# Build project
RUN mkdir build && cd build && cmake .. && make

# Default command: run tests
CMD ["./build/mytests"]
