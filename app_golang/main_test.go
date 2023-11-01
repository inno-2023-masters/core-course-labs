package main

import (
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestTimeHandler(t *testing.T) {
	// Create a request to the / endpoint (you can adjust this if needed)
	req, err := http.NewRequest("GET", "/", nil)
	if err != nil {
		t.Fatal(err)
	}

	// Create a response recorder to capture the response
	rr := httptest.NewRecorder()

	// Call the timeHandler function, passing in the response recorder and request
	timeHandler(rr, req)

	// Check the response status code (should be 200 OK)
	if status := rr.Code; status != http.StatusOK {
		t.Errorf("handler returned wrong status code: got %v want %v", status, http.StatusOK)
	}

	// Check the response body (you can adjust this based on your expected output)
	expected := "Current time in MSK timezone:"
	if body := rr.Body.String(); !strings.Contains(body, expected) {
		t.Errorf("handler returned unexpected body: got %v want %v", body, expected)
	}
}
