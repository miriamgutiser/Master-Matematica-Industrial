# EJERCICIO 1

load("C:/Users/USUARIO/Desktop/Master/MBiomed/BioMed_2025/datos.10000randomGenes.2025.rda")  
ls()

dim(datosPractica.2025)
rownames(datosPractica.2025)[50]  
colnames(datosPractica.2025)[1:200]  

# Extraemos la fila 50 (CD44)
expresion <- as.numeric(datosPractica.2025[50, ])

# Construimos los factores "tejido" y "estado"
estado <- rep(c("Sano", "Cancer"), each = 20, times = 5)
tejido <- rep(c("Oseo", "Cerebral", "Mamario", "Adiposo", "Renal"), each = 40)

#  Creamos un data.frame 
df <- data.frame(
  expresion = expresion,
  tejido = factor(tejido),
  estado = factor(estado)
)

# Grafica
library(ggplot2)

ggplot(df, aes(x = tejido, y = expresion, fill = estado)) +
  geom_boxplot(position = position_dodge(0.8)) +
  labs(title = "Expresión del gen CD44 (204489_s_at)",
       x = "Tejido",
       y = "Nivel de expresión",
       fill = "Estado") +
  theme_minimal()

# EJERCICIO 2

# Ajustamos modelo ANOVA de dos factores 
modelo_cd44 <- aov(expresion ~ tejido * estado, data = df)


library(ggplot2)

# Gráfico de interacción: líneas de expresión media por tejido y estado
ggplot(df, aes(x = tejido, y = expresion, color = estado, group = estado)) +
  stat_summary(fun = mean, geom = "line", size = 1.2) +
  stat_summary(fun = mean, geom = "point", size = 3) +
  labs(title = "Expresión media del gen CD44 según tejido y estado",
       x = "Tejido",
       y = "Nivel de expresión",
       color = "Estado") +
  theme_minimal()

# EJERCICIO 3 - Tabla ANOVA

anova(modelo_cd44)

# EJERCICIO 4

pvalores_estado <- numeric(nrow(datosPractica.2025))  # 10,000

for (i in 1:nrow(datosPractica.2025)) {
  expresion <- as.numeric(datosPractica.2025[i, ])
  df <- data.frame(expresion = expresion,
                   tejido = factor(tejido),
                   estado = factor(estado))
  
  modelo <- aov(expresion ~ tejido * estado, data = df)
  resumen <- summary(modelo)
  
  pvalores_estado[i] <- resumen[[1]]["estado", "Pr(>F)"]
}

# Contamos cuantos genes tienen p < 0.05
sum(pvalores_estado < 0.05)
