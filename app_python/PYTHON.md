# Python, Django Framework

## Framework Justification:

* Django widely used python framework in web backend development
* Currently, Project is really simple, but in the future if it gets complicated then Django is the best option
* Eventhough Django has orginized file system and handles most of basic stuff giving more time to develop main part
* More secured, Django is known for its strong security features. It includes protection against common web vulnerabilities like Cross-Site Scripting (XSS), Cross-Site Request Forgery (CSRF), SQL injection, and more. These security features are enabled by default, reducing the risk of security breaches.



## Applied Best Practices

1. **Project Structure:** Follow a well-structured project layout. Django encourages the use of the "Django Project layout," which separates settings, URLs, templates, and application-specific code. Additionally, consider using Django Apps to modularize your code for better organization.

2. **Version Control:** Use version control systems like Git to track changes in your codebase. This enables collaboration, code sharing, and the ability to roll back to previous versions if issues arise.

3. **Virtual Environments:** Utilize virtual environments (e.g., `venv` or `virtualenv`) to isolate project dependencies. This ensures that your project's dependencies do not interfere with system-wide Python packages.

4. **Configuration Management:** Store sensitive information, such as database credentials and API keys, in environment variables or use a configuration management tool like `python-decouple` or Django's built-in `settings.py` for secure and environment-specific configuration.

5. **Deployment and Scalability:** Follow best practices for deploying Django applications, including using production-ready web servers like Gunicorn or uWSGI, and consider using containerization (e.g., Docker) for deployment. Implement load balancing and database scaling for high-traffic applications.

- **Pre-commit hooks**: Linters and formatters run every time we commit a change.
  I used autoflake, isort and black for python and pymarkdown, mdformat for Markdown.

- **Gitignore**: Keeping repository clean

- **Autotests**: Using Unittest to test application
