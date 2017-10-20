#!/usr/bin/python
from flask import Flask
from flask import Response
import subprocess
import time

app = Flask(__name__)

@app.route("/")
def hello():
    cmd = ["./plot_temp.sh"]
    with open('temperature_plot.txt', 'w') as fout:
        subprocess.Popen(cmd, stdout=fout,
            stderr=subprocess.PIPE,
            stdin=subprocess.PIPE)

    time.sleep(5)

    with open('temperature_plot.txt', 'r') as f:
        content = f.read()
    return Response(content, mimetype='text/plain')

if __name__ == '__main__':
   app.run(host='0.0.0.0')
