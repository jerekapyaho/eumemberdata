import os
import json

from flask import Flask, request, Response

from memberdata import get_countries, get_country, get_cities, get_city

JSON_MIME_TYPE = 'application/json; charset=UTF-8'
    
app = Flask(__name__)

@app.route('/countries/')
def countries():
    items = get_countries()
    resp = Response(response=json.dumps(items), status=200, mimetype=JSON_MIME_TYPE)
    return resp

@app.route('/country/<country_code>')
def country(country_code):
    c = get_country(country_code)
    if c != None:
        resp = Response(response=json.dumps(c), status=200, mimetype=JSON_MIME_TYPE)
    else:
        resp = Response(response=json.dumps({}), status=404, mimetype=JSON_MIME_TYPE)
    return resp

@app.route('/capitals')
def cities():
    items = get_cities()
    resp = Response(response=json.dumps(items), status=200, mimetype=JSON_MIME_TYPE)
    return resp

@app.route('/capital/<city_id>')    
def city(city_id):
    c = get_city(city_id)
    if c != None:
        resp = Response(response=json.dumps(c), status=200, mimetype=JSON_MIME_TYPE)
    else:
        resp = Response(response=json.dumps({}), status=404, mimetype=JSON_MIME_TYPE)
    return resp

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=True)
