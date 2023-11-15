# Tech stack decisions
I chose `fastapi` as the framework to implement this application in, since I'm already very familiar with it and it seemed to fit the project needs, given its simplicity.

## Fastapi pros
- Very easy to use
- Lightweight
- Faster than its competition
- Schema validation out of the box with pydantic 
- Built-in support for OpenAPI generation
- Asynchronous design
- Complete freedom in terms of project structure

## Fastapi cons
- Not a big fan of the DI it provides
- Deal-breaker for specific use-cases bugs can take months, if not years, to be taken care of
- Not the best choice for some of the projects (a big good old monolith could probably benefit more from something like `django`, since lost of things are taken care of out of the box)

# Best practices
- Test coverage
- PEP8

## Tests
`pytest` as the testing framework and `freezegun` since the application is dependent on current time.

## PEP8
`pycodestyle` takes care of that
```bash
poetry run pycodestyle src/* test/*
```
