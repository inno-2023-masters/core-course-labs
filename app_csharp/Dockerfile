FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["app_csharp/app_csharp.csproj", "app_csharp/"]
RUN dotnet restore "app_csharp/app_csharp.csproj"
COPY . .
WORKDIR "/src/app_csharp"
RUN dotnet build "app_csharp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "app_csharp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser
ENTRYPOINT ["dotnet", "app_csharp.dll"]
