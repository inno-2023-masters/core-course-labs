
### Lab 1: Time Service realisation with Python

#### Framework

I am using FastAPI. It is modern, fast (high-performance), web framework for building APIs (https://fastapi.tiangolo.com).

I didn't work with this framework in the past and really wanted to try it out.
At first glance, creating routes is a simple process, so adding new functionality to my project will not be very hard 
in the future.

I've found some pros of this framework:

 - High Performance. One of the most important features of the framework, even in so small projects;
 - Strong Community and Active Development. FastAPI is very popular, so in case of any troubles I will find help very easily;
 - Easy to Use. I've already made sure in this point;
 - Type Annotations and Validation from scratch. Now this point is not so useful, but I believe, I will use it much 
during next labs


#### Best practices

I've opened this link https://github.com/zhanymkanov/fastapi-best-practices#1-project-structure-consistent--predictable
and used some of best practices in my project.
 
1) ~~Project structure~~
   - ~~It is convenient. I will have an opportunity to quickly add new functionality~~
   - ~~It is well-known between programmers. Any programmer, that will open my code will see familiar code~~
   
   - No, I am not able to make python run, when source codes are divided into different modules 


2) My routines only with I/O blocking operations are not asynchronous.
    - When such functions are called in sync, they don't block the eventloop

Moreover, I've used some more practices to make my code reliable. Most valuable is unit testing:

1) My code has high coverage. So I can do changes to it without scare, that i will break some functionality
2) ~~Tests are in different package. I am sure, that tests are using my packages as external users - they are not changing 
internal fields and use only public interfaces~~
   - No, I am not able to make python run, when source codes are divided into different modules

One more, I have a package, called `requirements`, where I am placing all required external libraries to make my project work.

#### Testing

I've already wrote tests. There are unit and component tests between them.
I am checking the time difference between start and finish points.
Moreover, I am checking, that timezone is Moscow (+03:00).
In component tests I am checking, that time changes between each request
and that all responses have status 200.

