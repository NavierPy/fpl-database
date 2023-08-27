from module import actualizar_tablas, once_ideal
import pandas as pd
from db_functions import query, create_tables
from knapsack_problem import solve_problem
from knapsack_problem_GUI import run_gui

j0 = 3  # Primera jornada a recabar
jf = 3  # Última jornada a recabar

# Descomentar esta línea para actualizar la base de datos:
# actualizar_tablas(j0, jf)

# Descomentar estas líneas para calcular el once ideal previsto para un presupuesto dado:
# presupuesto = 40E6 
# once_ideal(presupuesto)

# Descomentar esta línea para calcular el once ideal de un subconjunto de jugadores a elegir, para un presupuesto dado:
# run_gui()

