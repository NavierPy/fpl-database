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
* Uncomment the line that says "update_tables(j0, jf)".
* Your database is now complete with the required information, open Postbird to check it.

After this, you can solve the knapsack problem for a given formation and budget:

* Use "once_ideal(presupuesto)" to get the expected dream team among all premier league players and for the formation that maximizes the total points.
* Use "run_gui()" to do the same but with a subset of players from the league that you can choose via a graphical interface. In this case you will be asked via the console for your budget.

If you want to be able to fix the formation, in either case, you will have to make some small modifications to the code and use the function "solve_problem(formation, budget, players_dataframe)".

Please note that, in order to avoid overloading the provider's website with requests, when updating the database with a new matchday, only the prices of the players who played that matchday will be updated. To update the total number of players, use the "actualizar_precios()" function.

## Missing features

* Finish implementing the decision making flow in the user interface (and not in the terminal)..
