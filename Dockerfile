name: Run C++ Hello World in Docker

on:
  push:
    branches:
      - main   # Runs only when you push to main branch

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: Build Docker image
        run: docker build -t cpp-hello .

      - name: Run container
        run: docker run cpp-hello
