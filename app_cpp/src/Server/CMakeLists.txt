add_library(Server Server.cpp Session.cpp)
target_link_libraries(Server PRIVATE ${Boost_LIBRARIES})