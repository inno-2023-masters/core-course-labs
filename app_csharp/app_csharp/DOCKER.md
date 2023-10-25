# Docker Best Practices that I used

- **Multi-stage Builds**: Leveraging multi-stage builds to minimize the final image size.
- **Official Images**: Utilizing official .NET images for compatibility and security.
- **No Root User**: Application runs as a non-root user for increased security.
- **Caching**: Separating `dotnet restore` for optimal caching during builds.
