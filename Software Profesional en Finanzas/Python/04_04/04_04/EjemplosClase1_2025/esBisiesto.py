

def esBisiesto(year):
    if (type(year) is int and year>0):
        if (year%4==0 and year%100!=0 or year%400==0):
            print("El año es bisiesto")
           # return 1
        else:
            print("El año no es bisiesto")
            #return 0
    else:
        print("El tipo de dato introducido no es correcto")
        


