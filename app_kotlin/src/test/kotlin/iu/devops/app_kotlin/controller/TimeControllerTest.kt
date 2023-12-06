package iu.devops.app_kotlin.controller

import com.ninjasquad.springmockk.MockkBean
import io.mockk.every
import iu.devops.app_kotlin.service.TimeService
import org.junit.jupiter.api.Test
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest
import org.springframework.test.context.TestConstructor
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders
import org.springframework.test.web.servlet.result.MockMvcResultMatchers

@AutoConfigureMockMvc
@WebMvcTest(controllers = [TimeController::class])
@TestConstructor(autowireMode = TestConstructor.AutowireMode.ALL)
@MockkBean(TimeService::class)
class TimeControllerTest(
    private val mockMvc: MockMvc,
    private val timeService: TimeService
) {

    @Test
    fun `test time page available and has correct text`() {
        every { timeService.moscowTime() } returns MOCK_TIME_VALUE

        val requestPerform = mockMvc.perform(
            MockMvcRequestBuilders
                .get("/")
        )

        requestPerform
            .andExpect(
                MockMvcResultMatchers.status().isOk
            )
            .andExpect(
                MockMvcResultMatchers.content().string(MOCK_TIME_VALUE)
            )
    }

    companion object {
        private const val MOCK_TIME_VALUE = "00:00:00"
    }
}
