from flask import Flask, render_template, request, redirect, url_for
from pymongo import MongoClient
from datetime import datetime
import os

app = Flask(__name__)

def get_mongo_client():
    connection_string = os.getenv('MONGODB_URI', 'mongodb://admin:password123@localhost:27017/testdb?authSource=admin')
    return MongoClient(connection_string)

@app.route('/')
def index():
    try:
        client = get_mongo_client()
        db = client['testdb']
        items = list(db.items.find().sort('created_at', -1).limit(10))
        client.close()
        return render_template('index.html', items=items)
    except Exception as e:
        return render_template('index.html', error=str(e), items=[])

@app.route('/add', methods=['POST'])
def add_item():
    try:
        name = request.form.get('name')
        if name:
            client = get_mongo_client()
            db = client['testdb']
            db.items.insert_one({
                'name': name,
                'created_at': datetime.utcnow()
            })
            client.close()
        return redirect(url_for('index'))
    except Exception as e:
        return redirect(url_for('index'))

@app.route('/health')
def health():
    try:
        client = get_mongo_client()
        client.admin.command('ping')
        client.close()
        return {'status': 'healthy', 'database': 'connected'}, 200
    except Exception as e:
        return {'status': 'unhealthy', 'error': str(e)}, 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)
