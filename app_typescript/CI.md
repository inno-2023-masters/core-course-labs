# Best practices:


- **Seperated for each app** CI only triggers when only app_typescript folder changes pushed
- **Caching** Cached requirements to speed up installing dependencies
- **Linting** running pre commit linting
- **Snyk** Integrate Snyk into CI workflow to identify and address vulnerabilities in projects
- **Secrets** Using secrets instead of putting private data
