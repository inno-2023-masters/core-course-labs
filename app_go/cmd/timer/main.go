package main

import (
	"fmt"
	"net/http"

	timerRouter "wiirtex/devops_labs/internal/app/timer"
	"wiirtex/devops_labs/internal/pkg/service/timer"

	"github.com/go-chi/chi/v5"
)

func main() {

	timerService := timer.New()

	implementation := timerRouter.New(timerService)

	r := chi.NewRouter()

	r.Get("/", implementation.Now)

	if err := http.ListenAndServe(":7099", r); err != nil {
		fmt.Printf("can not stop server: %s\n", err.Error())
	}
}
