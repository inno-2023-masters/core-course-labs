package ru.msidorskaya.lab1.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.ResponseBody
import java.time.OffsetTime
import java.time.ZoneOffset

@Controller
class CurrentTimeController {
    @ResponseBody
    @GetMapping("/time")
    fun getCurrentTime() = OffsetTime.now(MOSCOW_ZONE_ID).toString()

    companion object {
        private val MOSCOW_ZONE_ID = ZoneOffset.ofHours(3)
    }
}
