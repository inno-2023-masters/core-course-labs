## Continuous Integration (CI)

This project utilizes GitHub Actions for Continuous Integration (CI). The CI workflow is automatically triggered on every push to and pull request on the `main` branch.

### Workflow Steps

The CI workflow consists of the following essential steps:

- **Dependencies**: Install the project dependencies specified in the `requirements.txt` file.
- **Linter**: Run the linter (flake8) to analyze the code for potential issues and enforce coding standards.
- **Tests**: Execute unit tests using the `python -m unittest discover test` command to ensure the code functions correctly.
- **Docker**: Integrated Docker-related steps are also included in the CI workflow:
  - **Login**: Log in to the Docker registry using the provided credentials stored securely in GitHub Secrets.
  - **Build & Push**: Build and push a Docker image of the application to the specified Docker registry.

For more details on the CI workflow configuration, refer to the [ci.yml](.github/workflows/ci.yml) file.