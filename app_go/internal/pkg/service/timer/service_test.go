package timer

import (
	"context"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
)

func TestTimer_Now(t *testing.T) {
	t.Run("ok", func(t *testing.T) {

		timer := New()
		ctx := context.Background()

		require.NotEmpty(t, timer)

		first := timer.Now(ctx)
		time.Sleep(10 * time.Millisecond)
		second := timer.Now(ctx)

		require.Greater(t, second.Sub(first), 10*time.Millisecond)

		moscowLocation, err := time.LoadLocation("Europe/Moscow")
		require.NoError(t, err)

		require.Equal(t, first.Location(), moscowLocation)
		require.Equal(t, second.Location(), moscowLocation)
	})
}
