import os
import logging

import psycopg2

DATABASE_URL = os.environ['HEROKU_POSTGRESQL_BRONZE_URL']

def get_certificate(cert_id):
    conn = None
    doc = None
    try:
        conn = psycopg2.connect(DATABASE_URL, sslmode='require')
        # create a new cursor object
        cur = conn.cursor()
        # execute the SELECT statement
        cur.execute(""" SELECT document
                        FROM certificate
                        WHERE id = %s """,
                    (cert_id,))
 
        doc = bytes(cur.fetchone())  # turn a memory view into bytes

        # close the communication with the PostgresQL database
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
    return doc  # return just the document
