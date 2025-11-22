def fact(n):
    if type(n)!=int or n<0:
        return -1
    elif n==0:
        return 1
    else:
        return n*fact(n-1)