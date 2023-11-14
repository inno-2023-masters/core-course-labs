package integration

import (
	"github.com/quiner1793/dev-ops-course-labs/routes"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestTimeRequest(t *testing.T) {
	req, err := http.NewRequest("GET", "/time", nil)
	if err != nil {
		t.Fatal(err)
	}

	requestRecorder := httptest.NewRecorder()
	routes.MoscowTime().ServeHTTP(requestRecorder, req)

	statusCode := 200
	if requestRecorder.Result().StatusCode != statusCode {
		t.Errorf("TestInfoRequest() test returned an unexpected result: got %v want %v", requestRecorder.Result().StatusCode, statusCode)
	}
}
