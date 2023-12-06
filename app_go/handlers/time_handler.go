package handlers

import (
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

// CurrentTime handles the current-time route.
func CurrentTime(c *gin.Context) {
	currentTime := time.Now().In(time.FixedZone("Moscow Time", 3*60*60))
	currentTimeStr := currentTime.Format("15:04:05")
	c.JSON(http.StatusOK, gin.H{"time": currentTimeStr})
}
