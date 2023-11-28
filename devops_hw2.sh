#!/bin/bash
sudo chmod 644 /Users/tianyizuo/.docker/buildx/current

echo "Setting up docker..."
docker-compose up -d   

echo "Starting the SSH server in jenkins..."
docker exec jenkins /usr/sbin/sshd

echo "Setting up jenkins ansible ssh..."
docker exec jenkins ansible-playbook /root/ansible_config/ssh_keys_gen.yaml

echo "Setting up webserver ansible ssh..."
docker exec webserver ansible-playbook /root/ansible_config/ssh_keys_gen.yaml

echo "Setting up jenkins ansible auth..."
docker exec jenkins ansible-playbook /root/ansible_config/auth_keys_gen.yaml

echo "Setting up webserver ansible auth..."
docker exec webserver ansible-playbook /root/ansible_config/auth_keys_gen.yaml

docker exec jenkins chmod 600 /root/ansible_config/shared_ssh_keys/webserver_id_rsa

echo "Deploy jenkins ansible tasks to build app..."
docker exec jenkins ansible-playbook /var/jenkins_home/jenkins_config/jenkins_deploy.yaml -u jenkins
docker exec jenkins ansible-playbook /var/jenkins_home/jenkins_config/app_build.yaml -u jenkins

echo "Delete all the resources: Containers, Images, Volumes, Networks..."
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
docker volume rm $(docker volume ls -q)
docker network ls -q | grep -v -e "$(docker network ls --filter 'name=bridge' -q)" -e "$(docker network ls --filter 'name=host' -q)" -e "$(docker network ls --filter 'name=none' -q)" | xargs docker network rm
docker system prune -a