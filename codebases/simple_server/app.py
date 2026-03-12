import os
from flask import Flask, request

app = Flask(__name__)

@app.route('/', methods=['GET'])
def get_home():
    return "Hello, world from EC2! This is Jay from Makers :)"

if __name__ == '__main__':
    app.run(
      debug=True,
      port=5001,
      host="0.0.0.0" # Listen for connections _to_ any server
    )
