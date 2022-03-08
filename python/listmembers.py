import sys
import sqlite3

def load_country_names(db_name, language):
    con = sqlite3.connect(db_name)
    cur = con.cursor()

    cur.execute("SELECT country_code, name FROM country_name WHERE language_code = '%s'" % (language))

    names = {row[0]: row[1] for row in cur.fetchall()}

    cur.close()
    con.close()

    return names

def load_members(db_name):
    con = sqlite3.connect(db_name)
    cur = con.cursor()

    cur.execute("SELECT country_code, exit_date FROM membership")
    rows = cur.fetchall()

    members = [row[0] for row in rows if row[1] == '']

    cur.close()
    con.close()

    return members

if __name__ == '__main__':
    if len(sys.argv) < 2: #
        print('Need at least the SQLite database file name.')
        sys.exit(-1)

    db_name = sys.argv[1]

    names = load_country_names(db_name, 'en')
    members = load_members(db_name)

    member_names_sorted = sorted([names[member] for member in members])

    print(f'Current members of the EU ({len(members)} countries):')
    for member_name in member_names_sorted:
        print(f'{member_name}')
