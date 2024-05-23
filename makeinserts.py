import sys
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

table_names = ['city', 'city_name', 'country', 'country_name', 
               'union_name', 'membership']

def make_sql(sql_filename):
    sql_lines = []  # collect all the SQL lines to write

    sql_lines.append('PRAGMA foreign_keys=ON;')

    for table_name in table_names:
        csv_filename = table_name + '.csv'

        sql_lines.append(f'-- {csv_filename}')

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
                            if column == 'NULL':
                                final_row.append('NULL')
                            else:
                                final_row.append(f"'{column}'")
                    values = ', '.join(final_row)
                    statement = (f'INSERT INTO {table_name} ({column_names}) VALUES({values});')
                    sql_lines.append(statement)
                    line_count += 1
    
    with open(sql_filename, 'w', encoding='utf-8') as sql_file:
        for line in sql_lines:
            sql_file.write(line + '\n')

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('usage: python makeinserts.py sqlfilename')
        sys.exit(-1)

    make_sql(sys.argv[1])
