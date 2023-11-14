package routes

import (
	"net/http"
)

func HealthCheck() http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusOK)
		jsonData := []byte(`{"status":"OK"}`)
		_, err := w.Write(jsonData)
		if err != nil {
			return
		}
	})
}
