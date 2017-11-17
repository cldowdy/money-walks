doInstall <- TRUE
toInstall <- c("ggplot2")
require(ggplot2)
if(doInstall){install.packages(toInstall, repos = "http://cran.us.r-project.org")}
lapply(toInstall, library, character.only = TRUE)

install.packages("sjPlot")
require(sjPlot)
require(ggplot2)

w1 <- read.csv(file="derived_features_validated.csv",sep=",",head=TRUE)
cmplete=complete.cases(w1)

df2<-w1[cmplete,1:20]
print (nrow(df2))

df2$gender<- factor(df2$gender);
df2$marital<- factor(df2$marital);
df2$education<- factor(df2$education);
df2$working<- factor(df2$working);

model1 <-glm(Trouble~ age+gender+marital+education+working+hourly_div+hourly_loy+hourly_reg, data = df2, family='binomial')
model2 <-glm(OS1Class~ age+gender+marital+education+working+hourly_div+hourly_loy+hourly_reg, data = df2, family='binomial')
model3 <-glm(DaysClass1~ age+gender+marital+education+working+hourly_div+hourly_loy+hourly_reg, data = df2, family='binomial')

# model1 <-glm(Trouble~ age+gender+marital+education+working+weekly_div+weekly_loy+weekly_reg, data = df2, family='binomial')
# model2 <-glm(OS1Class~ age+gender+marital+education+working+weekly_div+weekly_loy+weekly_reg, data = df2, family='binomial')
# model3 <-glm(DaysClass1~ age+gender+marital+education+working+weekly_div+weekly_loy+weekly_reg, data = df2, family='binomial')

# model1 <-glm(Trouble~ age+gender+marital+education+working+spatial.radial_div+spatial.radial_loy+spatial.radial_reg, data = df2, family='binomial')
# model2 <-glm(OS1Class~ age+gender+marital+education+working+spatial.radial_div+spatial.radial_loy+spatial.radial_reg, data = df2, family='binomial')
# model3 <-glm(DaysClass1~ age+gender+marital+education+working+spatial.radial_div+spatial.radial_loy+spatial.radial_reg, data = df2, family='binomial')


# model1 <-glm(Trouble~ age+gender+marital+education+working+spatial.grid_div+spatial.grid_loy+spatial.grid_reg, data = df2, family='binomial')
# model2 <-glm(OS1Class~ age+gender+marital+education+working+spatial.grid_div+spatial.grid_loy+spatial.grid_reg, data = df2, family='binomial')
# model3 <-glm(DaysClass1~ age+gender+marital+education+working+spatial.grid_div+spatial.grid_loy+spatial.grid_reg, data = df2, family='binomial')

#sjp.glm(model1, transformTicks=TRUE)
limits=c(0.0000001, 1000000)

# plot multiple models with legend labels and point shapes instead of value  labels
sjp.glmm(model1, model2, model3, 
         labelDependentVariables=c("Trouble", "Overspending", "Late"),
         showValueLabels=TRUE,
         showPValueLabels=TRUE,
         usePShapes=TRUE,
         nsAlpha=0.7,
         geom.size = 5, 
         geom.colors = "set1",
         showAxisLabels.y = TRUE,
         facet.grid = TRUE,
         axisLimits = limits,
         transformTicks=TRUE,
         geom.spacing=1, 
         labelDigits=1
         )




