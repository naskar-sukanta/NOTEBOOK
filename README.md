# Find the network(s) a running Docker container (here the MongoDB) is attached to
ubuntu@ip-172-31-240-75:~/app$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED       STATUS       PORTS                                           NAMES
e52980028569   mongo:6.0   "docker-entrypoint.s…"   3 hours ago   Up 3 hours   0.0.0.0:27017->27017/tcp, :::27017->27017/tcp   mongodb

ubuntu@ip-172-31-240-75:~/app$ docker inspect e52980028569 |grep network
            "NetworkMode": "ubuntu_app-network",
                "ubuntu_app-network": {

# Build and bring up the app
docker-compose -f docker-compose-app.yml up -d

# Stop the application
docker-compose down

# Restart specific service
docker-compose restart webapp

# View MongoDB logs
docker-compose logs mongodb

# Backup MongoDB data
docker exec mongodb sh -c 'mongodump --uri="mongodb://admin:password123@localhost:27017" --archive' > backup.archive

# Restore MongoDB data
docker exec -i mongodb sh -c 'mongorestore --uri="mongodb://admin:password123@localhost:27017" --archive' < backup.archive

# Scale webapp (if needed)
docker-compose up -d --scale webapp=3
