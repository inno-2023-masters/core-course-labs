package timer

import (
	"fmt"
	"net/http"
)

func (i *Implementation) Now(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)

	if _, err := w.Write([]byte(i.timer.Now(r.Context()).String())); err != nil {
		fmt.Printf("now: err: %s\n", err.Error())
	}
}
