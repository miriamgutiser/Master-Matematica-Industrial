%Comparación entre los intervalos de confianza con variables antiteticas y
%no antiteticas con 1000 realizaciones
[mu_anti, IC_anti] = antiteticas(1000)
[mu_norm, IC_norm] = estimar_esperanza(1000)
