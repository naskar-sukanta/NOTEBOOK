# Start the MongoDB
docker-compose -f docker-compose-mongodb.yml up -d

# Check if containers are running
docker ps

# View MongoDB logs
docker-compose -f docker-compose-mongodb.yml logs mongodb

# Test MongoDB connection directly
docker exec -it mongodb mongosh -u admin -p Sukanta2025 --authenticationDatabase admin

# Backup MongoDB data
docker exec mongodb sh -c 'mongodump --uri="mongodb://admin:Sukanta2025@localhost:27017" --archive' > backup.archive

# Restore MongoDB data
docker exec -i mongodb sh -c 'mongorestore --uri="mongodb://admin:Sukanta2025@localhost:27017" --archive' < backup.archive
