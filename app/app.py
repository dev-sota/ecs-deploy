from flask import Flask, jsonify, render_template

app = Flask(__name__)


@app.route('/')
def index():
    return 'Index Page'


@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name)


@app.route("/api")
def api():
    return jsonify({"language": "python"})


@app.route("/deploy")
def deploy():
    return jsonify({"deploy?": "OK"})

# @app.route("/api/users")
# def users_api():
#     users = get_all_users()
#     return jsonify([user.to_json() for user in users])


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
