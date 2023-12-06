package main

import (
	"app_go/handlers"
	"app_go/routes"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	// Custom error handler middleware
	r.Use(handlers.ErrorHandler())
	routes.SetupRoutes(r)
	r.Run(":8080")
}
