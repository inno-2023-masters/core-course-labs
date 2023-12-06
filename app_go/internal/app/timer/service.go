package timer

import (
	"wiirtex/devops_labs/internal/pkg/service/timer/types"
)

type Implementation struct {
	timer types.Timer
}

func New(timer types.Timer) *Implementation {
	return &Implementation{
		timer: timer,
	}
}
