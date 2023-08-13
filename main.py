import module
import pandas as pd
from db_functions import query, create_tables

jugadores, encuentros, lista_equipos = module.recabar(1)
jugadores_df = pd.DataFrame(jugadores, columns=["Nombre", "Posición", "Puntos", "Equipo", "Oponente", "Juega", "Eventos"])
encuentros_df = pd.DataFrame(encuentros,  columns =['Equipo local','Equipo visitante', 'Resultado'])

 
# Descomentar para crear las tablas si hacen falta:
create_tables()

# Añadimos los registros a la base de datos:

equipos_string = """
INSERT INTO equipos (id, nombre)
VALUES (%s, %s);
"""


i=1
for equipo in lista_equipos:
    query(equipos_string, (i, equipo))   
    i+=1



jugadores_string = """
INSERT INTO jugadores (id, nombre, equipo, posicion)
VALUES (%s, %s, %s, %s);
"""
resultados_string = """
INSERT INTO resultados (id, jugador, jornada, puntos, goles, asistencias, tarjetas_amarillas, tarjetas_rojas)
VALUES (%s, %s, %s, %s, %s, %s, %s, %s);
"""


n=1
i=1
for j in range(1,n+1):
    for index, row in jugadores_df.iterrows():
        nombre, posicion, puntos, equipo, equipo_rival, localidad, eventos = list(row)
        
        goles = eventos.count("Gol")
        asistencias = eventos.count("Asistencia")
        tarjetas_amarillas = eventos.count("Tarjeta amarilla")
        tarjetas_rojas = eventos.count("Tarjeta roja")
        
        valores_jugadores = (i, nombre, equipo, posicion)
        valores_resultados = (i, nombre, j, puntos, goles, asistencias, tarjetas_amarillas, tarjetas_rojas)
        i+=1
        
        query(jugadores_string, valores_jugadores)
        query(resultados_string, valores_resultados)    
    


partidos_string = """
INSERT INTO partidos (id, jornada, local, visitante, goles_local, goles_visitante)
VALUES (%s, %s, %s, %s, %s, %s);
"""

partidos_string_missingdata = """
INSERT INTO partidos (id, jornada, local, visitante)
VALUES (%s, %s, %s, %s);
"""


i=1
for j in range(1,n+1):
    for index, row in encuentros_df.iterrows():
        equipo_local, equipo_visitante, resultado = list(row)
        
        if not resultado[0]==resultado[1]=="-":
            valores_partidos = (i, j, equipo_local, equipo_visitante, resultado[0], resultado[1])
            i+=1
            
            query(partidos_string, valores_partidos)
        
        else:
            valores_partidos = (i, j, equipo_local, equipo_visitante)
            i+=1
            
            query(partidos_string_missingdata, valores_partidos)            
