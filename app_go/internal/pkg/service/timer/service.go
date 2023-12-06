package timer

import (
	"context"
	"fmt"
	"time"

	"wiirtex/devops_labs/internal/pkg/service/timer/types"
)

var _ types.Timer = Timer{}

type Timer struct {
	MoscowTimezone *time.Location
}

func New() Timer {
	loc, err := time.LoadLocation("Europe/Moscow")
	if err != nil {
		panic(fmt.Errorf("can not load location: %w", err))
	}
	return Timer{
		MoscowTimezone: loc,
	}
}

// Now implements types.Timer interface
func (t Timer) Now(_ context.Context) time.Time {
	return time.Now().In(t.MoscowTimezone)
}
