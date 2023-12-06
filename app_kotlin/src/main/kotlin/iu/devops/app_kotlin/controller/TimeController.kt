package iu.devops.app_kotlin.controller

import io.github.oshai.kotlinlogging.KotlinLogging
import iu.devops.app_kotlin.service.TimeService
import jakarta.annotation.PostConstruct
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import java.nio.file.FileAlreadyExistsException
import java.nio.file.Files
import java.nio.file.Paths
import kotlin.io.path.name

@RestController("/")
class TimeController(
    private val timeService: TimeService
) {

    /**
     * @return text string that contains current time in "Europe/Moscow" timezone
     */
    @GetMapping
    fun time(): String = runCatching {
        updateVisits()
        timeService.moscowTime()
    }.onSuccess {
        logger.info { "Moscow time was sent" }
    }.onFailure {
        logger.error { it }
    }.getOrThrow()

    @GetMapping("/visits")
    fun visitsCounter(): String = runCatching {
        Files.readString(visitsFilePath)
    }.onSuccess {
        logger.info { "Visits counter was sent" }
    }.onFailure {
        logger.error { it }
    }.getOrThrow()

    @PostConstruct
    fun createVisitsFile() {
        try {
            Files.createDirectories(visitsDirPath)
            Files.createFile(visitsFilePath)
            Files.writeString(visitsFilePath, "0")
        } catch (_: FileAlreadyExistsException) {
            logger.info { "File 'visits' already exists" }
        }
    }

    private fun updateVisits() {
        val visitsCounter = Files.readString(visitsFilePath).toInt()
        val line = (visitsCounter + 1).toString()
        Files.writeString(visitsFilePath, line)
    }

    companion object {
        private val logger = KotlinLogging.logger { }
        private val visitsDirPath = Paths.get("visits_dir")
        private val visitsFilePath = Paths.get("${visitsDirPath.name}/visits")
    }
}
