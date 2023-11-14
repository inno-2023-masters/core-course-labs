# Continuous integration

## CI best practices

* Early and often commits: The first step is to ensure all required files are under version control to keep track of every change
* Passed tests: Avoid building on bad base, keep all tests and checks passed
* Build only once: Do not create a new build for each step, as it may introduce some inconsistencies, the same build artifact should be promoted through each stage of the build pipeline and ultimately released to live
* Streamline tests: The first layer of tests should give quick response for obvious errors (like unittests). Then should go more complex tests (like integration tests, the GUI tests and so on)

## GitHub Workflows best practices

* Use libraries for actions
* Use concrete language libraries for specific folders on their change
* Use caching
* Take advantage from parallel actions
