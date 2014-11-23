from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello Kitty!"

@app.route("/status")
def karma():
    return "Your Karma is gooooood!"

if __name__ == "__main__":
    app.run('0.0.0.0')
