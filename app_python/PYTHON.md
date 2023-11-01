# Chosen framework and reasoning
Framework: Flask
Reasoning: 
1. Lightweight and Minimalistic
2. Ease of Learning
3. Quick Development
4. Avoiding Complexity   

It is a good framework for our usecase because we do not want anything complicated, and flask is a micro framework that is easy to learn and use. 

---

# Best Practices

### Virtual Envionrment
Worked in a virtual environment to avoid dependency issues and to isolate the project from the rest of the system. 
Also used a requirements.txt file to keep track of the dependencies, so the project can be run on other machines with the same environment.
### Gitignore
Used a gitignore file to avoid pushing unnecessary files to the repository.
### Linting
Used pylint to strictly follow the PEP8 style guide. And to avoid any errors in the code.
### Testing
Used pytest to test the loading of the app initially and after refreshing. 
### Convention and Structure
Followed conventional naming and folder structure for a flask project. 
### WSGI
Used `gunicorn` as the WSGI server.
### README
Created a README.md file to explain the project and how to run it.
