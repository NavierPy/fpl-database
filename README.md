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

* Collect information on player pricing history
* Implement knapsack problem solver
* Implement a user interface
