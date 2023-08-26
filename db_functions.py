import psycopg2

def query(peticion, valores=False):
    # Conecta a una base de datos existente
    conn = psycopg2.connect(dbname="postgres", user="postgres", password="postgres", port='5432')
    
    # Inicializa un cursor para realizar las operaciones
    cur = conn.cursor()
    
    # Ejecuta la petición
    if not valores:
        cur.execute(peticion)
    else:
        cur.execute(peticion, valores)
    
    # Hace que los cambios sean persistentes
    conn.commit()
    
    # Termina la comunicación con la base de datos
    cur.close()
    conn.close()



def create_tables():
    
    first_table = """
    CREATE TABLE equipos (
      id SERIAL PRIMARY KEY,
      nombre varchar UNIQUE NOT NULL
    
    );
    """
    
    second_table = """
    CREATE TABLE jugadores (
      id SERIAL PRIMARY KEY,
      nombre varchar UNIQUE NOT NULL,
      equipo varchar REFERENCES equipos(nombre),
      posicion varchar
    
    );
    """
    
    third_table = """
    CREATE TABLE partidos (
      id SERIAL PRIMARY KEY,
      jornada integer,
      local varchar REFERENCES equipos(nombre),
      visitante varchar REFERENCES equipos(nombre),
      goles_local integer,
      goles_visitante integer
    
    );
    """
    
    four_table = """
    CREATE TABLE resultados (
      id SERIAL PRIMARY KEY,
      jugador varchar REFERENCES jugadores(nombre) NOT NULL,
      jornada integer,
      puntos integer,
      goles integer,
      asistencias integer,
      tarjetas_amarillas integer,
      tarjetas_rojas integer
    
    );
    """
    
    query(first_table)
    query(second_table)
    query(third_table)
    query(four_table)

