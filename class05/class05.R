#Load ggplot library
library(ggplot2)

#Plot default cars dataset
ggplot(cars) +

#Add aesthetic layer w/ axes
  aes(x = speed, y = dist) +

#Add geometric layer to display points
  geom_point() +

#Add a trendline
  geom_smooth(method = "lm", se = FALSE) +

#Add axis labels
  labs(title = "Speed and Stop Distance in Cars",
       x = "Speed (mph)",
       y = "Stopping Distance (ft)",
       subtitle = "idk",
       caption = "Dataset: 'cars'") +

#Add conservative black and white theme
  theme_bw()

################################################################################

#Load in anti-viral drug test data
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

#Find number of genes
nrow(genes)
#5196 genes

#Find name/number of columns
ncol(genes)
colnames(genes)
#4 columns, named "Gene" "Condition 1" "Condition2" "State"

#Find number of upregulated genes
table(genes$State)
#127 genes

#Find fraction of upregulated genes
round(table(genes$State)[3] / nrow(genes) * 100, 2)
#2.44%

#Gene plot
ggplot(genes) +
  aes(x = Condition1, y = Condition2) +
  geom_point()

################################################################################

#Combining plots example
library(patchwork)

# Setup some example plots 
p1 <- ggplot(mtcars) + geom_point(aes(mpg, disp))
p2 <- ggplot(mtcars) + geom_boxplot(aes(gear, disp, group = gear))
p3 <- ggplot(mtcars) + geom_smooth(aes(disp, qsec))
p4 <- ggplot(mtcars) + geom_bar(aes(carb))

# Use patchwork to combine them here:
(p1 | p2 | p3) /
  p4

