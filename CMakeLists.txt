cmake_minimum_required(VERSION 3.17)
project(soundgood)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -lpqxx -lpq")
set(PQXX /usr/local/include/pqxx)


add_executable(soundgood main.cpp)

find_library(PQXX_LIB pqxx)
find_library(PQ_LIB pq)
target_link_libraries(soundgood ${PQXX_LIB} ${PQ_LIB})

