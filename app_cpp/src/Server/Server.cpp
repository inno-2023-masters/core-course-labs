#include "Server.h"
#include <ctime>
#include <iostream>
#include "Session.h"



void Server::accept_connection() {
    acceptor.async_accept([this](boost::system::error_code ec, tcp::socket socket) {
        if (!ec) {
            std::make_shared<Session>(std::move(socket))->run();
        } else {
            std::cout << "error: " << ec.message() << std::endl;
        }
        accept_connection();
    });
}

Server::Server(boost::asio::io_context &io_context, int port) :
        acceptor(io_context, tcp::endpoint(tcp::v4(), port)) {
    accept_connection();
}

