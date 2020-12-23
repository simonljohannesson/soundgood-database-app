cmake_minimum_required(VERSION 3.17)
project(soundgood)

add_subdirectory(google_test)


set(CMAKE_CXX_STANDARD 20)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -lpqxx -lpq")
set(PQXX /usr/local/include/pqxx)


#add_executable(soundgood main.cpp test/test.cpp test/test.h)
add_executable(soundgood main.cpp dto/RentalInstrument.cpp dto/RentalInstrument.h dto/Rental.cpp dto/Rental.h dto/StudentPersonDTO.cpp dto/StudentPersonDTO.h integration/DbHandler.cpp integration/DbHandler.h controller/Soundgood.cpp controller/Soundgood.h model/RentalManager.cpp model/RentalManager.h)

find_library(PQXX_LIB pqxx)
find_library(PQ_LIB pq)
target_link_libraries(soundgood ${PQXX_LIB} ${PQ_LIB})

