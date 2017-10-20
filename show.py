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


def plot():
    min=-5
    max=30
    plotlines = [[str(i).zfill(2)] for i in range(max,min,-1)]
    print plotlines

    with open(time.strftime("%Y-%m-%d"), "r") as f:
        lines = f.readlines()
    for l in lines:
        value = int(round(float(l.strip().split(',')[1])))
        linesDown = max-value
        for i in range(len(plotlines)):
            if i == (linesDown-1):
                plotlines[i].append('X')
            else:
                plotlines[i].append('.')
    
    done = ''
    for i in range(len(plotlines)):
        done += (''.join(plotlines[i]) + '\n')
    return done

if __name__ == '__main__':
   app.run(host='0.0.0.0')
