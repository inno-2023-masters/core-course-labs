package main

import (
	"io"
	"net/http"
	"net/http/httptest"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
)

func TestRoot(t *testing.T) {
	req := httptest.NewRequest(http.MethodGet, "/", nil)
	w := httptest.NewRecorder()

	currentMoscowTimeHandler(w, req)

	res := w.Result()
	assert.Equal(t, http.StatusOK, res.StatusCode)

	data, err := io.ReadAll(res.Body)
	assert.NoError(t, err)

	_, err = time.Parse(timeFormat, string(data))
	assert.NoError(t, err)
}
