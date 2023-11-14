// Package main starts the simple server and serves HTML
package main

import (
	"fmt"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	"github.com/quiner1793/dev-ops-course-labs/config"
	"github.com/quiner1793/dev-ops-course-labs/middleware"
	"github.com/quiner1793/dev-ops-course-labs/routes"
	"log"
	"net/http"
	"time"
)

func main() {
	cfg := config.NewConfig()
	mux := http.NewServeMux()

	mux.Handle("/time", middleware.Logging(routes.MoscowTime()))
	mux.Handle("/healthcheck", middleware.Logging(routes.HealthCheck()))
	mux.Handle("/metrics", middleware.Logging(promhttp.Handler()))

	addr := fmt.Sprintf("%s:%s", cfg.ServerHost, cfg.ServerPort)

	server := http.Server{
		Addr:         addr,
		Handler:      mux,
		ReadTimeout:  15 * time.Second,
		WriteTimeout: 15 * time.Second,
		IdleTimeout:  15 * time.Second,
	}

	log.Println("main: running simple server on", cfg.ServerHost, cfg.ServerPort)
	if err := server.ListenAndServe(); err != nil {
		log.Fatalf("main: couldn't start simple server: %v\n", err)
	}

	err := http.ListenAndServe(cfg.ServerHost+":"+cfg.ServerPort, mux)
	if err != nil {
		return
	}
}
