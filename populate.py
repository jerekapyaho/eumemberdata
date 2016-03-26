import sqlite3
import csv
from collections import namedtuple

db_filename = 'eumemberdata.sqlite3'
conn = sqlite3.connect(db_filename)

tables = ['country', 'country_name', 'city', 'city_name']

for table in tables:
    csv_filename = table + '.csv'
    print('Processing %s' % csv_filename)
    
    with open(csv_filename) as csv_file:
        csv_reader = csv.DictReader(csv_file)
        
        with sqlite3.connect(db_filename) as conn:
            cursor = conn.cursor()
            
            columns = ', '.join([column for column in csv_reader.fieldnames])
            values = ', '.join([':%s' % column for column in csv_reader.fieldnames])
            print(values)
            
            statement = 'insert into %s (%s) values (%s)' % (table, columns, values)
            print(statement)
            cursor.executemany(statement, csv_reader)
            
            conn.commit()
            cursor.close()
            
            
