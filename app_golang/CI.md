# Best Practices

#### Splitting workflow to multiple jobs
Split the workflow to different jobs, to decouple it and make it easier to read with better description and less complexity.

#### Splitting jobs to multiple steps
Split each jobs to different steps, for better clarity, documentation, and ease of editing.

#### Use of cache
Used the cache action for better effeciency and shortining of processing time.

#### Triggering only when needed
Specified the path of the workflow for the `app_golang` aside from markdown files directory to only run when changes happen to code within that directory.

#### Status badge
Included a status badge within the golang app readme for better visibility 

#### Testing
Included testing within the CI pipeline to avoid mistakes and to always have an objective check for each push/pull_request

#### Vulnerability checking
Used snyk for vulnerability checks.

#### Sequential jobs
Made jobs rely on other jobs succeeding first, specifically to avoid pushing to dockerhub in case of failing previous jobs.

#### Usage of Secrets
Used github secrets to store confidential information such as dockerhub credintials and snyk token