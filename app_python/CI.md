# CI information

### Best practices applied:

* **Set timeouts for workflows**.
* **Limit scope of workflow token**. Give only necessary read/write permissions.
* **Pin test runners to version**. It is necessary for build to be stable. For example, I used `ubuntu:22.0.4`.
* **Use status badge**.
* **Use GitHub secrets**.
* **Using an action instead of an inline script**.
<TODO: add python caching building tool>
* **Use caching**. 
[`action/setup-python`](https://github.com/actions/setup-python#caching-packages-dependencies) and 
[`docker/build-push-action`](https://github.com/docker/build-push-action#git-context) provide caching mechanisms to speed up workflow jobs.
For caching `pip` dependencies I use `setup-python:caching`.
* **Upload artifacts**. Test, lint and security checks artifacts are uploaded after workflow run.
* **Run CI only for pull requests**.
