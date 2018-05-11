import sqlite3
import json
import argparse

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
country_joins = {}  # key is country code, value is dictionary of join dates
for country_code in country_codes:
    names_statement = 'SELECT language_code, name FROM country_name WHERE country_code = "%s"' % country_code
    names = {}
    for name in c.execute(names_statement):
        names[name[0]] = name[1]
    country_names[country_code] = names

    joins_statement = 'SELECT country_code, union_date, euro_date, schengen_date FROM membership WHERE country_code = "%s"' % country_code
    joins = {}
    for join in c.execute(joins_statement):
        joins['union'] = join[1]
        joins['euro'] = join[2]
        joins['schengen'] = join[3]
    country_joins[country_code] = joins

countries = []
for country in c.execute('SELECT country_code, capital, area, population, population_year, currency_code, national_day FROM country'):
    country_code = country[0]
    country_dict = {'code': country_code,
                    'name': country_names[country_code], 
                    'capital': cities[country[1]],
                    'area': country[2], 
                    'population': {'population': country[3], 'year': country[4]},
                    'currency': country[5],
                    'joined': country_joins[country_code]}
    countries.append(country_dict)

def swift_source():
    def city_source(city):
        return ''
    src = ''

    return src

    
def kotlin_source():
    pass

def main(output_type):
    if output_type == 'json':
        print(json.dumps(countries))
    elif output_type == 'swift':
        print('Generating Swift source code.')
        print(swift_source())
    elif output_type == 'kotlin':
        print('Generating Kotlin source code.')
    else:
        print('Unknown output type "%s"' % output_type)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Generate JSON or source code.')
    parser.add_argument('--output', required=True, help="Output type: json | swift | kotlin", default='json')
    args = parser.parse_args()
    main(args.output)
