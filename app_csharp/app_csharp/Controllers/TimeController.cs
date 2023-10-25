using Microsoft.AspNetCore.Mvc;
using app_csharp.Services;

namespace app_csharp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TimeController : ControllerBase
    {
        private readonly ITimeService _timeService;

        public TimeController(ITimeService timeService)
        {
            _timeService = timeService;
        }

        [HttpGet("moscow-time")]
        public IActionResult GetMoscowTime()
        {
            return Ok(_timeService.GetMoscowTime());
        }
    }
}
