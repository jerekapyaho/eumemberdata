import os
import psycopg2

DATABASE_URL = os.environ['HEROKU_POSTGRESQL_BRONZE_URL']

def write_blob(doc_id, name, path_to_file):
    conn = None
    try:
        doc = open(path_to_file, 'rb').read()
        conn = psycopg2.connect(DATABASE_URL, sslmode='require')
        # create a new cursor object
        cur = conn.cursor()
        # execute the INSERT statement
        cur.execute("INSERT INTO certificate(id, name, document) " +
                    "VALUES(%s,%s,%s)",
                    (doc_id, name, psycopg2.Binary(doc)))
        # commit the changes to the database
        conn.commit()
        # close the communication with the PostgresQL database
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

if __name__ == '__main__':
    certificates = [
        {'doc_id': '8fc29741-d67a-4d5f-9e1b-234a1fbc7155', 'name': 'Jussi Heikkola'},
        {'doc_id': '8001f2d9-10e9-4027-b590-91ceb0abe887', 'name': 'Pertti Husu'},
        {'doc_id': '8d2a162b-63bb-466f-92dc-fd7f37bc79d6', 'name': 'Riku Wikman'},
        {'doc_id': 'a74dee44-14e9-451c-beab-9424fa21f971', 'name': 'Tuuli Kähkönen'}
    ]

    for c in certificates:
        write_blob(c['doc_id'], c['name'], c['doc_id'] + '.pdf')
