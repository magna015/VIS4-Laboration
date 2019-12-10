#install.packages("portfolio")
#install.packages("dplyr")
#install.packages("RColorBrewer")
#install.packages("knitr")


require(portfolio);
source("https://raw.githubusercontent.com/canadice/visualization_literature/master/treemapbrewer.r")
require(dplyr)
require(RColorBrewer)
require(ggplot2)
require(knitr)

dir <- "C:/Users/Joyce Wang/Desktop/statistik/År 1/Visualisering/VIS4"
setwd(dir)
data <- read.csv2("V4 Import exp CSV.csv", sep=";")

#skapa mikrodata --- makrodata
iris_agg <- data %>% group_by(Land) %>% summarise(import_mean = mean( Import_M ), export_mean = mean( Export_M ))

Minsta <- filter(iris_agg, import_mean < 1)

granner <- filter(iris_agg, Land %in% c( "Finland", "Danmark","Tyskland", "Estland", "Lettland", "Litauen", "Polen"))


#kable (iris_agg, format = "excel", caption = "Aggregerad datamaterial för imortp")
Oversikt <- treemap_brewer(id = iris_agg$Land, group = iris_agg$Land, 
               area = iris_agg$import_mean,
               color = iris_agg$ export_mean,
               textcol = "black",
               linecol = "black",
               pal = "Spectral",
               main = "Översikt av Sveriges handelspartner inom EU"
               )

Minst_country <- treemap_brewer(id = Minsta$Land, group = Minsta$Land, 
               area = Minsta$import_mean,
               color = Minsta$ export_mean,
               textcol = "black",
               linecol = "black",
               pal = "Oranges",
               main = "Sveriges minsta handelspartner inom EU"
)

grannland <- treemap_brewer(id = granner$Land, group = granner$Land, 
                            area = granner$import_mean,
                            color = granner$ export_mean,
                            textcol = "black",
                            linecol = "black",
                            pal = "GnBu",
                            main = "Sveriges handel med grannländer inom EU"
)

