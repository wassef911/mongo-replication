from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27117/")

db = client["database_name"]

if db:
    print("Connected to MongoDB successfully!")
