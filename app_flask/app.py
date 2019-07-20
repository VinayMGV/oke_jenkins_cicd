from flask import Flask, jsonify


app = Flask(__name__)


@app.route('/')
def hello():
    json_out = {
        "name": "app_flask",
        "version": "bleeding_edge"
        }
    return jsonify(json_out)


if __name__ == "__main__":
    app.run(host='0.0.0.0')
