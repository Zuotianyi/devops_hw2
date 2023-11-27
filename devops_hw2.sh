echo "Setting up docker..."
docker-compose up -d   

echo "Starting the SSH server in jenkins..."
docker exec jenkins /usr/sbin/sshd

echo "Creating a shared folder for keys"
docker exec jenkins mkdir -p /root/ansible_config/shared_ssh_keys

echo "Setting up jenkins ansible ssh..."
docker exec jenkins ansible-playbook /root/ansible_config/ssh_keys_gen.yaml

echo "Setting up webserver ansible ssh..."
docker exec webserver ansible-playbook /root/ansible_config/ssh_keys_gen.yaml

echo "Setting up jenkins ansible auth..."
docker exec jenkins ansible-playbook /root/ansible_config/auth_keys_gen.yaml

echo "Setting up webserver ansible auth..."
docker exec webserver ansible-playbook /root/ansible_config/auth_keys_gen.yaml

echo "Deploy jenkins ansible tasks to build app..."
docker exec jenkins ansible-playbook /var/jenkins_home/jenkins_config/jenkins_deploy.yaml -u jenkins
docker exec jenkins ansible-playbook /var/jenkins_home/jenkins_config/app_build.yaml -u jenkins