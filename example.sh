sudo docker ps -aq | xargs sudo docker stop | xargs sudo docker rm -f
# Delete all images exept node, nginx
sudo docker images -a | grep -v '^node' | grep -v '^nginx' | awk 'NR>1 {print $3}' | xargs sudo docker image rm -f
sudo docker volume ls -qf | xargs sudo docker volume rm -f
sudo service docker stop
sudo rm -rf /var/lib/docker/network
sudo service docker start
sudo docker network ls -q | xargs sudo docker network rm
