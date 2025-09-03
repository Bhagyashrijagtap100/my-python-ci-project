cmake_minimum_required(VERSION 3.16)
project(MyCppApp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ---- Main executable ----
add_executable(my_app main.cpp)

# ---- Test executable ----
enable_testing()
add_executable(test_runner test.cpp)
add_test(NAME unit_tests COMMAND test_runner)
