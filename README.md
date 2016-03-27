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
AT|8507786.0
BE|11203992.0
BG|7245677.0
.
.
.
```

## JSON output

To use the EU member data in a mobile application, the aim is to make
a JSON file with the following format:

```json
{"countries":[
    {"code": "FI", 
     "name": {"en": "Finland", "fi": "Suomi"},
     "area": 338435,
     "population": {"value": 5451270, "year": 2014},
     "capital": {"name": {"en": "Helsinki", "fi": "Helsinki"},
                 "coordinates":{"latitude":60.1708, "longitude": 24.9375}},
     "joined": {"union": 1995, "eurozone": 1999, "schengen": 1996}},
.
.
.     
]}
```
