from pulp import *
from knapsack_problem import create_dataframe, solve_problem
from module import actualizar_estos_precios, once_ideal
import pandas as pd
import tkinter as tk
from tkinter import ttk
import pickle


def load_list():
    try:
        with open("players_list.pickle", "rb") as file:
            selected_players = pickle.load(file)
            return(selected_players)
    except FileNotFoundError:
        print("No existing players list found.")
        
  
        
class KnapsackApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Football Team Selection")
        self.root.geometry("1000x600")
        self.selected_players = []
        data = create_dataframe()
        self.original_data = data.dropna(subset=['value'])
        self.df = pd.DataFrame(self.original_data)
        self.sorting_order = {}  # Almacenar el orden actual
        
        self.create_widgets()

    def create_widgets(self):
        # Barra de búsqueda
        self.search_var = tk.StringVar()
        self.search_var.trace("w", self.update_search)
        self.search_entry = tk.Entry(self.root, textvariable=self.search_var, width=30)
        self.search_entry.pack(pady=10)
        
        # Marco para los botones
        self.button_frame = tk.Frame(self.root)
        self.button_frame.pack()
        
        # Botones para cargar y guardar listas
        self.load_button = tk.Button(self.button_frame, text="Load Players List", command=self.load_players)
        self.load_button.pack(side="left", padx=5)
        
        self.save_button = tk.Button(self.button_frame, text="Save Selected Players", command=self.save_players)
        self.save_button.pack(side="left", padx=5)
                
        # Tabla para mostrar el DataFrame
        self.tree_frame = tk.Frame(self.root)
        self.tree_frame.pack(fill="both", expand=True)
        
        self.tree = ttk.Treeview(self.tree_frame, show="headings")
        self.tree["columns"] = ("name", "team", "position", "value", "points")
        self.tree.heading("name", text="Name", command=lambda: self.sort_column("name"))
        self.tree.heading("team", text="Team", command=lambda: self.sort_column("team"))
        self.tree.heading("position", text="Position", command=lambda: self.sort_column("position"))
        self.tree.heading("value", text="Value", command=lambda: self.sort_column("value"))
        self.tree.heading("points", text="Points", command=lambda: self.sort_column("points"))
        
        for col in self.tree["columns"]:
            self.tree.column(col, anchor="center")
            
        # Scrollbar
        self.tree_scroll = tk.Scrollbar(self.tree_frame, orient="vertical", command=self.tree.yview)
        self.tree.configure(yscrollcommand=self.tree_scroll.set)
        
        self.tree_scroll.pack(side="right", fill="y")
        self.tree.pack(side="left", fill="both", expand=True)
        
        self.update_tree()
        
        self.select_button = tk.Button(self.root, text="Select Players", command=self.select_players)
        self.select_button.pack()

    def sort_column(self, col_name):
        if col_name in self.sorting_order and self.sorting_order[col_name] == "ascend":
            self.df = self.df.sort_values(by=col_name, ascending=False)
            self.sorting_order[col_name] = "descend"
        else:
            self.df = self.df.sort_values(by=col_name)
            self.sorting_order[col_name] = "ascend"
            
        self.update_tree()
    
    def update_tree(self):
        self.tree.delete(*self.tree.get_children())
        for index, row in self.df.iterrows():
            rounded_points = round(row["points"], 1)
            self.tree.insert("", "end", values=(row["name"], row["team"], row["position"], row["value"], rounded_points))
    
    def update_search(self, *args):
        query = self.search_var.get()
        if query:
            filtered_df = self.df.apply(lambda row: row.astype(str).str.contains(query, case=False).any(), axis=1)
            filtered_df = self.df[filtered_df]
            self.df = filtered_df
        else:
            self.df = self.original_data
        
        self.update_tree()
    
    def select_players(self):
        for item in self.tree.selection():
            values = self.tree.item(item, "values")
            player_name = values[0]
            if player_name in self.selected_players:
                self.selected_players.remove(player_name)
            else:
                self.selected_players.append(player_name)
        
        print("Jugadores seleccionados:", self.selected_players)
    
    def load_players(self):
        try:
            with open("players_list.pickle", "rb") as file:
                self.selected_players = pickle.load(file)
                print("Lista cargada:", self.selected_players)
        except FileNotFoundError:
            print("No se ha encontrado ninguna lista.")

    def save_players(self):
        with open("players_list.pickle", "wb") as file:
            pickle.dump(self.selected_players, file)
            print("Lista guardada.")
     
            
     
def run_gui():
    root = tk.Tk()
    app = KnapsackApp(root)
    root.mainloop()

    print("---")
    subset = load_list()
    print(subset)
    print("---")
    
    actualizar_estos_precios(subset)
    
    data = create_dataframe()


    presupuesto = float(input("¿Cuál es el presupuesto? :"))

    once_ideal(presupuesto, data[data['name'].isin(subset)])
    
    # solution = solve_problem(343, presupuesto, data[data['name'].isin(subset)])
    
