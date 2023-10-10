#pragma once

#include <string>

#include <boost/asio.hpp>
#include <boost/asio/steady_timer.hpp>

using namespace boost::asio;
using ip::tcp;

class Server {
public:
    explicit Server(boost::asio::io_context &io_context, int port);

    void accept_connection();

private:

    tcp::acceptor acceptor;
};
