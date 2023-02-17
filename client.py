import pymongo
import redis
import json

# Connect to Redis
redis_client = redis.Redis(host='localhost', port=6379, db=0)

# Check Redis cache for data
cache_key = 'cache_key'
cache_data = redis_client.get(cache_key)

if cache_data:
    # Data is in cache
    result = json.loads(cache_data)
else:
    # Data is not in cache, query MongoDB
    mongo_client = pymongo.MongoClient('mongodb://localhost:27017/')
    db = mongo_client['mydatabase']
    col = db['mycollection']
    query = {'name': 'John'}
    result = col.find(query)

    # Cache the result in Redis
    redis_client.set(cache_key, json.dumps(list(result)))

for doc in result:
    print(doc)
