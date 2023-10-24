package ru.msidorskaya.lab1.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.ResponseBody

@Controller
class PageCounterController {
    init {
        launchNumber = 1
    }

    @ResponseBody
    @GetMapping("/")
    fun getCurrentOpenNumber() =
        "Воу, Вы открывали эту страницу уже $launchNumber раз!"
            .also {
                launchNumber += 1
            }

    companion object {
        var launchNumber = 1
    }
}
