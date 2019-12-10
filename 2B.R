require(ggplot2)
require(GGally)
require(readxl)
require(viridis)
require(hrbrthemes)

#sets any dependencies in order to use the script


setwd("D:/Skola/VIS4/Uppgift 2")

#sets the working directory of the script,
#which acts as the default directory and
#where all data is taken from and saved to


italienskaoljor <- read_xlsx("VIS4 Oljor.xlsx")

#reads the given excel-sheet into an variable
#to be used for creating the diagram later on
#in the script


ggparcoord(data = italienskaoljor,
           col = 4:11,
           groupColumn = 2,
           scale = "uniminmax",
           alphaLines = 0.3,
           showPoints = FALSE) +
  
#creates the diagram according to the definied data, grouping it
#and scaling it to a uniform scale 0 to 1. Also sets the lines
#to be slightly opaque.


  theme_ipsum() +
  scale_color_viridis(discrete = TRUE) +
  theme(axis.title.y =
          element_text(angle = 0,
                       hjust = 1,
                       vjust = 1,
                       size = 15),
        axis.title.x =
          element_text(angle = 0,
                       hjust = 0.5,
                       vjust = 0,
                       size = 15),
        axis.text.x =
          element_text(size = 15),
        axis.text.y =
          element_text(size = 15),
        plot.title =
          element_text(hjust = 0.5,
                       size = 17),
        plot.subtitle =
          element_text(hjust = 0.5,
                       size = 14),
        plot.caption =
          element_text(hjust = 0,
                       vjust = 0,
                       size = 13),
        panel.grid.major.x =
          element_line(color = "gray"),
        panel.grid.minor.x =
          element_line(color = "light gray"),
        panel.grid.major.y =
          element_line(color = "gray"),
        panel.grid.minor.y =
          element_line(color = "light gray"),
        legend.text =
          element_text(size = 14)) +

#sets the theme and location, colors and sizes of x & y-axis text,
#titles and grid-lines for the diagram

  
  labs(title = "Syrahalten i italienska olivoljor",
       x = "Syror",
       y = "Andel",
       caption = "Källa: Forina, Armanino, Lanteri, Tiscornia (1983) Classification of Olive Oils from their Fatty
          Acid Composition, in Martens and Russwurm (ed) Food Research and Data Analysis")

#sets the title name of the diagram, as well as the source and names
#of the x and y-axis