# Set working dir
setwd("D:/school/BachelorProef/bachelorproef/dataverwerking")

# Use ggpubr for the graphs
require("ggpubr")

# Read csv

# Unit = MB
dataset_apk_size <- read.csv(file = "resultaten_apk_size.csv", sep=",")
# Unit = ms
dataset_boot_time <- read.csv(file = "resultaten_opstarttijd.csv", sep=",")

# plot apk size 
apk_size_plot <- ggbarplot(
  dataset_apk_size, x="system", y="apk.size",
  xlab = "Systeem", ylab= "Applicatie Grootte (MB)")

apk_size_plot

ggexport(apk_size_plot_android, filename = "apk_barplot.png")

# plot boxplots (startup time) 

boxplot_startup <- ggboxplot(dataset_boot_time,x="system",y="startup",xlab = "Systeem",ylab="Tijd tot eerste frame (ms)",add = c("jitter","mean_sd"),add.params = list(color= "darkgray"),bxp.errorbar = TRUE,title = "Opstarttijd van de applicatie", ylim = c(200, 390))
boxplot_startup

ggexport(boxplot_startup, filename = "startup_boxplot.png")
# export to png