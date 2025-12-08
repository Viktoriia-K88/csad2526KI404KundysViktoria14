REM Generate a Windows batch script (ci.bat) for a CMake project. The script must clean previous builds, create a 'build' directory, navigate to it, configure the project, build the project, and finally run all unit tests using CTest.
@echo off
REM Clean previous builds
if exist build (
    rmdir /s /q build
)
REM Create build directory
mkdir build
cd build
REM Configure the project with CMake
cmake ..
REM Build the project
cmake --build . --config Release
REM Run all unit tests using CTest
ctest --output-on-failure


