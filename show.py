#!/usr/bin/python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return app.send_static_file(plot.txt); #should not be static i think....

if __name__ == '__main__':
   app.run(host='0.0.0.0')
