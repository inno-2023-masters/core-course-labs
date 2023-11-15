# Python.md

## Justification of choices

### Web framework

Ive chosen flask as a server framework. Its a lightweight and flexible web framework, excels in small to medium-sized web apps.

1. Minimalistic: Flask has a minimalistic design.
2. User-Friendly: Flask boasts a straightforward and intuitive API, making it a swift and uncomplicated choice for beginners.
3. Versatile: Flask offers high customization, allowing developers to cherry-pick the components they require for their app.
4. Scalable: Flask's scalability permits expansion through additional components or integration with other tools and technologies as needed.

### Linter

For linting ive used ruff. This is a new linter that is written in rust, which allows it to be very fast. It also includes the capabilities of several tools at once.

## Used best practices

- Ive used poetry for dependency management. It helps to better manage dependencies with great dependency resolver and version control of used libs. Also it uses virtual environments to isolate project
- Linting for checking of code quality
- Type hints for better type checking
- Testing for less errors in production
