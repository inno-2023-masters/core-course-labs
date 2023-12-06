package routes

import (
	"app_go/handlers"

	"github.com/gin-gonic/gin"
)

func SetupRoutes(router *gin.Engine) {
	router.LoadHTMLGlob("templates/*")
	router.Static("/static", "./static")

	router.GET("/", handlers.Index)
	router.GET("/current-time", handlers.CurrentTime)
}
