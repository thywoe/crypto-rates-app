# from urllib import response
# import requests

# api_url = "https://api.coingecko.com/api/v3/exchange_rates"

# response = requests.get(api_url)

# print (response.json())


from flask import Flask
import requests

app = Flask(__name__)


@app.route('/')
def hello():
    return 'Hello, World!'
@app.route('/rates', methods=['GET'])
def rates():
    r = requests.get('https://api.coingecko.com/api/v3/exchange_rates')

    return r.json()

if __name__ == '__main__':
   app.run(host='0.0.0.0')
