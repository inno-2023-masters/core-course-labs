### Lab 1: Time Service realisation with Python

#### src

The starting point of all project `cmd/timer/main.go`.

Here I am creating variable services and chi-server. After that I just run it

In the package `internal/pkg/service/timer` is placed `Timer` interface and struct:

1) `Timer` - class that provides simple interface to work with time
 
In the package `internal/app/timer` is placed struct called `Implementation`. It implements some logic for API.

It provides function, that can is a handler for `chi` router.


#### requirements

In all modern go projects requirements are placed in go.mod + go.sum files. And they are up-to-date because of 
golang tools.

#### tests

Tests are placed just near the functions they are testing.