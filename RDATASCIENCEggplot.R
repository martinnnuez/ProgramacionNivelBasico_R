#Ejercicios
library(ggplot2)

mpg

#Scatterplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg)
nrow(mpg)
help("mpg")

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv))
#No sirve grafico de puntos pq son dos categoricas

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))#color

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))#tamaño

# Left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))#tono de color, mas claro y oscuro

# Right
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))#forma

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy),color = "blue")#los hace color azul a todos

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

summary(mpg)
?geom_point
#stroke aesthetic to modifica el tamaño de los puntos o de las formas.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue", stroke=1)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour=displ < 5), stroke=1)

#aes(colour = displ < 5) pongo una condicion dentro del aestetics y ahi diferencia quienes
#cumplen y quienes no esa condicion

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
#Facet wrap divide la ventana grafica en partes en funcion de un criterio de clasificacion

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)#categoricas
#facet grid en funcion de mas de un criterio 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(year ~ cty)#divido con continuas hace un grafico pero no es muy comprensible

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

#hace el facet acostado
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
#hace el facet parado 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid( .~ cyl)
#en funcion de donde este el punto colocado

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# right
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color= drv))
#lynetipe cambia el estilo de la linea en funcion de un criterio de clasificacion

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = T)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy,color=cty)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
#Combina los dos graficos

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()
#si quiero clasificacion por colores no olvidar colocarlo dentro aes()

library(tidyverse)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
#solo regresion para una sola clase

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)
#cuando pongo el color= dentor del aes() principal influye en todo si no, no

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(stroke=4)) + 
  geom_smooth(aes(size=3, line),se=F)
#agrande todos los puntos y la linea
?geom_smooth

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(stroke=4)) + 
  geom_smooth(aes(size=3, linetype=drv),se=F)

ggplot(mpg, aes(x = displ, y = hwy, color=drv)) + 
  geom_point(aes(stroke=2)) + 
  geom_smooth(aes(linetype=drv),se=F)

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes( color=drv,stroke=2)) + 
  geom_smooth(aes(size=2),se=F)

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
#con identity le aviso que lo que le estoy pasando es un recuento

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
#en eje de las y pone la proporcion

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
?stat_bin
?geom_bar
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group=1))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group=1))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop),group=1, fill = color))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y=stat(prop), colour = cut, group=T))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))
#raro pq cuando le pongo group para que las proporciones tengan en cuenta el total no me deja
#agregarle mas detalles al grafico

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))
#sin aclarar satat(prop) te deja hacer lo de los colores

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))
#fill con otra variable da info de las proporciones dentro de esta
#aca estan agrupados es decir la suma de todos

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")
#aca estan como los valores propoios de cada categoria

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
#como un histograma de cada uno 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")
#jitter pone todos los puntos originales que no se ven de otra forma
#no solo los alinea si no que tabien saca los superpuestos
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(aes(color = drv),position = "jitter")+
  geom_smooth(se=F)

?geom_jitter()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()
#coord_flip da vuelta las cajas

bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()

