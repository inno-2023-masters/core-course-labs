## Framework chosen
I used ``Django`` as a framework for the app for the following reasons:
- **Relevance:** it is well-known and suitable for web applications and has an active community with tons of knowledge on the app's maintenance
- **Ease of use:** it is easily set up and managed with built-in tools
- **Scalability:** django is well-structured and higly scalable, allowing to expand the app for greater features
- **Security:** django has many built-in security features, protecting from SQL injections and cross-site scripting

## Best practices
1. **Code quality:** code is written considering PEP8 style guide and checked with linters.
2. **Code structure**: code implementing the logic is well-structured, each module implementing its own conсern
3. **Code clarity**: variables have meaningful names, and comments for clarity are included
4. **Automated tests:** the logic of the app is tested using unit-tests. It allows to detect errors early in development process and ensure quality.
5. `gitignore` for excluding unneeded files is used