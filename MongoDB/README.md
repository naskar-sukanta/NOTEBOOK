# Start the MongoDB
docker-compose -f docker-compose-mongodb.yml up -d

# Check if containers are running
docker ps

# View MongoDB logs
docker-compose -f docker-compose-mongodb.yml logs mongodb

# Test MongoDB connection directly using docker
docker exec -it mongodb mongosh -u admin -p Sukanta2025 --authenticationDatabase admin
docker exec -it mongodb mongosh -u admin -p rptuser2025 -host 13.61.144.134
docker exec -it mongodb mongosh "mongodb://admin:Sukanta2025@15.206.70.111:27017/testdb?authSource=admin"

# Test MongoDB connection directly w/o using docker
mongosh "mongodb://admin:Sukanta2025@15.206.70.111:27017/testdb?authSource=admin"

# Backup MongoDB data
docker exec mongodb sh -c 'mongodump --uri="mongodb://admin:Sukanta2025@localhost:27017" --archive' > backup.archive

# Restore MongoDB data
docker exec -i mongodb sh -c 'mongorestore --uri="mongodb://admin:Sukanta2025@localhost:27017" --archive' < backup.archive
