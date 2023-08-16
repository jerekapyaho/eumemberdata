import csv

def is_integer(n):
    try:
        float(n)
    except ValueError:
        return False
    else:
        return float(n).is_integer()

def is_float(n):
    try:
        float(n)
    except ValueError:
        return False
    else:
        return True

table_names = ['city', 'city_name', 'country', 'country_name', 'union_name', 'membership']

print('PRAGMA foreign_keys=ON;')

for table_name in table_names:
    csv_filename = table_name + '.csv'

    print('-- %s' % csv_filename)

    with open(csv_filename, encoding='utf-8') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')

        column_names = []
        line_count = 0
        for row in csv_reader:
            values = ''
            if line_count == 0:
                column_names = ', '.join(row)
                line_count += 1
            else:
                final_row = []
                for column in row:
                    if is_integer(column) or is_float(column):
                        final_row.append(str(column))
                    else:
                        if column != '':
                            final_row.append(f"'{column}'")
                        else:
                            final_row.append('NULL')
                values = ', '.join(final_row)
                statement = (f'INSERT INTO {table_name} ({column_names}) VALUES({values});')
                print(statement)
                line_count += 1
