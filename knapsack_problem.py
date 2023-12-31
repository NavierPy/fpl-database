import psycopg2
import pandas as pd
from db_functions import query
from pulp import LpVariable, LpProblem, LpMaximize, lpSum


def promedio(jugador):
    
    consulta = """
        SELECT AVG(puntos) 
        FROM resultados 
        WHERE jugador = %s
    """
    
    resultado = query(consulta, (jugador,))

    try:
        return(float(resultado[0][0]))
    except:
        return(0)
    
    

def create_dataframe():
    
    factor = """ (
                   SELECT COUNT(*)
                   FROM resultados
                   WHERE jugador = j.nombre
               ) / (
                   SELECT MAX(jornada)
                   FROM resultados
               ) """
    
    # Set factor=1 if you do not want to take into account unplayed matches.
        
    # Consulta para obtener el nombre, equipo, posición, precio y puntuación promedio de todos los jugadores
    consulta = f"""
        SELECT j.nombre, j.equipo, j.posicion, j.precio, AVG(r.puntos) * {factor} as puntuacion_promedio
        FROM jugadores j
        JOIN resultados r ON j.nombre = r.jugador
        GROUP BY j.nombre, j.equipo, j.posicion, j.precio
    """
    
    # Obtener los resultados de la consulta y crear un DataFrame
    resultados = query(consulta)
    if resultados:
        columnas = ["name", "team", "position", "value", "points"]
        df = pd.DataFrame(resultados, columns=columnas)
        # Convertir el tipo de datos de las columnas
        try:
            df["points"] = df["points"].astype(float)
        except:
            pass
            
        return(df)
    else:
        print("No se encontraron resultados")
    


def solve_problem(formation, BUDGET, data=create_dataframe()):
    """
    Resuelve el "knapsack problem" para un equipo de fútbol en función de una formación y un presupuesto dados.

    Parámetros:
    - formation (int) --     Representa la alineación en formato DMF, donde D es el número de defensas,
                             M es el número de mediocentros y F es el número de delanteros. Por ejemplo: 334
    - BUDGET (int)    --     Presupuesto total disponible.

    Devuelve:
    - data_df (pandas.DataFrame) -- Un DataFrame con la información de los jugadores seleccionados, 
                                    incluyendo nombre, posición, puntuación y precio.
    """
    
    data.dropna(subset=['value'])  # Se eliminan los jugadores sin precio, pero no se imprime en pantalla para no saturar.
        
    fo = str(formation)

    # Variables auxiliares:
    POS = data.position.unique()
    pos_available = {
    
        'DL': int(fo[2]),
        'MC': int(fo[1]),
        'DF': int(fo[0]),
        'PT': 1,
        
    }
    
    # Inicializamos las variables:
    positions = [data.position[i] for i in data.index]
    prices = [data.value[i] for i in data.index]
    points = [data.points[i] for i in data.index]
    players = [LpVariable("player_" + str(i), cat="Binary") for i in data.index]
    
    # Inicializamos el problema:
    prob = LpProblem("Choices", LpMaximize)
    
    # Definimos la función objetivo:
    prob += lpSum(players[i] * points[i] for i in range(len(data))) # Objetivo
    
    # Definimos las restricciones:
    prob += lpSum(players[i] * prices[i] for i in range(len(data))) <= BUDGET # Límite presupuestario
    
    for pos in POS:
      prob += lpSum(players[i] for i in range(len(data)) if positions[i] == pos) <= pos_available[pos] # Restricción por la alineación
    
    # Resolvemos el problema:
    prob.solve()
    
    # Imprimimos el resultado:
    data_list = []
    precio_total, puntuacion_total = 0, 0
    for v in prob.variables():
      if v.varValue != 0:
        name = data.name[int(v.name.split("_")[1])]
        position = data.position[int(v.name.split("_")[1])]
        point = data.points[int(v.name.split("_")[1])]
        price = data.value[int(v.name.split("_")[1])]
        precio_total += price
        puntuacion_total += point
        data_list.append([name, position, round(point,1), price])
    
    data_df = pd.DataFrame(data_list, columns=["Nombre", "Posicion", "Puntuacion esperada", "Precio"])
    
    data_df['Posicion'] = pd.Categorical(data_df['Posicion'], categories=['PT', 'DF', 'MC', 'DL'], ordered=True)
    data_df = data_df.sort_values(by='Posicion')

    return(puntuacion_total, precio_total, fo, data_df)
    
