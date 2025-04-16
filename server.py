import os
import json
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def serve_data():
    if not os.path.exists('scraped_data.json'):
        return jsonify({"error": "Data not scraped yet!"}), 500

    with open('scraped_data.json', 'r') as file:
        scraped_data = json.load(file)

    return jsonify(scraped_data)

if __name__ == '__main__':
    app.run(debug=False, host="0.0.0.0", port=5000)
