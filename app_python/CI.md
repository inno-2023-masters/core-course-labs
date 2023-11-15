# CI/CD Best Practices

1. Caching of Poetry
  I use poetry to manage dependencies. I install poetry in CI and cache it.
2. Caching of venv
  Poetry creates venv in known folder with all dependencies. I cache this folder.
3. Cache of Docker
  I use :latest-cache tag for that
4. CI workflow runs only if specific files are changed
5. Secrets are stored in Github's secrets storage
