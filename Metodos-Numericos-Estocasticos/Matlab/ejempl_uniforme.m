%ejemplo para llamar a box_muller con mu = 3 y sigma = 2
clc
clear all
muestra = box_muller(3, 2, 1000);
histogram(muestra)

