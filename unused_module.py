from bs4 import BeautifulSoup
import requests
from unidecode import unidecode


def recabar_historial_precios(nombre):
    jugador = unidecode(nombre).lower().replace(' ', '-').replace("'", "")
    if jugador=='gross': jugador='gros'   # Por un error de trasliteración de la página: "ß" debería ser "ss", no "s"

    dias = [0, 1, 2, 3, 5, 10, 14, 30]
    print(jugador)
    link = 'https://www.jornadaperfecta.com/premier/jugador/{}'.format(jugador)
           
    webpage_response = requests.get(link)
    webpage = webpage_response.content
    soup = BeautifulSoup(webpage, "html.parser")
          
    historial = soup.find("div", {"class": "column-jp full-width center p-8 card fixed-prices market-container"})
    
    filas = (historial.find_all("div", {"class": "row-jp full-width space-between p-4 separator"}))
    
    precios = []
    
    for h in filas:
        precio = h.find("div", {"class": "row-jp"}).find_all("div")[-1].text
        precios.append(int(precio.replace('.', '').replace('€', '')))

    try:
        h = (historial.find_all("div", {"class": "row-jp full-width space-between p-4"}))[0]
        precio = h.find("div", {"class": "row-jp"}).find_all("div")[-1].text
        precios.append(int(precio.replace('.', '').replace('€', '')))
    except:
        pass
    
    return(dias, precios)