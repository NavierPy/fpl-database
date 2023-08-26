import module
import pandas as pd
from db_functions import query, create_tables



### Se recaba la información y se almacena en 3 dataframes: 
  
    
j0 = 1  # Primera jornada a recabar
jf = 3  # Última jornada a recabar

jugadores, encuentros, lista_equipos = [], [], []

for i in range(j0,jf+1):
    jugadores_i, encuentros_i, lista_equipos = module.recabar(i)
    
    jugadores.extend(jugadores_i)
    encuentros.extend(encuentros_i)

jugadores_df = pd.DataFrame(jugadores, columns=["Jornada", "Nombre", "Posición", "Puntos", "Equipo", "Oponente", "Juega", "Eventos"])
encuentros_df = pd.DataFrame(encuentros,  columns =['Jornada', 'Equipo local','Equipo visitante', 'Resultado'])

 
### Generamos las tres tablas:
    
    
try:
    create_tables() # Comentar esta línea si solo se está actualizando la base de datos
except:
    pass


### Añadimos los registros a la base de datos:

    
# Los equipos:

equipos_string = """
INSERT INTO equipos (nombre)
VALUES (%s);
"""

for equipo in lista_equipos:
    try: 
        query(equipos_string, (equipo,)) 
    except: 
        pass


# Los jugadores y los resultados:
    
jugadores_string = """
INSERT INTO jugadores (nombre, equipo, posicion, precio)
VALUES (%s, %s, %s, %s);
"""
resultados_string = """
INSERT INTO resultados (jugador, jornada, puntos, goles, asistencias, tarjetas_amarillas, tarjetas_rojas)
VALUES (%s, %s, %s, %s, %s, %s, %s);
"""

for index, row in jugadores_df.iterrows():
    j, nombre, posicion, puntos, equipo, equipo_rival, localidad, eventos = list(row)
    
    goles = eventos.count("Gol")
    asistencias = eventos.count("Asistencia")
    tarjetas_amarillas = eventos.count("Tarjeta amarilla")
    tarjetas_rojas = eventos.count("Tarjeta roja")
    
    try:
        precio = module.recabar_precio(nombre)
    except:
        precio = None
    
    valores_jugadores = (nombre, equipo, posicion, precio)

    try:
        query(jugadores_string, valores_jugadores)
    except:
        pass

    
    valores_resultados = (nombre, j, puntos, goles, asistencias, tarjetas_amarillas, tarjetas_rojas)    
    query(resultados_string, valores_resultados)    


# Los partidos: 
    
partidos_string = """
INSERT INTO partidos (jornada, local, visitante, goles_local, goles_visitante)
VALUES (%s, %s, %s, %s, %s);
"""

for index, row in encuentros_df.iterrows():
    j, equipo_local, equipo_visitante, resultado = list(row)
    
    if resultado[0]==resultado[1]=="-":
        resultado = (None, None)
        
    valores_partidos = (j, equipo_local, equipo_visitante, resultado[0], resultado[1])
    query(partidos_string, valores_partidos)
