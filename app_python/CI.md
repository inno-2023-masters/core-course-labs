# Best Practices implemented

- **Caching**: `actions/setup-python` caching is used to speed up builds
- **Deploy on success**: Docker push is triggered only on successful tests
- **Artifacts**: They are used to store test results
- **Trigger on changes**: Pipeline is triggered only on changes in `app_python` folder
- **Vulnerabilities check**: Snyk is used to check vulnerabilities
- **Status badge**: Status badge is added to `README.md`
- **Multiple jobs**: Two jobs are used to build and test security
