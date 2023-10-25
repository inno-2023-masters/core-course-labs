# 🕰️ Moscow Time - app_csharp 🕰️

🌍 An ASP.NET marvel that lets you step into Moscow's time zone at the click of a button.

## 🚀 Getting Started

**Why settle for local time when you can have Moscow time?**

Just a couple of steps, and you'll be running on Moscow time (well, digitally).

### 🛠️ Build It

1. Launch the mystical JetBrains Rider (or Visual Studio).
2. Open the magical solution that holds the secrets of time.
3. Whisper the ancient spell (or just use the Build command).

### 🌌 How to Use The Time Portal

1. Awaken the app from its slumber using JetBrains Rider.
2. With a web browser as your steed, journey to `http://localhost:5000/time/moscow-time`.
3. Behold! The current time in Moscow!

## 🐳 Docker

**Containerizing Moscow Time**:

Unveil Moscow time from the confines of a container!

### 🚀 How to build?

Craft your own time capsule:

```bash
docker build -t dmitriypru/core_course_labs_csharp:latest .
```

### 🌍 How to pull?

Summon the time capsule:

```bash
docker pull dmitriypru/core_course_labs_csharp:latest
```

### 🌌 How to run?

Unleash Moscow time:

```bash
docker run -p 5000:80 dmitriypru/core_course_labs_csharp:latest
```

## Continuous Integration

My CI workflow consists of several essential steps to ensure the stability and quality of my codebase. These steps include:

- **Dependencies restoration**: Restores all necessary dependencies for the project using `dotnet restore`.
  
- **Build**: Compiles the C# codebase to ensure there are no build errors.
  
- **Tests**: I (and everybody else) use `dotnet test` to run all unit tests to ensure code integrity. After successful tests, I run `snyk` to find existing vulnerabilities in code or dependencies.
  
- **Docker integration**: Includes steps to login to Docker Hub and to build & push the Docker image.

The workflow gets triggered on pull requests to the `main` branch and when changes occur in the `app_csharp` folder.

## 💌 Owl Post (Contact)

For scrolls, prophecies, or general inquiries: [@dmitriypru](https://t.me/dmitriypru).
