from flask import Flask 

app = Flask(__name__)

@app.route('/api/data')
def home():
    return {'message': 'Hello from the backend!'}

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=9000)
