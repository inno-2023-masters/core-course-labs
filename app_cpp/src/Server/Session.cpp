#include "Session.h"

void Session::run() {
    wait_for_request();
}

void Session::wait_for_request() {
    auto self(shared_from_this());
    std::string response = "HTTP/1.1 200 OK\r\n"
                           "Content-Type: text/html\r\n\r\n"
                           "<h2>Current Moscow Time: " + get_current_time() + "</h2>";

    boost::asio::write(m_socket, boost::asio::buffer(response));
}


std::string Session::get_current_time() {
    std::time_t current_time = std::time(nullptr);
    std::tm *moscow_time = std::gmtime(&current_time);
    std::string buffer;
    buffer.resize(80);
    std::strftime(buffer.data(), buffer.size(), "%Y-%m-%d %H:%M:%S", moscow_time);
    buffer.resize(strlen(buffer.data()));
    return buffer;
}