1. Install docker - https://docs.docker.com/engine/install/ubuntu/
   - `docker -v` should return version of your docker

2. Install docker compose - https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04
   - `docker compose version` should return version of your docker compose

3. git clone https://github.com/harpia-io/harpia.git
4. cd harpia
5. HOST_IP=<SERVER_IP_ADDRESS> docker compose up -d && sleep 60 && docker restart harpia-harp-filters-1 && docker restart harpia-nginx-1
6. Visit your Portal: http://<SERVER_IP_ADDRESS>
   - Login: admin
   - Password: admin