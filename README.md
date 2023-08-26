# Fantasy Premier League Database
Code for scraping a sports results website and creating a SQL database to store the information.

![](https://github.com/NavierPy/fpl-database/assets/45111622/d22f5693-a6a5-4c6e-b333-41bc7aaa1bde)


## Requirements

First, download or clone the repository using:

 ```
git clone https://github.com/NavierPy/fpl-database.git
 ```
Next, install all required Python dependencies:

 ```
pip install -r requirements.txt
 ```
Finally, download and install PostgreSQL and then Postbird. The configuration used in this repository is:

 ```
Host: localhost
Port: 5432
Dbname: postgres
User: postgres
Password: postgres
 ```

## How to use

* Open main.py and set the number of days you want to collect using the variable j (e.g. j=3), then run the file.
* Open Postbird and connect to your database. Voilá! It is already populated with the requested information.

## Missing features

* Implement the necessary changes to be able to update an existing database. Specifically, allow to set from which day to start collecting information (for example: from 3 to 7), implement a try-except for the line that creates the 4 tables and add auto-increment for all ids.
