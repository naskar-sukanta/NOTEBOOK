# Find the network(s) a running Docker container (here the MongoDB) is attached to
ubuntu@ip-172-31-240-75:~/app$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED       STATUS       PORTS                                           NAMES
e52980028569   mongo:6.0   "docker-entrypoint.s…"   3 hours ago   Up 3 hours   0.0.0.0:27017->27017/tcp, :::27017->27017/tcp   mongodb

ubuntu@ip-172-31-240-75:~/app$ docker inspect e52980028569 |grep network
            "NetworkMode": "ubuntu_app-network",
                "ubuntu_app-network": {

