import sqlite3
import json

language_codes = ['bg', 'cs', 'da', 'de', 'el', 'en', 'es', 'et', 'fi', 'fr', 'ga', 'hr', 'hu', 'it', 'lt', 'lv', 'mt', 'nl', 'pl', 'pt', 'ro', 'sk', 'sl', 'sv']
#print('Number of languages = %d' % len(language_codes))
 
db_filename = 'eumemberdata.sqlite3'
conn = sqlite3.connect(db_filename)
c = conn.cursor()

city_names = {}
for city in c.execute('SELECT city_id, language_code, name FROM city_name'):
    city_id, lang, name = city[0], city[1], city[2]
    city_names.setdefault(city_id, {})[lang] = name 
#print(city_names)

cities = {}
for city in c.execute('SELECT city_id, latitude, longitude FROM city'):
    city_id, latitude, longitude = city[0], city[1], city[2]

    city_dict = {'name': city_names[city_id], 
                 'coordinate': {'longitude': longitude, 'latitude': latitude}}
    cities[city_id] = city_dict
#print(cities)

country_codes = []
for country in c.execute('SELECT country_code FROM country'):
    country_codes.append(country[0])
#print('Country codes = %s' % country_codes)

country_names = {}
for country_code in country_codes:
    statement = 'SELECT language_code, name FROM country_name WHERE country_code = "%s"' % country_code
    
    names = {}
    for name in c.execute(statement):
        names[name[0]] = name[1]

    country_names[country_code] = names
    
countries = []
for country in c.execute('SELECT country_code, capital, area, population, population_year, currency_code, national_day FROM country'):
    country_dict = {'code': country[0],
                    'name': country_names[country[0]], 
                    'capital': cities[country[1]],
                    'area': country[2], 
                    'population': { 'population': country[3], 'year': country[4] }, 
                    'currency': country[5]}
    countries.append(country_dict)

data = {}
data['countries'] = countries

print(json.dumps(data))
