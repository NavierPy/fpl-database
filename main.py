import module
import pandas as pd
from db_functions import query, create_tables

### Se recaba la información y se almacena en 3 dataframes: 
    
j=2 # Número de jornadas a recabar

jugadores, encuentros, lista_equipos = [], [], []

for i in range(1,j+1):
    jugadores_i, encuentros_i, lista_equipos = module.recabar(i)
    
    jugadores.extend(jugadores_i)
    encuentros.extend(encuentros_i)

jugadores_df = pd.DataFrame(jugadores, columns=["Jornada", "Nombre", "Posición", "Puntos", "Equipo", "Oponente", "Juega", "Eventos"])
encuentros_df = pd.DataFrame(encuentros,  columns =['Jornada', 'Equipo local','Equipo visitante', 'Resultado'])

 
### Se generan las tres tablas: 
create_tables() # Comentar esta línea si solo se está actualizando la base de datos


### Añadimos los registros a la base de datos:

# Los equipos:

equipos_string = """
INSERT INTO equipos (id, nombre)
VALUES (%s, %s);
"""

i=1
for equipo in lista_equipos:
    query(equipos_string, (i, equipo))   
    i+=1

# Los jugadores y los resultados:
    
jugadores_string = """
INSERT INTO jugadores (id, nombre, equipo, posicion)
VALUES (%s, %s, %s, %s);
"""
resultados_string = """
INSERT INTO resultados (id, jugador, jornada, puntos, goles, asistencias, tarjetas_amarillas, tarjetas_rojas)
VALUES (%s, %s, %s, %s, %s, %s, %s, %s);
"""

i=1

for index, row in jugadores_df.iterrows():
    j, nombre, posicion, puntos, equipo, equipo_rival, localidad, eventos = list(row)
    
    goles = eventos.count("Gol")
    asistencias = eventos.count("Asistencia")
    tarjetas_amarillas = eventos.count("Tarjeta amarilla")
    tarjetas_rojas = eventos.count("Tarjeta roja")

    valores_jugadores = (i, nombre, equipo, posicion)
    valores_resultados = (i, nombre, j, puntos, goles, asistencias, tarjetas_amarillas, tarjetas_rojas)
    i+=1
    
    try:
        query(jugadores_string, valores_jugadores)
    except:
        pass
    
    query(resultados_string, valores_resultados)    
    
# Los partidos: 
    
partidos_string = """
INSERT INTO partidos (id, jornada, local, visitante, goles_local, goles_visitante)
VALUES (%s, %s, %s, %s, %s, %s);
"""

partidos_string_missingdata = """
INSERT INTO partidos (id, jornada, local, visitante)
VALUES (%s, %s, %s, %s);
"""

i=1
for index, row in encuentros_df.iterrows():
    j, equipo_local, equipo_visitante, resultado = list(row)
    
    if not resultado[0]==resultado[1]=="-":
        valores_partidos = (i, j, equipo_local, equipo_visitante, resultado[0], resultado[1])
        i+=1
        
        query(partidos_string, valores_partidos)
    
    else:
        valores_partidos = (i, j, equipo_local, equipo_visitante)
        i+=1
        
        query(partidos_string_missingdata, valores_partidos)            
