#BIENVENIDOS A LA MATERIA Practica y Tecnicas en Ciencia de Datos 2023/PDA

#Utilizaremos la tecla # cuando queremos comentar algo o dejar una nota.C
#Es importante comentar lo que se realiza en los scripts


# LA COMBINACIÓN DE TECLAS <Ctrl ENTER>  corre lo seleccionado 

# <Ctrl 1>     y      <Ctrl 2>    permiten pasar de la ventana de script (arriba) a la consola de abajo.

# <Ctrl S>   graba

# <Ctrl A> selecciona todo el contenido de la ventana de Scripts.

# <cTRL l> LIMPIA LA CONSULA

# ESC   INTERRUMPE EL PROCESO CORRIENDO EN R


#Siempre antes de empezar borramos cualquier objeto en memoria con:


rm(list=ls(all = TRUE))

# otra forma"click en la "escoba"que se encuentra en el environment


# En R podemos hacer cuentas...
#Dividir
12/6
#Multiplicar
25*2
#Sumar
39696+410
#Restar
30-2
#Potenciacion
5^2
#Radicacion
sqrt(4)
#Numero e
exp(1)
#Logaritmo neperiano
log(4)
#Logaritmo  base 10
log10(10)
#Valor absoluto de un numero
abs(-3)
#Numero pi
pi

#Operaciones combinadas:
((20-2)*3)/(log10(100)+sqrt(125))

#VECTORES
#nombre_objeto <-c(x1, x2, x3) 

vector1<-c(1,3,5,7)
vector1
vector2<-c(4,5,8,9)
vector2
vector3<-c("a","b","c","d")
vector3
vector4<-c(TRUE,FALSE,TRUE,TRUE)
vector4

#Tipos de vectores:
#Integer: numeros enteros. Ej.2,5,6,etc
#Numeric: numeros reales. Ej. 2.5, 6.8,etc
#Logical: caracteres logicos. Ej. TRUE, FALSE
#Chracter:caracteres o palabras. Ej. vector4
#Complex: numeros complejos. Ej.vc1<-c(1+2i, 4i, 3+6i)

mode(vector1) 
mode(vector2); mode(vector3); mode(vector4)
length(vector1)
length(vector2);length(vector3);length(vector4)
str(vector1)
str(vector2);str(vector3);str(vector4)
summary(vector1)



# otro ejemplo: vector con longitud 1

m<-5
m

mode(m)
length(m)

#Supongamos que quiero eliminar el vector a, uso la funcion rm
rm(m)


############################################################################
rm(list = ls(all = TRUE))

pais<-c("Japan", "Argentina", "Australia", "Bulgaria", "Egypt", "Ethiopia")  
precio_pc<-c(120, 900, 140, 1040, 259, 3606)
#precio_pc: precios de laptop en dolares
precio_pc


ventas<-c(127317900, 40381860,  21370348, 751364600,  78976122,  8307960800) 
ventas

# voy a crear un nuevo vector llamado unidades

unidades<- ventas/precio_pc
unidades


#cual es el pais que se encuentra en el 2do lugar?
pais[2]
#Argentina

#otro ejemplo:
# se informa los empleados pertenecientes a 5 bancos: A,B,C,D Y E
# dichos empleados presentan dos modalidades de contratacion: autonomos, y monotributistas

monotributistas<-c(20,35,12,7,40)
autonomos<- c(81,22,47,56,62)

#queremos saber cuantos empleados tiene cada banco?
empleados<- monotributistas+autonomos
empleados
# 101  57  59  63 102



#cuantos empleados hay en el 2do y 3er lugar en el vector llamado empleados?
empleados[c(2,3)]
#57 59
#Quiero saber los empleados de las posiciones 3 a la 5
empleados[3:5]
empleados[c(3,5)]

# 59 102

#cuantos empleados hay en la posicion 1?
empleados[1]

#101

# También podemos identificar la posición del maximo y minimo valor, usando which max y which min
which.max(empleados)
#5
which.min(empleados)
#2

#Si quiero saber el valor maximo y minimo:
max(empleados)
min(empleados)


#Operaciones entre vectores
v_a <- c(10,5,48,50,23,69,78,41,2,56)
v_b <- c(2,8,7,40,42,25,32,70,38,2)
v_a-v_b
# [1]   8  -3  41  10 -19  44  46 -29 -36  54

v_c <- c(1:10)
v_d <- c(11:20)
v_c+v_d
#[1] 12 14 16 18 20 22 24 26 28 30


v_c*v_d
# [1]  11  24  39  56  75  96 119 144 171 200

v_c/v_d

#[1] 0.09090909 0.16666667 0.23076923 0.28571429 0.33333333 0.37500000 0.41176471 0.44444444 0.47368421 0.50000000

#Otro procedimiento para crear vectores:
#rep():	Repite elementos del vector
#seq():	Elementos ordenados en progresión aritmética

x1<-rep(2,5)          # Repite el 2 cinco veces.
x1

x2<-rep("Juan",10)    # Repite "Juan" diez veces.
x2


b1<-seq(1, 20, by=2)
b1
#Va de 1 al 20, de 2 en 2

#2 FACTOR: es un vector que tiene una cantidad limitada de posibles valores. Se denomina tambien
#una variable categórica. No sólo incluye los valores de cada observación
# sino los "niveles" o valores que puede asumir. 
# Ej:
factor_b<-factor(c(1,2,3,1,3,1,2,1,1,1,2,2), levels = c(1,2,3))

table((factor_b))

# otro ejemplo
pago_impuestos<-c(1, 3, 1, 1, 3, 99, 3, 2, 2, 1, 2, 2, 1, 1, 3, 3, 1, 3, 3, 3, 3, 3, 3, 3, 1, 3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 99, 3, 1, 1, 1, 3, 2, 3, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 2, 3, 1, 2, 1, 2, 1, 3, 3, 1, 1, 2, 1, 2, 1, 3, 1, 1, 2, 3, 1, 1, 1, 1, 3, 1, 3, 3, 1, 3, 1, 1, 2, 1, 3, 1, 1, 1, 1, 1, 1, 3, 2, 1, 1, 2, 1, 1, 1, 1, 3, 1, 3, 3, 3, 3, 1, 99, 2, 2, 3, 3, 1, 1, 2, 2, 1, 1, 2, 3, 3, 1, 99, 3, 1, 1, 1, 3, 1, 1, 1, 1, 2, 2, 2, 1, 3, 2, 3, 1, 3, 2, 3, 3, 99, 3, 3, 2, 2, 3, 1, 2, 1, 3, 3, 3, 2, 1, 3, 2, 1, 1, 1, 2, 3, 3, 2, 1, 2, 1, 3, 3, 1, 2, 1, 2, 2, 3, 1, 2, 1, 2, 3)
length(pago_impuestos)
#Etiquetas:
#  1  Paga el 5% de su sueldo en impuestos 
#  2  Paga el 15% de su sueldo en impuestos
#  3  No paga impuestos
#  99 No Sabe/No contesta

pago_impuestos<-factor(pago_impuestos, levels = c(1,2,3,99), labels = c("Paga 5%", "Paga 15%","No paga","No sabe / No contesta"))
pago_impuestos
table(pago_impuestos)


#pago_impuestos
#Paga 5%              Paga 15%               No paga No sabe / No contesta 
#97                    40                    58                     5 


#3 MATRIZ:  es un arreglo de filas y columnas. Es un vector con un atributo adicional (dim) 
# el cual, a su vez, es un vector numérico 
# de longitud 2, que define el número de filas y columnas de la matriz
#importante:
#Todos los elementos de la matriz deben ser del mismo tipo (numéricos, carácter o lógicos);
#se puede crear la misma a partir de vectores


# Ej:

#La empresas A,B,C, D y E, presentan la siguiente cantidad de empleados con sueldos y cargas sociales para c/u de ellos
sueldo<-c(10485,	9687,	112501,	3889,	4279)
carga_social<-c(176,	91,	356,	73,	78)
empleados<-c(17,	6,	52,	10,	15)

#se genera la matriz uniendo los 3 vectores anteriores por columna (cbind)
legajos1 <- cbind(sueldo, carga_social, empleados)
legajos1
#utilizando rbind (r de row) se unen los vectores por filas
legajos2 <- rbind(sueldo, carga_social, empleados)
legajos2



class(legajos1)
length(legajos1) 
mode(legajos1)


rm(list=ls(all = TRUE))
# A continuacion se presentan las ventas mensuales en miles de dolares de 4 empresas de auditoria
#(empresas: a,b,c y d)

ventas_a<-c(20,23,25,19,20,21,27,26,30,28,29,24,25,26,24,28,26,30,22,24)
ventas_b<- c(21,22,25,28,25,25,22,24,27,22,27,22,21,22,22,24,26,23,20,22)
ventas_c<-c(20,24,20,24,25,26,27,28,25,21,22,29,23,25,19,20,21,27,25,28)
ventas_d<-c(22,23,20,21,22,25,24,30,22,22,23,25,20,22,25,20,22,23,24,25)

ventales_totales<-cbind(ventas_a, ventas_b, ventas_c, ventas_d)
ventales_totales


#¿Cuántas ventas hubo en la empresa A en el primer mes?

ventas_a[1]
#20 (20.000 dolares)


#¿Cuántas ventas hubo en la empresa C en el quinto mes?
ventas_c[5]
#25 (25.000 dolares)


#4  DATA.FRAME: o marco de datos, es una base de dats plana, que permite combinar vectores con 
# diferente tipo de datos (numéricos, carácter, lógico).
#Cada columna correspondera a una variable/atributo y cada fila a un registro/observacion/sujeto
# Ej:

vector_a_1<-c(1,3,5,7)
vector_a_2<-c(4,5,8,9)
vector_a_3<-c("a","b","c","d")
vector_a_4<-c(TRUE,FALSE,TRUE,TRUE)

#Vamos a crear un data frame llamado datos
datos<-data.frame(vector_a_1, vector_a_2, vector_a_3, vector_a_4)

View(datos)
dim(datos)
#Si quiero ver una variable (columna especifica del data frame), ej vector_a_1, utilizo el signo $
datos$vector_a_1

datos$vector_a_2
datos


# Si queremos una parte del data frame, por ejemplo, las primeras 2 filas:
head(datos,2)
tail(datos,2)

# Con la funcion summary obtenemos las medidas de resumen de cada columna del data frame
summary(datos)

# En el caso de querer las funciones resumen de solo una columna:
summary(datos$vector_a_2)

#Si quiero conocer el numero de filas y columnas:
#Filas
nrow(datos)
#Columnas
ncol(datos)

#LISTAS: corresponden a una colección ordenadas de objetos, donde se pueden agrupar objetos de
#diferentes tipos (se pueden combinar vectores, factores, matrices, otras listas, etc).

# Ej:
lista_e<-list(vector_a_1, vector_a_2, vector_a_3, vector_a_4)

View(lista_e)


###Aclaracion:
#A excepcion de las listas y los data.frames, los vectores y matrices sólo pueden contener un sólo tipo de datos.



#Paquetes
#Un paquete (package) es una colección de funciones, datos y código R que se almacenan en una carpeta conforme a una estructura bien definida,
#fácilmente accesible para R.
#Primero se debe instalar los paquetes (ej. install.packages("ggplot2")) y luego se carga la libreria
#La instalacion de paquetes se realiza por unica vez.


library(tidyverse)
library(dplyr)


#EJERCICIOS CLASE 1
#Se presenta la informacion de motos acuaticas:modelo, peso (en libras) y precio (en dolares)
#Modelo: A,B,C,D,E,F,G,H,I
#Peso: 750,790,800,740,830,770,830,720,720,780
#Precio:9500,10500,11200,8500,10000,10000,9300,7700,7000,8500


#1) Crear los vectores modelo, peso y precio.





#2) Indique el tipo de datos y la longitud de los 3 vectores creados en item 1.




#3) Cual es el valor minimo y la posicion del vector peso.



#4) Cree un data frame con los 3 vectores creados en item 1, denominado motos.


#5) Calcule las medidas de resumen de la variable precio del data frame motos.


#6) Mostrar las primeras 3 filas y las 2 ultimas del data frame motos.


#7) Cuantas columnas y filas tiene el data frame motos?


#8) Construir una matriz llamada motos_abc, uniendo precio y peso, por columna
 