# Continuous Integration

Several techniques were used for better continuous integration.

- **Workflow Triggers** - there is no point in running tests and code linters if just documentation is updated. Hence added conditions for workflow execution, so that it runs only when code, requirements, or workflows are pushed. Also runs workflow when a pull request to main is done.
  
- **Secrets** - storing sensitive data like API keys and passwords to services inside workflow files is unreasonable. Hence we use github secrets to omit them from public eye
  
- **Caching** - caching requirements is essential for quick CI processes. Caching allows us to skip setup steps when no new requirements are introduced.

- **Stage segregation** - it is important for readability of CI workflows to keep stages focused on their main purpose. Hence stages were segregated by functionality as much as possible.

- **Stage dependency** - there is no point in trying to push the docker image if the tests failed. Hence build/push stage requires tests/lint stage to succeed first.

- **Security scans** - snyk was used in this project to scan for vulnerabilities.