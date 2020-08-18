library(simstudy)
library(ggplot2)
library(dplyr)
library(gridExtra)
library(grid)
def <- defData(varname = "nr", dist = "nonrandom", formula = 7, id = "idnum")
def <- defData(def, varname = "xCat1", formula = "0.2;0.2;0.5;0.1", dist = "categorical")
def <- defData(def, varname = "xCatB", formula = "0.4;0.07;0.5;0.03", dist = "categorical")
def <- defData(def, varname = "xCatU", formula = "0.21;0.25;0.14;0.17;0.23", dist = "categorical")
def <- defData(def, varname = "xCatM", formula = "0.3;0.1;0.05;0.05;0.25;0.05;.2", dist = "categorical")
dt <- genData(1000, def)


newdf <- dt %>%
  gather(key="Distribution", value="Categories", xCat1:xCatM)
         
ggplot(newdf, aes(x=Categories)) +
  geom_bar() +
  labs(title="Distribution Shape",
       x="Category",
       y="Frequency") +
  scale_y_continuous(limits=c(0,500)) +
  facet_wrap(~Distribution)

         
p1 <-ggplot(dt, aes(x=factor(xCat1))) +
  geom_bar(fill="darkblue") +
  labs(title="Unimodal Distribution",
       x="Category",
       y="Frequency") +
  scale_y_continuous(limits=c(0,500))

p2<-ggplot(dt, aes(x=factor(xCatB))) +
  geom_bar(fill="darkblue") +
  labs(title="Bimodal Distribution",
       x="Category",
       y="Frequency") +
  scale_y_continuous(limits=c(0,500))

p3<-ggplot(dt, aes(x=factor(xCatU))) +
  geom_bar(fill="darkblue") +
  labs(title="Uniforml Distribution",
       x="Category",
       y="Frequency") +
  scale_y_continuous(limits=c(0,500))

p4<-ggplot(dt, aes(x=factor(xCatM))) +
  geom_bar(fill="darkblue") +
  labs(title="Multi Modal Distribution",
       x="Category",
       y="Frequency") +
  scale_y_continuous(limits=c(0,500))


shape <- grid.arrange(p1, p2, p3, p4, as.table=TRUE, top = textGrob("Distribution Shape",
                                                  x = 0, y = 0.5,
                                                  just = "left",
                                                  gp = gpar(fontsize = 14,col="blue")))

ggsave(plot=shape, "/Users/sld8/Dropbox/PLSC309/FA2020/RTutorials/images/DistributionShape.png",  width=5, height=5, units="in")

