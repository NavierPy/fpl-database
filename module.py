from bs4 import BeautifulSoup
import requests


     
    
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
