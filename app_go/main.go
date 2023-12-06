package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
	"strings"
	"time"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

var (
	timeHandlerProcessed = promauto.NewCounter(prometheus.CounterOpts{
		Name: "time_handler_processed",
		Help: "The total number of time handler calls",
	})
)

const (
	timeFormat = "2006-01-02 15:04:05"

	visitsFilePath = "./volume/visits"
)

func currentMoscowTimeHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("GET TIME / HTTP")

	err := increaseNumberInFile()
	if err != nil {
		log.Println(err)
		http.Error(w, "Internal server error", http.StatusInternalServerError)
		return
	}

	timeHandlerProcessed.Inc()

	location, err := time.LoadLocation("Europe/Moscow")
	if err != nil {
		log.Println(err)
		http.Error(w, "Internal server error", http.StatusInternalServerError)
		return
	}

	currentTime := time.Now().In(location)
	fmt.Fprint(w, currentTime.Format(timeFormat))
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("GET HEALTH / HTTP")

	w.WriteHeader(http.StatusOK)
	fmt.Fprint(w, "Server is healthy")
}

func visitsHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("GET VISITS / HTTP")

	num, err := readNumberFromFile()
	if err != nil {
		log.Println(err)
		http.Error(w, "Internal server error", http.StatusInternalServerError)
	}

	w.WriteHeader(http.StatusOK)
	fmt.Fprint(w, num)
}

func increaseNumberInFile() error {
	numberStr, err := readNumberFromFile()
	if err != nil {
		return err
	}

	number, err := strconv.Atoi(numberStr)
	if err != nil {
		return err
	}

	number++
	return writeNumberToFile(strconv.Itoa(number))
}

func readNumberFromFile() (string, error) {
	data, err := os.ReadFile(visitsFilePath)
	if err != nil {
		return "", err
	}

	num := strings.TrimSpace(string(data))
	return num, nil
}

func writeNumberToFile(num string) error {
	data := []byte(num)
	err := os.WriteFile(visitsFilePath, data, 0644)
	if err != nil {
		return err
	}
	return nil
}

func main() {
	http.Handle("/metrics", promhttp.Handler())
	http.HandleFunc("/health", healthHandler)
	http.HandleFunc("/visits", visitsHandler)
	http.HandleFunc("/", currentMoscowTimeHandler)
	if err := http.ListenAndServe(":9000", nil); err != nil {
		log.Fatal(err)
	}
}
