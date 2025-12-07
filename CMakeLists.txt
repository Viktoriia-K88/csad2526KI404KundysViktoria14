# CMake configuration for a C++ project that compiles main.cpp into an executable named "hello"
cmake_minimum_required(VERSION 3.10)
project(HelloWorld)
set(CMAKE_CXX_STANDARD 11)
add_executable(hello main.cpp)

