package routes

import (
	"github.com/quiner1793/dev-ops-course-labs/entity"
	"html/template"
	"net/http"
	"time"
)

// MoscowTime is route for getting current Moscow time
func MoscowTime() http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		t, err := template.ParseFiles("templates/time.html")
		if err != nil {
			return
		}

		loc, _ := time.LoadLocation("Europe/Moscow")

		currentTime := time.Now().In(loc).Format("2006-01-02 15:04:05")

		err = t.Execute(w, &entity.Time{Time: currentTime})

		if err != nil {
			return
		}
	})
}
