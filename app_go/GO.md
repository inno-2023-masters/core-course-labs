Lab 1: Time Service realisation with Go

#### Library for routing
I am using `chi`. It is modern, fast (high-performance), web framework for building APIs (https://github.com/go-chi/chi).

Creating routes is really simple process. You need just provide a function, that is a prototype.

I've found some pros of this framework:

High Performance. One of the most important features of the framework, even in so small projects;
Strong Community and Active Development. `chi` is very popular, so in case of any troubles I will find help very easily;



#### Best practices
I just new some best practices for programs in Go. 

Project structure

It is convenient. I will have an opportunity to quickly add new functionality
It is well-known between programmers. Any programmer, that will open my code will see familiar code
I am actively using dependency injection to simplify testing and development.

Moreover, I've used some more practices to make my code reliable. Most valuable is unit testing:

My code has high coverage. So I can do changes to it without scare, that i will break some functionality
Tests are in different package. I am sure, that tests are using my packages as external users - they are not changing internal fields and use only public interfaces
One more, I have a package, called requirements, where I am placing all required external libraries to make my project work.