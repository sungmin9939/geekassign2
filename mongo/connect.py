from pymongo import MongoClient

# 방법1 - URI
# mongodb_URI = "mongodb://localhost:27017/"
# client = MongoClient(mongodb_URI)

# 방법2 - IP, PORT
client = MongoClient('localhost', 27017)

db = client['baedalgeek_test']
collection = db['Users']


def insert():

    doc = {"name": "sungmin", "age":42}
    collection.insert_one(doc)

if __name__ == '__main__':
    insert()
    