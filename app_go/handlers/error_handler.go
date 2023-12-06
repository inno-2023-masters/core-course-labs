package handlers

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

// ErrorHandler is a custom error handler middleware.
func ErrorHandler() gin.HandlerFunc {
	return func(c *gin.Context) {
		defer func() {
			if err := recover(); err != nil {
				// Log the error
				fmt.Printf("Panic recovered: %v\n", err)

				c.JSON(http.StatusInternalServerError, gin.H{
					"error": "Internal Server Error",
				})
				c.Abort()
			}
		}()
		c.Next()
	}
}
