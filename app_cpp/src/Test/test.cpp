#include <gtest/gtest.h>
#include "../Server/Server.h"

TEST(HelloTest, BasicAssertions) {
    // Start server
    int port = 8080;
    boost::asio::io_context io_context_server;
    Server server(io_context_server, port);
    std::thread serverRun([&]() {
        io_context_server.run();
    });

    // Start client
    using boost::asio::ip::tcp;
    boost::asio::io_context io_context;
    tcp::socket socket(io_context);
    tcp::resolver resolver(io_context);
    boost::asio::connect(socket, resolver.resolve("127.0.0.1", std::to_string(port)));

    boost::asio::write(socket, boost::asio::buffer(""));

    boost::asio::streambuf response;
    boost::asio::read_until(socket, response, "\r\n");
    std::istream response_stream(&response);

    std::string http_version;
    response_stream >> http_version;

    int status_code;
    response_stream >> status_code;

    EXPECT_TRUE(response_stream);
    EXPECT_EQ(http_version.substr(0, 5), "HTTP/");
    EXPECT_EQ(status_code, 200);

    boost::system::error_code ec;
    socket.shutdown(boost::asio::ip::tcp::socket::shutdown_both, ec);
    socket.close();

    io_context_server.stop();
    serverRun.join();
}