db.createUser({
  user: 'appuser',
  pwd: 'sukanta',
  roles: [
    {
      role: 'readWrite',
      db: 'testdb'
    }
  ]
});

db = db.getSiblingDB('testdb');
db.items.insertOne({
  name: 'Initial Item',
  created_at: new Date()
});
