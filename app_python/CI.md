## CI best practices

There are some good practices in implementing CI pipelines:

#### Include automated testing in build pipeline

Automated testing will make you ensure that your code is working, and allow to detect problems on early stages, before all project starts build. It will save time and resources.

#### Include different code checks into build pipeline

Such checks as linter will allow to improve code quiality and enforce coding standards in project.

#### Include security scanning into build pipeline

That will allow to detect vulnerabilities in the source code of application and its dependencies. As a result it helps to improve application security against common threats.

#### Add caching into build pipeline

Caching dependencies and other artifacts can significantly increase application build speed. The larger project - the larger speed impact will be.

#### Use CI platform tools to manage secrets

It is good practice **not** to store secrets (such as API keys or passwords) in pipeline source code. For example, github allows to keep secrets in its own secure storage, an access them using special syntax in pipeline.
