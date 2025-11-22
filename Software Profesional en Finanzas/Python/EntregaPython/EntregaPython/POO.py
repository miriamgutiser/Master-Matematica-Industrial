from math import sqrt

class Punto:
    
    def __init__(self, x=0 , y=0):
        self.mover(x,y)
        self.__nombre = "sin_nombre"  # Se añade para evitar error en get_nombre()
        
    def __color_punto(self):
        print('rojo')
        
    def get_nombre(self):
        return self.__nombre
    
    def mover(self, x, y):
        self.x = x
        self.y = y
        
    def __add__(self, p):
        p_1 = Punto()
        p_1.x = self.x + p.x
        p_1.y = self.y + p.y 
        return p_1
    
    def to_string(self):
        return 'Punto(' + str(self.x) + ',' + str(self.y) + ')'
    
    def print_punto(self):
        print('Punto('+str(self.x)+','+str(self.y)+')')
        
    def calcular_distancia(self, p2):
        return sqrt((self.x - p2.x)**2 + (self.y - p2.y)**2)


class Linea:
    def __init__(self, inicio, fin):
        self.inicio = inicio
        self.fin = fin
        
    def imprimir_extremos(self):
        print('Inicio =', self.inicio.to_string())
        print('Fin =', self.fin.to_string())
        
    def cambiar_inicio(self, nuevo_inicio):
        self.inicio = nuevo_inicio
        
    def cambiar_fin(self, nuevo_fin):
        self.fin = nuevo_fin
        
    def __add__(self, otra_linea):
        nuevo_inicio = self.inicio + otra_linea.inicio
        nuevo_fin = self.fin + otra_linea.fin
        return Linea(nuevo_inicio, nuevo_fin)
    
    def print_linea(self):
      print('Linea(' + self.inicio.to_string() + ', ' + self.fin.to_string() + ')')


# Ejemplo de uso
p1 = Punto(0,0)
p2 = Punto(1,1)
l1 = Linea(p1,p2)

l1.print_linea()

p3 = Punto(0,1)
p4 = Punto(1,0)
l2 = Linea(p3,p4)

l2.print_linea()

l3 = l1 + l2  # Linea((0,1), (2,1))
print('Resultado suma de l1 y l2:')
l3.print_linea()

print('Extremos de la linea l1:')
l1.imprimir_extremos()
