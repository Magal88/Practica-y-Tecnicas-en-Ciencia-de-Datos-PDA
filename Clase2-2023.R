#Clase 2 Practica y Tecnicas en Ciencia de Datos 2023/PDA

#Instale y cargue la libreria del paquete tidyverse
library(tidyverse)

#En R se disponen de distintos data set
mtcars
#busque en help que contiene el data set mtcars

#Los datos se extrajeron de la revista estadounidense Motor Trend de 1974 
#y comprenden el consumo de combustible y 10 aspectos del diseño y rendimiento del automóvil para 32 automóviles (modelos 1973--74).

#A data frame with 32 observations on 11 (numeric) variables.

#[, 1]	mpg	Miles/(US) gallon, millas por galon
#[, 2]	cyl	Number of cylinders, numero de cilindros
#[, 3]	disp	Displacement (cu.in.), desplazamiento
#[, 4]	hp	Gross horsepower, caballos de fuerza
#[, 5]	drat	Rear axle ratio, relacion de eje
#[, 6]	wt	Weight (1000 lbs), peso
#[, 7]	qsec	1/4 mile time, tiempo de 1/4 de mila
#[, 8]	vs	Engine (0 = V-shaped, 1 = straight), ingenieria del motor  (0 = en forma de V, 1 = recto)
#[, 9]	am	Transmission (0 = automatic, 1 = manual) , transmision
#[,10]	gear	Number of forward gears, #numero de marchas
#[,11]	carb	Number of carburetors, numero de carburadores


#Guardemos el paquete mtcars en un objeto llamado "datos_autos"
datos_autos <- data.frame(mtcars)

#cuantas filas y columnas tiene nuestro data frame ?
nrow(datos_autos)
ncol(datos_autos)
#nrow=filas, ncol=columnas
#32 filas y 11 columnas


#queremos ver las primeras 3 filas del data frame
head(datos_autos,3)

#queremos ver las ultimas 5 filas del data frame
tail(datos_autos,5)

# si queremos alguna columna del data frame, nombramos al data frame +$ + nombre de columna:
datos_autos$mpg

#cual es la longitud de mpg?
length(datos_autos$mpg)

#cual sera el valor promedio de millas por galon? (me pide calcular la media)
mean(datos_autos$mpg)

#Realizar un histograma de la variable mpg
hist(mtcars$mpg,xlab = "Millas por galon",ylab = "Frecuencia",main = "Histograma", col = "green",border = "chocolate")

#Veamos algunas medidas de resumen
summary(mtcars$mpg)
var(mtcars$mpg)
sd(mtcars$mpg)

#Otra forma para calcular los estadisticos en un solo codigo:
mifuncion<-function(x) {c(media=mean(x), 
                          mediana=median(x), 
                          min=min(x), 
                          max=max(x),
                          varianza=var(x),rango=range(x),cuartiles=quantile(x))}
mifuncion(mtcars$mpg)

###########################################################################################
rm(list=ls(all = TRUE))

## Un factor es un vector cuyos elementos pueden asumir una cantidad limitada de valores
## Corresponde a una variable categorica, puede ser numerica o no
## Cada elemento puede ser incluido dentro de una cantidad limitada de categorias
## en las que se divide o clasifica la poblacion o muestra.


#factor(x, levels = ,labels = )

# "levels" especifica los posibles niveles (categorias) del factor (por defecto los valores unicos de x)

# "labels" define los nombres de esos niveles (serian las etiquetas, asigna nombres a las variables). Por defecto, y a menos que se defina, R usa los propios valores de la variable. 

# Se tienen los datos de un grupo de empleados  de una empresa de logistica, 
#donde 1 significa menos de 65 anos y 2 mayor a 65 anos .

empleados<-c(1,2,2,2,1,1,2,1,2,1,2,1,1,1,2,2,1,2,2,1,2,2,2,2,1,2,2,1,1,1,2,1,2,1,1,2,2,2,2,1,2,2,1,2)
empleados
# Usamos ese mismo vector para transformarlo en un factor

empleados<-factor(empleados, levels = c(1,2),labels = c("Menos de 65","Mas de 65"))

empleados
#Con table, me calcula la frecuencia de cada categoria
table(empleados)

#Con prop.table, me calcula la frecuencia porcentual de cada categoria
prop.table(table(empleados))

#redondear a 2 digitos
round(prop.table(table(empleados)),digits = 2)

# si quiero convertir un vector a factor uso as.factor()
a <- c(2:10)
class(a)    
a

a_factor <- as.factor(a)
class(a_factor)

#####################################################################################
#####################################################################################

#Setear el directorio de trabajo:
#Session,set working directory,to source file location
#Importar data set por codigo
library(readxl)
empleados <- read_excel("empleados.xlsx")
#Otra forma: sino en el panel derecho superior: import data set, from excel

#Se tienen los datos los empleados de una empresa de logistica "CCC"
#Se tiene la informacion de la edad de los empleados, nombres, cantidad de hijos, si alquila o no vivienda
#gastos medicos y cuanto pagan en impuestos

View(empleados)
#Si quiero saber los nombres de las variables (columnas) del data frame uso:
names(empleados)
#"Empleado"  "Edad"      "Hijos"     "Alquila"   "Gas_med"   "Impuestos"
#Si quiero saber las dimensiones del data frame:
dim(empleados)
#25  6
#El data frame tiene 25  filas y 6 columnas

#Tipo de datos del data frame
str(empleados)

#Vemos que alquila es un factor---> se debe pasar a factor
empleados$Alquila<- as.factor(empleados$Alquila)

#Vemos que impuesto es una variable numerica---> se debe pasar a numerica

empleados$Impuestos<- as.numeric(empleados$Impuestos)


#Supongamos que quiero ver en forma descendente la variable edad:
sort(empleados$Edad, decreasing = TRUE)
#67 65 59 56 47 47 45 45 44 43 42 42 39 38 35 34 32 30 29 28 27 26 25 25 22
#En forma ascendente:
sort(empleados$Edad, decreasing = FALSE)
#22 25 25 26 27 28 29 30 32 34 35 38 39 42 42 43 44 45 45 47 47 56 59 65 67
#sino por default:
sort(empleados$Edad)


#Calculemos: media, mediana,varianza,desvio, rango, cuantiles, de la variable hijos .
mean(empleados$Hijos)
median(empleados$Hijos)
sd(empleados$Hijos)
var(empleados$Hijos)
sd(empleados$Hijos)
# otra forma de calcular sd:
sqrt(var(empleados$Hijos))
range(empleados$Hijos)
quantile(empleados$Hijos)

#Recordemos que la funcion summary nos da algunos valores de medidas:
summary(empleados$Hijos)

#Realizar tabla  de frecuencia absoluta:
tabla_hijos <- table(empleados$Hijos)
tabla_hijos
#Realizar tabla de frecuencia relativa:
tabla_fr_hijos <- prop.table(tabla_hijos)
tabla_fr_hijos
#redondear a 2 digitos
round(tabla_fr_hijos,digits = 1)

#Calcular las frecuencias relativas porcentuales
tabla_fr_hijos*100
#redondear a 2 digitos
round(tabla_fr_hijos*100,digits = 2)

#Realizamos un histograma para la variable impuestos
hist(empleados$Impuestos)
#Quiero cambiar el nombre de los ejes, color,borde y el titulo:
hist(empleados$Impuestos,xlab = "Impuestos",ylab="Frecuencia", 
     main = "Histograma de impuestos", col = "violet", border="blue")

#Realizamos un grafico de barras (barplot)
barplot(tabla_hijos,empleados$Hijos,xlab="Cantidad de hijos",ylab = "Frecuencia Relativa",main = "Grafico de barras", col = "violet",border = "black")
# Vemos que la barra mas alta  corresponde a 2, la cantidad de hijos con mayor frecuencia

#Realizamos un grafico de caja (boxplot)
boxplot(empleados$Hijos,main="Boxplot")



#IF ELSE
#con ifelse se nos devolverá un valor para cada elemento de un vector en el que la condición sea TRUE, 
#además nos devolverá otro valor para los elementos en que la condición sea FALSE.


empleados$Edad<-ifelse(empleados$Edad<30,"Joven",ifelse(empleados$Edad<50, "Adulto", "Mayor"))
empleados$Edad
#Si la edad es menor a 30: Joven, Menor a 50 (y meyor a 30): Adulto, caso contrario: mayor

#Otro ejemplo:
edad<-c(27, 30, 32, 32, 33, 34, 37, 37, 37, 37, 37, 38, 38, 39, 39, 39, 40, 40, 40, 40, 40, 41, 41, 41, 
        41, 41, 41, 42, 42, 42, 42, 42, 42, 43, 43, 43, 44, 45, 45, 45, 45, 45, 45, 45, 45, 46, 46, 46, 
        46, 46, 46, 47, 47, 47, 48, 48, 49, 49, 49, 49, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 51, 51,
        51, 51, 51, 51, 52, 52, 52, 52, 52, 52, 52, 52, 53, 53, 53, 53, 53, 53, 54, 54, 54, 54, 54, 54, 
        54, 54, 54, 54, 54, 55, 55, 55, 55, 55, 56, 56, 56, 56, 56, 56, 57, 57, 57, 57, 57, 57, 58, 58, 
        58, 58, 58, 58, 58, 58, 58, 58, 58, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 59, 
        60, 60, 60, 61, 61, 61, 61, 61, 61, 61, 61, 61, 62, 62, 62, 62, 62, 62, 63, 63, 63, 63, 63, 64, 
        64, 64, 64, 64, 65, 65, 65, 65, 65, 65, 66, 66, 66, 66, 66, 67, 67, 68, 68, 68, 68, 69, 69, 69, 
        70, 70, 71, 71, 71, 71, 72, 72, 72, 72, 73, 74, 75, 75, 75, 77, 78, 78)


edad<- ifelse(edad<40,"Joven", "Adulto")
edad

#Algunos operadores
# < menor
# > mayor
# =< menor igual
# => mayor igual
# == igual


############################################################################################
#Vamos a utilizar el dataset cars
cars
#A data frame with 50 observations on 2 variables.
#speed	numeric	Speed (mph) (velocidad)
#dist	numeric	Stopping distance (ft) (distancia de frenado)

#Lo guardamos en un objetos denominados
autos<- data.frame(cars)

names(autos)
#con names vemos los nombres de las columnas/variables
#[1] "speed" "dist" 
#columna 1 speed, columna 2 dist

colnames(autos)[2] <-"Distancia de frenado"
names(autos)
#[1] "speed"                "Distancia de frenado"

#Si quisiera cambiar un nombre de fila, utilizo rownames

#Calculemos la media, mediana y sd de la variable speed. 
mean(autos$speed)
#15.4
median(autos$speed)
#15
sd(autos$speed)
#5.287644

#Realizamos un histograma de la variable speed.
hist(autos$speed,xlab = "Velocidad",ylab="Frecuencia", 
     main = "Histograma ", col = "red", border="blue")

############################################################################################
#DATOS FALTANTES   
#La base de datos que vamos a utilizar a continuacion fue extraida de
#https://brunel.figshare.com/articles/dataset/Supply_Chain_Logistics_Problem_Dataset/7558679
#Los datos fueron tomados por Brunel University of London


#Service level: nivel de servicio
#DTD (Door to Door), puerta a puerta
#DTP (Door to Port), puerta a puerto
#CRF (Customer Referred Freight), flete recomendado por clientes

#Cargar la base de datos supply_chain(na) y la nombramos datos (esta en hoja2)
datos <- read_excel("sp.xlsx", sheet = "Hoja2")
#Vemos que la variable peso la leyo como caracter, hay que pasarla a variable numerica
datos$Peso<- as.numeric(datos$Peso)
#Calculamos la media de la variable peso
mean(datos$Peso)
#NA
#Se debe especificar que se deben omitir los NA:
mean(datos$Peso,na.rm = TRUE)

#206.0652

sum(is.na(datos))
#Vemos que tenemos 19 datos faltantes

#Visualizacion de datos faltantes
#instalar paquete visdat
library(visdat)
vis_miss(datos, sort=TRUE)
vis_miss(datos, cluster = TRUE)
vis_dat(datos)
colSums(is.na(datos))

#https://rpubs.com/paraneda/missingdata
#Paquete mice sirve para imputacion de datos faltantes



########################################################################################
#EJERCICIOS CLASE 2

#Volvemos al ejercicio de la semana anterior. 
#Cargamos los siguientes vectores y creamos el data frame motos:

modelo<- c("A","B","C","D","E","F","G","H","I","J")
peso<- c(750,790,800,740,830,770,830,720,720,780)
precio<- c(9500,10500,11200,8500,10000,10000,9300,7700,7000,8500)
motos<- data.frame(modelo,peso,precio)
                   
#1) Como podemos saber el nombre de las columnas/variables del data set motos?


#2) Ordenar de forma descendente la variable peso

#3) Calcular la media, mediana y desvio estandar de la variable precio 

#4) Realizar un histograma de la variable precio. Que observa?


#5) Modificar el nombre de la variable peso a PESO. Verificar

#6) Utilizando la funcion if else sobre la variable precio, donde aquellas motos con precio mayor a 9500
#se clasifiquen como "Alto", de lo contrario "Bajo"


