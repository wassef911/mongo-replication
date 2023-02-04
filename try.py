from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27117/")

db = client["database_name"]

print(f"Connected to MongoDB successfully: {db}")
