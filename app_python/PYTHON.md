## Framework choice

I decided to use Django framework for this project, because it is wide-used, open-source and very friendly to beginners.
Also, it has full and good documentation with lots of different tutorials and a lot of users, which means that it is
easy to solve any problem I could face with. Despite that Django is an easy-to-start framework, it is very powerful,
because some big applications implemented on it (e.g. Instagram, Spotify).

## Used best practices

- Regular Commits (used isolated commits for each step of the project)
- Descriptive Commit Messages (each commit has clear and full description of what was done)

## Testing and code quality

- For testing, I used build-in local Django server that detects every code change and deploys it immediately, so that
  the page http://127.0.0.1:8000/ always shows actual page content.
- I implemented an easy-to-understand, consistent, easy testable and free of bugs code to ensure code quality.

## Unit tests and best practices

I added 3 unit tests for my functionality:

1. `test_main_page_returns_200_response_code` checks that main page (`index method`) returns response with status code =
   200
2. `test_main_page_returns_parsable_iso_datetime` checks that main page returns datetime in iso format that can be
   parsed.
3. `test_main_page_returns_current_datetime_in_moscow_zone` checks that main page returns current datetime in moscow
   zone with error of one second.
   
For my unit tests I followed the following practices:
- Every test method name describes what functionality it tests
- Every method tests single part of the functionality
- Every test is simple and readable
- Avoided combined assessments
- Test methods combined to test cases logically by functionality
