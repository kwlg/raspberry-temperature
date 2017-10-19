#!/usr/bin/python
from flask import Flask
from flask import Response
import time

app = Flask(__name__)

@app.route("/")
def hello():
    with open(time.strftime("%Y-%m-%d"), "r") as f:
        content = f.read()
    return Response(content, mimetype='text/plain')

if __name__ == '__main__':
   app.run(host='0.0.0.0')
