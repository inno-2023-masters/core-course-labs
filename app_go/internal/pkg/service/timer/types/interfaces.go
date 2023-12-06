package types

import (
	"context"
	"time"
)

// Timer returns time
type Timer interface {
	Now(ctx context.Context) time.Time
}
