package config

import (
	"os"
)

type ServerCfg struct {
	ServerHost string
	ServerPort string
}

func NewConfig() *ServerCfg {
	port, ok := os.LookupEnv("SERVER_PORT")
	if !ok {
		port = "8070"
	}

	host, ok := os.LookupEnv("SERVER_HOST")
	if !ok {
		host = "0.0.0.0"
	}

	return &ServerCfg{ServerHost: host, ServerPort: port}
}
