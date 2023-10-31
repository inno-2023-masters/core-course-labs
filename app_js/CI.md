# Best Practices implemented

- **Caching**: `actions/setup-node` caching is used to speed up builds
- **Deploy on success**: Docker push is triggered only on successful tests
- **Trigger on changes**: Pipeline is triggered only on changes in `app_js` folder
- **Status badge**: Status badge is added to `README.md`
