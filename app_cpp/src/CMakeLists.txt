cmake_minimum_required(VERSION 3.1)
project(app_cpp)

set(CMAKE_CXX_STANDARD 17)
MESSAGE(STATUS "Using toolchain file: ${CMAKE_TOOLCHAIN_FILE}")

find_package(Boost REQUIRED system)
include_directories(${Boost_INCLUDE_DIRS})

add_subdirectory(Server)

add_executable(startServer main.cpp)
target_link_libraries(startServer PUBLIC ${Boost_LIBRARIES} Server)


if (TESTING)
    enable_testing()
    add_subdirectory(googletest)
    add_subdirectory(Test)
endif ()
