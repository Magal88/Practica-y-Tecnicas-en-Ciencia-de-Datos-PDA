#CLASE 3
# PARTE 1 MANIPULACION DE DATOS

#Un paquete (package) es una colección de funciones, datos y código R que se almacenan en una carpeta conforme a una estructura bien definida,
#fácilmente accesible para R.
#Primero se debe instalar los paquetes (ej. install.packages("ggplot2")) y luego se carga la libreria
#La instalacion de paquetes se realiza por unica vez.


#Tidyverse nos permite:
#Importar datos, ordenarlos
#Transformación, visualización y creación de modelos, para luego  comunicar los resultados. 


#Dentro de tidyverse, tenemos dplyr: para manipular datos
#Cargamos el data set iris:
library(tidyverse)
library(dplyr)
iris
names(iris)


#El data set iris contiene las mediciones en centímetros de las variables longitud
#(Length) y ancho (Width) de los pétalos (Petal) y sépalos (Sepal) de 50 flores de cada
#una de las 3 especies (Species) del género Iris: Iris setosa, Iris versicolor e Iris
#virginica. El data set presenta 150 filas y 5 variables

#conector %>% (tuberia/pipe)
#Permite transformar llamadas de funciones
#anidadas (con muchos paréntesis) en una simple serie de operaciones


#Ejemplo:
#veamos  la logica de dplyr:
#nombre del data set %>% funcion


#Paquete dplyr proporciona una "gramática" (particularmente verbos) para la manipulación y operaciones con data frames

#select: devuelve un conjunto de columnas
#filter: devuelve un conjunto de filas según una o varias condiciones lógicas
#arrange: reordena filas de un data frame
#rename: renombra variables en una data frame
#mutate: añade nuevas variables/columnas o transforma variables existentes
#summarise/summarize: genera resúmenes estadísticos de diferentes variables en el data frame
#group by:agrupa un conjunto de filas seleccionado, en un conjunto de filas 
#de resumen de acuerdo con los valores de una o más columnas o expresiones


#Algunos ejemplos:


#Selecciona las columnas Sepal Lenght y Sepal Width
iris %>% select(Sepal.Length, Sepal.Width)

#Si quiero seleccionar todas las variables menos especies:
iris %>% select(-Species)
#con el menos indico que esa variable la excluyo

#Si quiero las columnas 2 y 4:
iris %>% select(2,4)


#Cambiar el nombre de algunas variables:
iris %>% rename("Especie"= "Species", "Long
Sepalo"="Sepal.Length", "Ancho Sepalo"= "Sepal.Width")

#Para filtrar algunas filas del data set:
iris %>% filter(Species == "versicolor")
#me selecciono aquellas especies "versicolor"


iris %>% filter(Species == "setosa" | Species == "virginica")
#filtrar setosa o virginica
# | este operador significa o 


#Se puede ordenar el data set  por la variable longitud del pétalo (Petal.Length): arrange
#. Por defecto, el ordenamiento es ascendente:

iris %>% arrange(Petal.Length) 

#De forma descendente
iris %>% arrange(desc(Petal.Length))

#Puedo combinar funciones en una misma linea de codigo
iris %>% arrange(Petal.Length) %>%
  head


#ordeno de forma ascendente la longitud del petalo y a su vez me arrojo las primeras 6 filas
#(por default, head y tail, son 6 filas)

#Si quiero las primeras 3 filas
iris %>% arrange(Petal.Length) %>%
  head (3)

#Me selecciona aquellas especies que son "setosa"
iris %>% subset(Species=="setosa")

#En este caso me interesan los valores medios para cada categoría de las especies (mean), y que solo provengan de las flores con
#sépalos mayores a 5
iris %>% subset(Sepal.Length > 5) %>% aggregate(. ~ Species, ., mean)


#1ero subset de flores con sépalos mayores a 5
#2do con la funcion aggregate, se toman todos los datos y los comprime en un  valor (media)

#Si quiero crear nuevas variables a partir de otras existentes del data set, se puede utilizar mutate:
iris %>% mutate(Petal.Shape = Petal.Width / Petal.Length,Sepal.Shape = Sepal.Width / Sepal.Length)

#forma de petalos (petal shape) seria la nueva variable creada, siendo la relacione entre ancho y longitud


#La función summarise() colapsa un conjunto de datos en una sola fila. Esta funcion se combina
#con group by (toma como argumentos los nombres de columna que contienen las variables categóricas para las que desea
#calcular medidas de resumen, ej. media)

iris %>%group_by(Species) %>% summarise(Mean.Petal.Length = mean(Petal.Length))
#aca se calculo ;a media de la longitud de pétalos por especie


# PARTE 2: Visualizacion de datos
#Recordemos como instalar paquetes en R :

#Los paquetes consisten en una colección de funciones R, datos y código compilado. La ubicación donde se almacenan
#los mismos se denomina Librería (library).

#Los paquetes se instalan una sola vez, pero cada vez que debemos utilizar el paquete se carga
#la libreria en memoria

#Paquete ggplot2
#instalar paquete
install.packages(ggplot2)
#otra forma: packages (panel derecho inferior),install, coloco nombre, install

library(ggplot2)

#Otros ejemplos
#Instale y cargue los siguientes paquetes: tidyverse y dplyr.

#ggplot2 arma los graficos  utilizando capas
#Las distintas capas son:
#data (datos): data set
#aes (estetica): Cómo se relacionan cada una de las variables de los datos con las propiedades estética del gráfico
#geom (geometrica): tipo de geometria a graficar (punto, barras,lineas, etc)
#facet (facetas): se subdivide el grafico en facetas segun los datos (ej por variables categoricas)
#theme (tema): permite controlar los colores, líneas, tipografía, etc.
#sistema de coordenadas: para modificar los ejes
#stats (estadistica): se realiza alguna operacion estadistica a los datos

#En help se puede buscar ggplot
#Vamos a trabajar con el data set mpg, un data set con 234 filas y 11 variables
mpg
#lo guardo en un objeto como mpg
mpg<- data.frame(mpg)

#model : model name (nombre del modelo)

#displ: engine displacement, in litres (desplazamiento de cilindros, ing del motor)

#year: year of manufacture (an~o de manufactura)

#cyl:  number of cylinders (numero de cilindros)

#trans:  type of transmission (tipo de transmision)

#drv: the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd

#am tipo de tren de transmisión, donde f = tracción delantera, r = tracción trasera, 4 = 4wd)

#cty: city miles per gallon (millas por galon en ciudad)

#hwy: highway miles per gallon (millas por galon en autopista)

#fl:fuel type (tipo de combustible)

#class: "type" of car  (tipo de auto)

#Que variables son cualitativas? y cuales son cuantitativas?

#Queremos estudiar la relacion entre 2 variables numericas, para ello realizamos un
#scatterplot (diagrama de dispersion)
ggplot(mpg, aes(displ, hwy)) +
  geom_point()

#En este caso vemos la relacion de hwy (millas/galon) en funcion de displ (desplazamiento), 
#que observamos??

#Veamos las partes del codigo:
#ggplot( nombre del data set, aes(x,y))+ geometria (point=punto---> scatterplot) 
#Con el mas vamos agregando capas

#Podemos seguir agregando capas
ggplot(mpg, aes(
  displ, hwy)) +
  geom_point(col="violet") +
  labs(
    x = "Desplazamiento del motor (litres)",
    y = "Millas de autopista por galon")+ ggtitle("Kilometraje por tamaño de motor y cilindros")
#con labs agregamos titulo a los ejes, al grafico, y en geom point pido un color determinado 
#con ggtitle: titulo al grafico

# Podemos  " facetar"  o subdividir el gráfico de acuerdo a los niveles o categorías de la variable de comparación
ggplot(mpg, aes(displ, hwy)) + geom_point(col="green") + facet_wrap(~class)
#vemos 7 graficos: 1 por cada tipo de auto (variable class)

#que podemos observar?

#Se puede cambiar la forma de los puntos: shape

ggplot(mpg, aes(displ, hwy)) + geom_point(col="brown1", shape=17)

#Si queremos agregar una regresion lineal al grafico, lo hacemos con geom_smooth
ggplot(mpg, aes(
  displ, hwy)) +
  geom_point(col="violet") +geom_smooth(method = "lm")


#Grafico de barras (bar plot)
#Lo utilizabamos para variables cuantitativas discretas
#Vamos a realizar un barplot de la variable cyl: numero de cilindros

ggplot(mpg, aes(cyl)) + 
  geom_bar() + 
  xlab("Número de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Gráfico de Barras de la variable cyl")

ggplot(mpg, aes(cyl)) + 
  geom_bar(col="darkslategray", fill="coral") + 
  xlab("Número de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Gráfico de Barras de la variable cyl")
#fill=para relleno, col= bordes de barras

#Se puede   cambiar la orientación de los ejes usando coord_flip():
ggplot(mpg, aes(cyl)) + 
  geom_bar(col="darkslategray", fill="cyan3") + 
  xlab("Número de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Gráfico de Barras de la variable cyl")+coord_flip()

#que observamos?

#aca tenemos la lista de colores https://r-charts.com/es/colores/


#Si quiero colorear las barras por otra variable, ej fl (tipo de combustible)
#para eso debo convertir la variable a factor, uso dentro de aes , fill
ggplot(mpg, aes(cyl, fill = as.factor(fl))) + 
  geom_bar() + 
  xlab("Numero de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Numero de cilindros segun combustible") +
  labs(fill = "Tipo de combustible")


#Histograma
#Lo utilizamos para variable aleatorias cuantitativas continuas
#En este caso, construimos un histograma de la variable displ
ggplot(mpg, aes(displ)) + geom_histogram()


#stat_bin() using bins = 30. Pick better value with binwidth.
#Las posibles opciones para solucionar esto es estableciendo el número de barras con el argumento bins o 
#modificar el ancho de cada barra con el argumento  binwidth .
#binwidth= ancho de las barras que recogen los rangos de representación de la variable.

#bins=5 (tengo 5 intervalos=5 barras apiladas)

ggplot(mpg, aes(displ,fill="coral")) + geom_histogram()+stat_bin(bins=5)+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()

#Si quiero un histograma por variable tipo de auto, debo facetar:

ggplot(mpg, aes(displ,fill="coral"),binwidth=30) + geom_histogram()+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()+ facet_grid(class~.)

#Podemos emplear la función geom_density() para trazar un gráfico de densidad que asemeja una distribución continua:

ggplot(mpg, aes(displ,fill="blue"),binwidth=10) + geom_density()+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()


#otra alternativa , el poligono de frecuencias: se ven  lineas en vez de barras
ggplot(mpg, aes(hwy)) + geom_freqpoly()

ggplot(mpg, aes(hwy)) + geom_freqpoly(col="aquamarine2") +xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_minimal()

#BOXPLOT (GRAFICO DE CAJA)
#Una gráfica de caja resume la distribución de una variable continua. 
# Muestra su mediana, su primer y tercer cuartiles y outliers.

ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot() 
#En el eje x tengo drv (tipo de transmision), y en eje y, hwy (millas por galon)

# que observamos?

#con geom_jitter, puedo "manejar" los puntos en el boxplot

#Si quiero darle color a los puntos:
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot(aes(color = drv), alpha = 0.7) + 
  geom_jitter(aes(color = drv), size = 1, alpha = 0.7)+ 
  xlab("Transmision") + 
  ylab("Millas/galon") +
  ggtitle("Boxplot") + 
  theme_minimal() 

#con size, modifico el tamano de los puntos
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot(aes(color = drv), alpha = 0.7) + 
  geom_jitter(aes(color = drv), size = 3, alpha = 0.7)+ 
  xlab("Transmision") + 
  ylab("Millas/galon") +
  ggtitle("Boxplot") + 
  theme_minimal() 

#con alpha, el tono de color de los puntos
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot(aes(color = drv), alpha = 0.1) + 
  geom_jitter(aes(color = drv), size = 3, alpha = 0.1)+ 
  xlab("Transmision") + 
  ylab("Millas/galon") +
  ggtitle("Boxplot") + 
  theme_minimal() 

#otra alternativa al boxplot es el VIOLIN PLOT (grafico de violines)
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_violin()
#Encima del grafico de violines puedo superponer el boxplot:
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_violin(aes(fill = drv))+geom_boxplot()

#Para variables cualitativas se pueden usar los barplot:

g1<- ggplot(mpg,aes(class))+geom_bar(aes(fill=class))+
    xlab("Tipo de auto")+ylab("Frecuencia")+theme_minimal()+
  ggtitle("Tipos de autos")



g2 <- ggplot(mpg, aes(cyl, fill = as.factor(fl))) + 
  geom_bar() + 
  xlab("Numero de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Numero de cilindros segun combustible") +
  labs(fill = "Tipo de combustible")+ theme_dark()

g3<- ggplot(mpg, aes(
  displ, hwy)) +
  geom_point(col="violet") +geom_smooth(method = "lm")

g4<- ggplot(mpg, aes(hwy)) + geom_freqpoly(col="aquamarine2") +xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_minimal()


#si quiero tener en una misma hoja multiples graficos:


#Utilizo el paquete gridExtra
#Instalar el paquete y cargar la libreria en memoria
library(gridExtra)
library(dplyr)
grid.arrange(g1, g2, g3, g4, ncol=2, nrow =2)


#########################################################################################
#PARTE 3: CORRELACION Y REGRESION LINEAL
library(ggplot2)
library(GGally)

#CORRELACION

#Cargue los siguientes vectores.
#Siendo
#edad: edad de hombres de CABA
#altura: altura en cm de los hombres de CABA
edad <- c(61, 60, 78, 62, 66, 60, 54, 84, 68)
altura <- c(162, 154, 180, 158, 171, 169, 166, 176, 163)

pairs(edad~altura)
#Que observa?

cor.test(edad,altura,method="pearson")
plot(edad,altura,xlab="Edad",ylab="Altura",pch=20)

#con la funcion cor test, se calcula el coeficiente de correlacion

#Ho: no axiste asociacion lineal entre edad y altura (rho=0)
#H1: existe asociacion lineal entre edad y altura (rho difiere de 0)
# pvalor es menor a 0.05, rechazamos Ho, existe evidencia significativa de que el coeficiente de correlacion difiere de 0 
#hay asociacion lineal entre las variables edad y altura


#REGRESION LINEAL SIMPLE
# MODELO DE REGRESION LINEAL SIMPLE
#Cargue los siguientes vectores:
#publicidad: gasto de publicidad de una empresa que brinda servicios educativos (en miles de pesos)
#ventas: ventas de cursos de Ciencia de Datos (en miles de pesos)
publicidad <- c(39.7,42.1,37.2,41.3,32.3,60.2,62.6,51.0,36.9,25.1,28.9,47.3,27.6,32.6,52.3,53.1,30.2,38.1,30.4,35.8,22.7,29.5) 
ventas <- c(97.9,100.6,91.3,101.1,80.9,147.5,151.7,124.1,91.0,66.4,73.1,115.2,70.7,85.5,128.6,129.5,75.3,95.1,76.1,90.3,59.6,76.1)
datos<-data.frame(publicidad,ventas)


#Y= beta0+ beta 1* X + ei
# parametros: beta 0 y beta 1
#modelo ajustado
# y sombrero = 6.81363+  2.30797 X

modelo<-lm(ventas~publicidad,data = datos)
summary(modelo)

#lm (Y~X, dataset)
#grafico
plot(datos$publicidad,datos$ventas,
     ylab="ventas",xlab="Publicidad", pch=20)
abline(modelo,col="violet")

#REGRESION LINEAL MULTIPLE
state.x77
datos <- as.data.frame(state.x77)
#US State Facts and Figures

#Data sets related to the 50 states of the United States of America.


#state.abb:character vector of 2-letter abbreviations for the state names.

#state.area: numeric vector of state areas (in square miles).

#state.center:
#list with components named x and y giving the approximate geographic center of each state in negative longitude and latitude. Alaska and Hawaii are placed just off the West Coast.

#state.division:
#factor giving state divisions (New England, Middle Atlantic, South Atlantic, East South Central, West South Central, East North Central, West North Central, Mountain, and Pacific).

#state.name:
#character vector giving the full state names.

#state.region:
#factor giving the region (Northeast, South, North Central, West) that each state belongs to.

#state.x77:
#matrix with 50 rows and 8 columns giving the following statistics in the respective columns.

#Population:
#population estimate as of July 1, 1975

#Income:
#per capita income (1974)

#Illiteracy:
#illiteracy (1970, percent of population)

#Life Exp:
#life expectancy in years (1969-71)

#Murder:
#murder and non-negligent manslaughter rate per 100,000 population (1976)

#HS Grad:
#percent high-school graduates (1970)

#Frost:
#mean number of days with minimum temperature below freezing (1931-1960) in capital or large city

#Area:
#land area in square miles
datos <- rename(habitantes = Population, analfabetismo = Illiteracy,
                ingresos = Income, esp_vida = `Life Exp`, asesinatos = Murder,
                universitarios = `HS Grad`, heladas = Frost, area = Area,
                .data = datos)
datos <- mutate(.data = datos, densidad_pobl = habitantes * 1000 / area)
ggpairs(datos)

#modelo lineal simple
#variable respuesta: esperanza de vida, variable explicativa: asesinatos
modelo1 <- lm(esp_vida ~ asesinatos , data = datos )
summary(modelo1)


#modelo lineal multiple
modelo_mult <- lm(esp_vida ~ habitantes + ingresos + analfabetismo + asesinatos +
                    universitarios + heladas + area + densidad_pobl, data = datos )
summary(modelo_mult)


#seleccion de modelos:
#Métodos stepwise (paso a paso): emplean criterios matemáticos para decidir los predictores que contribuyen de forma significativa al modelo 
#y el orden a ser introducidos
#hay 3 tipos: forward, backward y both.

step(object = modelo_mult, direction = "both", trace = 1)


#mejor modelo lineal multiple
mejor_modelo <- lm(formula = esp_vida ~ habitantes + asesinatos + universitarios +
                     heladas, data = datos)
summary(mejor_modelo)


#DATA SETS EN R
#https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html



#####################################################################################
#EJERCICIO CLASE 3
#Cargamos los siguientes vectores y creamos el data frame motos:
modelo<- c("A","B","C","D","E","F","G","H","I","J")
peso<- c(750,790,800,740,830,770,830,720,720,780)
precio<- c(9500,10500,11200,8500,10000,10000,9300,7700,7000,8500)
motos<- data.frame(modelo,peso,precio)
motos  

#1) Realizar un grafico de dispersion, donde x=peso, y= precio, utilizando ggplot2.


#2) Al grafico anterior, agregar una regresion lineal.


#3) Calcular parametros del modelo.


#4) Seleccionar las columnas precio y peso del data set, utilizando dplyr.


#5) Ordenar de forma ascendente la variable precio y mostrar las primeras 2 filas.

#6) 6) Seleccione aquellas filas que corresponden a tiendas de US (US=TIENDAS DE USA, YES /NO)
#y con ingreso (income) igual a 120

library(ISLR)
library(tidyverse)
library(ggplot2)
data("Carseats")
Carseats


#Para un nuevo lanzamiento de una butaca de autos para niños, 
#se estudió la base de datos Carseats.

#La base de datos Carseats contiene las siguientes variables:
#Sales: Ventas unitarias (en miles) en cada ubicación
#CompPrice: Precio cobrado por la competencia en cada ubicación
#Income: Nivel de ingresos de la comunidad (en miles de dólares)
#Advertising: Presupuesto de publicidad local para la empresa en cada ubicación (en miles de dólares)
#Population: Tamaño de la población en la región (en miles)
#Price: Precio que cobra la empresa por los asientos de seguridad en cada sitio
#ShelveLoc: Un factor con niveles Malo, Bueno y Medio que indica la calidad de la ubicación de las
#estanterías para los asientos de seguridad en cada sitio.
#Age: Edad media de la población local
#Education: Nivel de educación en cada ubicación
#Urban: Un factor con niveles No y Sí para indicar si la tienda se encuentra en una ubicación urbana
#o rural.
#US: corresponde a un factor con niveles No y Sí para indicar si la tienda está en EE. UU o no.

library(ISLR)
library(tidyverse)
library(ggplot2)
data("Carseats")
Carseats
autos1 <- data.frame(Carseats)

#7)  Seleccione las variables Age y Education, mostrando las ultimas 5 filas

#8) Realizar el grafico de densidad de la variables Sales

#9) Realice un boxplot de la variable Income, segun US.

#10) Seleccione las variables Sales, Price e Income del data frame.
