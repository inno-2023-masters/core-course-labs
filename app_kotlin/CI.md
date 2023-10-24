## CI workflow best practices used
The best practices are similar to what was described in `app_python/CI.md`:

- My actions are as minimal as possible to reduce the runner usage time.
- Actions are using cache for faster builds.
- Secrets are stored in github repository secrets and linked to the workflow by their names instead of being hardcoded.
- Global environment context is not polluted by environment variables.
- I don't use self-hosted runner for this public repository.
- SNYK code scanning performed by CLI command uses ready python environment instead of
  using [ready action](https://github.com/snyk/actions/tree/master/maven) and reinstalling all the dependencies
  again to minimize useless work.