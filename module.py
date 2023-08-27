from bs4 import BeautifulSoup
import requests
from unidecode import unidecode
from db_functions import query, create_tables
import pandas as pd
from knapsack_problem import solve_problem, create_dataframe
 
    
def scrapear(j):
    link = 'https://www.jornadaperfecta.com/premier/puntos/?idJornada={}'.format(j)
    webpage_response = requests.get(link)
    webpage = webpage_response.content
    soup = BeautifulSoup(webpage, "html.parser")
          
    partidos = soup.find_all("div", {"class": "puntos-partido"})
    equipos = soup.find_all("div", {"class": "col-6-12 mobile-col-6-12"})
    
    return(partidos, equipos)




def recabar(j):
    
    partidos, equipos = scrapear(j)
        
    lista_clubes = []
    lista_encuentros =  []
    
    for partido in partidos:

        
        marcador = (partido.find_all("span", {"class": "puntos-resultado-marcador"})[0].text, partido.find_all("span", {"class": "puntos-resultado-marcador"})[1].text)
 
        local = partido.find("div", itemprop="homeTeam").find(itemprop="name")["content"]
        visitante = partido.find("div", itemprop="awayTeam").find(itemprop="name")["content"]
        
        lista_clubes.extend([local, visitante])
        lista_encuentros.append((j, local, visitante, marcador))
    
    # Inicializamos algunas listas y la variable n para ir alternando oponentes:
    lista_jugadores=[]
    n=0
    
    # Entramos en cada equipo:
    for equipo in equipos:
        
        # Utilizamos BeautifulSoup para buscar la tabla de cada jugador:
        jugadores = equipo.find_all("div", {"class": "puntos-jugador"})
        
        # Entramos en cada jugador:
        for jugador in jugadores:
            
            # Utilizamos BeautifulSoup para buscar las etiquetas relevantes:
            posicion = str(jugador.find("div", {"class": "jugador-posicion"}).text)
            puntuacion = str(jugador.find("div", {"class": "puntos-jugador-puntuacion"}).text)
            nombre = str(jugador.find("a", itemprop="url").text)
            eventos = [icon.get("title") for icon in jugador.find_all("i", {"class": "icon"})]
  
            club = lista_clubes[equipos.index(equipo)]
            oponente = lista_clubes[equipos.index(equipo)+(-1)**n]      
            localidad = "local" if lista_clubes.index(club) % 2 == 0 else "visitante"
    
            # Añadimos el registro del jugador a la lista de jugadores:
            lista_jugadores.append([j, nombre, posicion, puntuacion, club, oponente, localidad, eventos])

        n+=1   # Este índice sirve para alternar oponentes
    

    return(lista_jugadores, lista_encuentros, lista_clubes)




def recabar_precio(nombre):
    
    jugador = unidecode(nombre).lower().replace(' ', '-').replace("'", "")
    if jugador=='gross': jugador='gros'   # Por un error de trasliteración de la página ("ß" debería ser "ss", no "s")
        
    link = 'https://www.jornadaperfecta.com/premier/jugador/{}'.format(jugador)
           
    webpage_response = requests.get(link)
    webpage = webpage_response.content
    soup = BeautifulSoup(webpage, "html.parser")
          
    historial = soup.find("div", {"class": "column-jp w-50 center mr-12 card fixed"})
        
    precio = historial.text.split()[-1].replace('.', '').replace('€', '')
    
    return(precio)

    


def create_dataframes(j0, jf):
    
    ### Se recaba la información y se almacena en 3 dataframes: 

    jugadores, encuentros, lista_equipos = [], [], []
    
    for i in range(j0,jf+1):
        jugadores_i, encuentros_i, lista_equipos = recabar(i)
        
        jugadores.extend(jugadores_i)
        encuentros.extend(encuentros_i)
    
    jugadores_df = pd.DataFrame(jugadores, columns=["Jornada", "Nombre", "Posición", "Puntos", "Equipo", "Oponente", "Juega", "Eventos"])
    encuentros_df = pd.DataFrame(encuentros,  columns =['Jornada', 'Equipo local','Equipo visitante', 'Resultado'])
    
    return(jugadores_df, encuentros_df, lista_equipos)



    
def actualizar_tablas(j0, jf):
    
    jugadores_df, encuentros_df, lista_equipos = create_dataframes(j0, jf)

    try:
        create_tables()
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
            precio = recabar_precio(nombre)
        except:
            precio = None
        
        valores_jugadores = (nombre, equipo, posicion, precio)
    
        try:
            query(jugadores_string, valores_jugadores)
        except:
            pass
      
        valores_resultados = (nombre, j, puntos, goles, asistencias, tarjetas_amarillas, tarjetas_rojas)    
           
        try:
            query(resultados_string, valores_resultados) 
        except:
            pass
    
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
        try:
            query(partidos_string, valores_partidos)
        except:
            pass
        
        


def actualizar_precios():
    
    consulta = "SELECT MAX(jornada) FROM partidos"
    jf = query(consulta)[0][0]

    jugadores_df, encuentros_df, lista_equipos = create_dataframes(1, jf)
    
    for index, row in jugadores_df.iterrows():
        j, nombre, posicion, puntos, equipo, equipo_rival, localidad, eventos = list(row)
        try:
            precio = recabar_precio(nombre) # Comenta esta línea para evitar saturar el servidor
            # precio = 0 # Descomenta esta línea para evitar saturar el servidor
        except:
            precio = None         
        
        string = """
        UPDATE jugadores
        SET precio = %s
        WHERE nombre = %s
        """
        
        valores = (precio, nombre)
        
        query(string, valores)
        



def once_ideal(presupuesto, data=create_dataframe().dropna(subset=['value'])):
    
    alineaciones = [343, 352, 433, 442, 451, 532, 541, 361, 334, 424, 460, 523]
    
    puntuaciones = []
    for alineacion in alineaciones:
        puntuaciones.append(solve_problem(alineacion, presupuesto, data)[0])
        
    
    ganadora = alineaciones[puntuaciones.index(max(puntuaciones))]
    
    puntuacion_total, precio_total, fo, data_df = solve_problem(ganadora, presupuesto, data)
    
    print(data_df)
    print("")
    print("Alineación:", '-'.join(fo))
    print("Precio total:", precio_total)
    print("Puntuación total:", round(puntuacion_total,0))
