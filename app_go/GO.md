### Framework

I have developed the application using default GO SDK net/http library. 

Pros:

1. High performance 
2. Easy to configure 
3. Production ready 

Cons:

1. Not very easy routings (in comparison with go-chi)

### Best practices

Used golangci-lint linter.

Added make file, gitignore and documented my code.

### Unit Tests

I have written unit test for root handler.
Since this service is simple, it is okay to check 200 status code and time format.