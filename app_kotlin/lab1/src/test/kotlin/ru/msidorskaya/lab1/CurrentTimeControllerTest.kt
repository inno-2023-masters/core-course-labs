package ru.msidorskaya.lab1

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import ru.msidorskaya.lab1.controller.CurrentTimeController
import java.time.Duration
import java.time.OffsetTime
import java.time.ZoneOffset

class CurrentTimeControllerTest {
    @Test
    fun timeControllerReturnsParsableTime() {
        val currentTime = CURRENT_TIME_CONTROLLER.getCurrentTime()
        Assertions.assertDoesNotThrow({ OffsetTime.parse(currentTime) }, "Controller returned unparsable time: $currentTime")
    }

    @Test
    fun timeControllerReturnsCorrectZoneOffset() {
        val actualOffset = OffsetTime.parse(CURRENT_TIME_CONTROLLER.getCurrentTime()).offset
        val expectedOffset = ZoneOffset.ofHours(3)
        Assertions.assertEquals(
            actualOffset,
            expectedOffset,
            "Current time controller returned time with invalid offset: $actualOffset. " +
                "Expected offset: $expectedOffset",
        )
    }

    @Test
    fun timeControllerReturnsAccurateTime() {
        val actualValue = OffsetTime.parse(CURRENT_TIME_CONTROLLER.getCurrentTime())
        val expectedValue = OffsetTime.now(ZoneOffset.ofHours(3))
        Assertions.assertTrue(
            Duration.between(actualValue, expectedValue).toSeconds() < 1L,
            "Current time controller returned inaccurate current time: $actualValue. " +
                "Expected value $expectedValue with max error of 1 second",
        )
    }

    companion object {
        private val CURRENT_TIME_CONTROLLER: CurrentTimeController = CurrentTimeController()
    }
}
