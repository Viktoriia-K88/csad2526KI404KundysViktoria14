# CMake configuration for a C++ project that compiles main.cpp into an executable named "hello"
cmake_minimum_required(VERSION 3.10)

project(HelloWorld LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Add math_operations static library
add_library(math_operations STATIC math_operations.cpp)
target_include_directories(math_operations PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# 1. ОСНОВНИЙ ВИКОНУВАНИЙ ФАЙЛ
add_executable(HelloWorld main.cpp)
# Лінкуємо основну програму з бібліотекою, яку вона використовує
target_link_libraries(HelloWorld PRIVATE math_operations)

# Enable testing
enable_testing()

# Fetch GoogleTest
include(FetchContent)
FetchContent_Declare(
googletest
URL https://github.com/google/googletest/archive/refs/heads/main.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

# Add unit_tests executable
add_executable(unit_tests tests/unit_tests.cpp)

# Лінкуємо тести з GTest (gtest_main) та з бібліотекою, яку ми тестуємо (math_operations)
target_link_libraries(unit_tests PRIVATE math_operations GTest::gtest_main)

# Включаємо спеціальний модуль для GTest для автоматичного пошуку тестів
include(GoogleTest)
gtest_discover_tests(unit_tests)

