#pragma once

#include <memory>
#include <iostream>

#include <boost/asio.hpp>
#include <boost/asio/steady_timer.hpp>

using namespace boost::asio;
using ip::tcp;

class Session : public std::enable_shared_from_this<Session> {
public:
    explicit Session(tcp::socket socket)
            : m_socket(std::move(socket)) {}

    void run();

private:
    void wait_for_request();

private:
    tcp::socket m_socket;
    boost::asio::streambuf m_buffer;
    static std::string get_current_time();
};