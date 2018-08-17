# EU Member Country Data

This repository contains some data files and utilities related to the member
countries of the European Union.

While every attempt has been made to ensure that the data is correct,
there may be errors. Use these data at your own risk.

Some of the data originates from the European Union website, mainly the
[EU Member Countries](http://europa.eu/about-eu/countries/member-countries/index_en.htm) 
page (copyright © European Union, 1995-2016).

## Data format

The raw data is in CSV files, in the UTF-8 character encoding.
As per [RFC 4180](https://tools.ietf.org/html/rfc4180),
the files use a CR LF line delimiter. They also have a header row,
used to indicate database column names for further use.

The `country_code` column values are the ISO 3166-1 Alpha-2 codes of the countries,
with the following exceptions due to common usage by the European Commission: 
Greece is represented with `EL`instead of `GR`, and the United Kingdom is
represented with `GB` instead of `UK`.
 
The `language_code` column values are the ISO 639-1 Alpha-2 codes of the languages.

## Database creation

You can use the `eumemberdata.sql` script to create an SQLite 3 database.
However, the script does not populate the database -- I'm working on a 
Python script to do that, based on the CSV data files.

On OS X, the `sqlite3` utility is already on your system. To create the
database, open a shell with Terminal and issue the command

`sqlite3 eumemberdata.sqlite3`

This starts up the SQLite console, where you can read and execute the 
database definition statements from `eumemberdata.sql`, like so:

`.read eumemberdata.sql`

After executing the SQL, you can issue the `.schema` command to check that
the database tables have been created. You should see more or less the
same as in `eumemberdata.sql` (minus the comments).

Enter the `.quit` command to return to the shell.

## Populating the database

Use the Python script `populate.py` to add rows to the database:

`python3 populate.py`

The script requires Python 3.

When you open the database file again, you should be able to make queries
against the data:

```
$ sqlite3 eumemberdata.sqlite3
SQLite version 3.8.5 2014-08-15 22:37:57
Enter ".help" for usage hints.
sqlite> select country_code, population from country;
AT|8507786
BE|11203992
BG|7245677
.
.
.
```

## JSON output

To use the EU member data in a mobile application, the aim is to make
a JSON file with the following format:

```json
{"countries":[
    {
      "code": "FI",
      "name": {
        "en": "Finland",
        "fi": "Suomi"
      },
      "capital": {
        "name": {
          "en": "Helsinki",
          "fi": "Helsinki"
        },
        "coordinate": {
          "longitude": 24.9375,
          "latitude": 60.1708
        }
      },
      "area": 338435,
      "population": {
        "population": 5451270,
        "year": 2014
      },
      "currency": "EUR",
      "joined": {
        "union": "1995-01-01",
        "euro": "1999-01-01",
        "schengen": "2001-03-25"
      }
    }
]}
```

The above sample is abbreviated; the final JSON should include names for
the countries and cities in all the languages.

Use the Python script `generate.py` to generate a JSON document with
all the information in the database.

## REST API

The data is also available as a REST API at https://eumemberdata.herokuapp.com.

# Deploying to Heroku

Create a Heroku app as described in the Heroku Dev Center notes for Python at https://devcenter.heroku.com/categories/python-support.

For example, the REST API app was created with the Heroku CLI like this:

$ heroku apps:create eumemberdata --region eu

Prepare for deployment by creating a Procfile, installing the required libraries
into your Python virtual environment, and collecting the
libraries into requirements.txt with pip.

# Preparing the PostgreSQL database

The SQLite database is intended for mobile apps. In Heroku web apps SQLite is not an option for the database, since it requires a persistent database file. Instead, you can use the Heroku PostgreSQL add-on.

The database for the REST API was created with:

$ heroku addons:create heroku-postgresql:hobby-dev

Heroku saves the URL of the database into your app as the HEROKU_DATABASE_BRONZE_URL
environment variable. The REST API app refers to this value.
