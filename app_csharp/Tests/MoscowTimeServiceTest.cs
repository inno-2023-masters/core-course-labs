using app_csharp.Services;

namespace Tests;

public class MoscowTimeServiceTest
{
    [Fact]
    public void GetMoscowTime_ReturnsCorrectOffset()
    {
        // Arrange
        ITimeService timeService = new MoscowTimeService();

        // Act
        var moscowTime = timeService.GetMoscowTime();
        var expectedOffset = DateTime.UtcNow.AddHours(3);

        // Assert
        Assert.Equal(expectedOffset.Hour, moscowTime.Hour);  // comparing hours as exact minutes or seconds might vary slightly due to execution time
    }
}