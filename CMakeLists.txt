cmake_minimum_required(VERSION 3.10)
project(MyCppApp)

set(CMAKE_CXX_STANDARD 17)

# Main executable
add_executable(myapp main.cpp)

# Test executable
add_executable(mytests test.cpp)
