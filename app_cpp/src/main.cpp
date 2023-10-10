#include <iostream>
#include "Server/Server.h"

int main(int argc, char **argv) {
    if (argc != 2) {
        std::cout << "./exe <port> is mandatory\n";
        return -1;
    }
    int port = std::stoi(argv[1]);

    boost::asio::io_context io_context;
    Server server(io_context, port);
    io_context.run();

    return 0;
}