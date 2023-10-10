FROM muurrk/boost:1.83.0 as build

WORKDIR /app
COPY src/main.cpp ./src/CMakeLists.txt ./
COPY src/googletest ./googletest
COPY src/Server ./Server
COPY src/Test ./Teset

RUN cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release && cmake --build build


FROM ubuntu:22.04
COPY --from=build /app/build/startServer /app/

RUN useradd -ms /bin/bash user_start && chown -R user_start /app/
USER user_start
WORKDIR /app
ENTRYPOINT ["./startServer", "8080"]