package middleware

import (
	"fmt"
	"log"
	"net/http"
	"time"
)

// Logging is middleware for wrapping any handler we want to track response
// times for and to see what resources are requested.
func Logging(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		start := time.Now()
		req := fmt.Sprintf("%s %s", r.Method, r.URL)
		log.Println(req)
		next.ServeHTTP(w, r)
		log.Println(req, "completed in", time.Now().Sub(start))
	})
}
