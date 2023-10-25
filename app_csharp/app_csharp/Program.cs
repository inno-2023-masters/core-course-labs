using app_csharp.Services;
using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddSingleton<ITimeService, MoscowTimeService>();
builder.Services.AddControllers();

var app = builder.Build();
app.MapControllers();
app.Run();
