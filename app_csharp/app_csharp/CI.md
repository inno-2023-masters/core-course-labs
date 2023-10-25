# Continuous Integration best practices implemented

* **Fine-grained control**: CI workflow only triggers when there is a pull request to the `main` branch and there are changes in the `app_csharp` folder, reducing unnecessary runs.
* **Secured secrets**: I use GitHub secrets to securely manage sensitive information like Docker Hub and Snyk credentials.

## Snyk vulnerability checks

I have integrated Snyk into the CI workflow to identify and address vulnerabilities in the project. This helps to maintain a secure and robust codebase.
