# Fantasy Premier League Database
Code for scraping a sports results website and creating a SQL database to store the information.


![](https://github.com/NavierPy/fpl-database/assets/45111622/d22f5693-a6a5-4c6e-b333-41bc7aaa1bde)

## Includes

* The main file you need to build the database (main.py).
* A __Jupyter Notebook__ with a brief step-by-step code development (jupyter_notebook.ipynb).
* Script that solves the __knapsack problem__ for a given formation and budget (knapsack_problem.py).
* An example of the database updated to an arbitrary date (db_xxxxxx.sql).

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

* Open main.py and set the first and last matchdays for which you want to collect the data.
* Run the file.
* Your database is now complete with the required information, open Postbird to check it.

After this, you can solve the knapsack problem for a given formation and budget:

* Open knapsack_problem.py, navigate to the end of the file and in the line where it says "result = solve_problem(352, 40E6)" replace the "352" by your desired alignment (for example: for 3-3-4, type 334) and the "40E6" by your budget (you can do it in scientific notation, for example: for 10 million, type 10E6).

## Missing features

* Implement a user interface.
