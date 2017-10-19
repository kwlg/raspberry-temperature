#!/usr/bin/python
from flask import Flask
from flask import render_template
app = Flask(__name__)

@app.route("/")
def hello():
    with open("2017-10-19", "r") as f:
        content = f.read()
    return render_template('log.html', content=content)

if __name__ == '__main__':
   app.run(host='0.0.0.0')
