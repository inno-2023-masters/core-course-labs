using Moq;
using Xunit;
using app_csharp.Controllers;
using app_csharp.Services;
using Microsoft.AspNetCore.Mvc;


namespace Tests;

public class TimeControllerTest
{
    [Fact]
    public void GetMoscowTime_ReturnsExpectedTime()
    {
        // Arrange
        var mockService = new Mock<ITimeService>();
        mockService.Setup(service => service.GetMoscowTime())
            .Returns(DateTime.UtcNow.AddHours(3));
                   
        var controller = new TimeController(mockService.Object);

        // Act
        var result = controller.GetMoscowTime();

        // Assert
        var okResult = Assert.IsType<OkObjectResult>(result);
        Assert.Equal(DateTime.UtcNow.AddHours(3).Hour, ((DateTime)okResult.Value).Hour);  // comparing hours
    }
}