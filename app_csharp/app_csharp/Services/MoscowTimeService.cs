using System;

namespace app_csharp.Services
{
    public class MoscowTimeService : ITimeService
    {
        public DateTime GetMoscowTime()
        {
            return DateTime.UtcNow.AddHours(3);
        }
    }
}