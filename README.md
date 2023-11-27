# devops_hw2

## Step by Step Instructions
### Method 1 w/ Automation
Enter devops_hw2 folder and run the following command
```
sudo ./devops_hw2.sh
```

### Method 2 w/o Automation
**Alternatively**, run the commands in **devops_hw2.sh** line by line in case there're errors with Jenkins authorization.\
After docker-compose, docker containers as below should be ready. There will be two servers running, one for Jenkins and one for web. They will share one key file as defined in **docker-compose.yaml -> volume**.\
Terminal logs:
<img width="968" alt="result_docker_compose" src="https://github.com/Zuotianyi/devops_hw2/assets/55261595/36c94ee1-3c0c-4b28-8b1e-68f3267a4a21">
Docker dashboard:
<img width="1423" alt="docker_list" src="https://github.com/Zuotianyi/devops_hw2/assets/55261595/9e2ac0a5-2b25-4481-9fed-a2d6d32a4e56">

**Note**: Verify on Jenkins Dashboard -> Manage Jenkins -> Security to ensure arbitrary users are allowed to create jobs.

Run **jenkins_deploy.yaml** to create Jenkins job and verify on Jenkins dashboard that a new job named PetClinicBuild displayed. 
Terminal logs:
<img width="1440" alt="jenkins_deploy_terminal_results" src="https://github.com/Zuotianyi/devops_hw2/assets/55261595/0d80b5e8-695a-4a9e-9131-76730ad74056">
Jenkins dashboard:
<img width="1440" alt="new_job_created" src="https://github.com/Zuotianyi/devops_hw2/assets/55261595/5a6f087f-d0ec-41bd-ba1a-a6eaa758064a">

Run the **webserver_deploy.yaml** to build the jar file on Jenkins and run the executable on webserver.
Terminal logs:
<img width="1440" alt="app_deploy_terminal_logs" src="https://github.com/Zuotianyi/devops_hw2/assets/55261595/c716f41e-cbb1-4957-bab0-01e03a8cb21b">

Jenkins dashboard:
<img width="1440" alt="jenkins_dashboard" src="https://github.com/Zuotianyi/devops_hw2/assets/55261595/3af06c96-2181-4928-b065-91841be72572">

Jenkins logs:
<img width="1440" alt="jenkins_logs" src="https://github.com/Zuotianyi/devops_hw2/assets/55261595/a4905c0c-3037-4690-9d3e-7873b9d0a78a">



## Results
Access the web app at <http://localhost:8085>
<img width="1440" alt="welcome_screen" src="https://github.com/Zuotianyi/devops_hw2/assets/55261595/3bab7e7d-e834-48e0-bfa5-ba16524c13b6">


