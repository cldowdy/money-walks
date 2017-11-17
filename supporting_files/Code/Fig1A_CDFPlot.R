require("reshape")
require("ggplot2")

df <- data.frame(gp = factor(rep(letters[1:3], each = 10)),
                 y = rnorm(30))
# Compute sample mean and standard deviation in each group
library(plyr)
ds <- ddply(df, .(gp), summarise, mean = mean(y), sd = sd(y))

# Declare the data frame and common aesthetics.
# The summary data frame ds is used to plot
# larger red points in a second geom_point() layer.
# If the data = argument is not specified, it uses the
# declared data frame from ggplot(); ditto for the aesthetics.
ggplot(df, aes(x = gp, y = y)) +
  geom_point() +
  geom_point(data = ds, aes(y = mean),
             colour = 'red', size = 3)

w1 <- read.csv(file="derived_features_validated.csv",sep=",",head=TRUE)
df<-w1[complete.cases(w1),1:21]
#df<-w1[,1:20]

print (nrow(df))

# df<-derived_cust_fin_subsetjuly;
# P1 =ecdf(df$spatial.grid_div);
# P2=ecdf(df$spatial.radial_div);
# P3=ecdf(df$hourly_div);
# 
# P1median=round(median(df$spatial.grid_div),digits=2);
# P2median=round(median(df$spatial.radial_div),digits=2);
# P3median=round(median(df$hourly_div),digits=2);



P1 =ecdf(df$spatial.grid_div);
P2=ecdf(df$spatial.radial_div);
P3=ecdf(df$hourly_div);
P4=ecdf(df$weekly_div);
P1median=round(median(df$spatial.grid_div),digits=2);
P2median=round(median(df$spatial.radial_div),digits=2);
P3median=round(median(df$hourly_div),digits=2);
P4median=round(median(df$weekly_div),digits=2);

# P1 =ecdf(df$spatial.grid_loy);
# P2=ecdf(df$spatial.radial_loy);
# P3=ecdf(df$hourly_loy);
# P4=ecdf(df$weekly_loy);
# P1median=round(median(df$spatial.grid_loy),digits=2);
# P2median=round(median(df$spatial.radial_loy),digits=2);
# P3median=round(median(df$hourly_loy),digits=2);
# P4median=round(median(df$weekly_loy),digits=2);

# P1 =ecdf(df$spatial.grid_reg);
# P2=ecdf(df$spatial.radial_reg);
# P3=ecdf(df$hourly_reg);
# P4=ecdf(df$weekly_reg);
# P1median=round(median(df$spatial.grid_reg),digits=2);
# P2median=round(median(df$spatial.radial_reg),digits=2);
# P3median=round(median(df$hourly_reg),digits=2);
# P4median=round(median(df$weekly_reg),digits=2);


plot(P1, col="red", xlim=c(0,1),ylim=c(0,1.2), main="Diversity: Spatial and Temporal", lwd=5, pch=5, xlab="Loyalty",ylab="CDF(Cumulative Density Function)");
lines(P2, col="green", lty="dashed", lwd=5, pch=5)
lines(P3, col="blue", lty="dashed", lwd=5, pch=5);
lines(P4, col="orange", lty="dashed", lwd=5, pch=5);
abline(v=P1median,col="red", lty="dashed", text(x=P1median, y=1.05, toString(P1median), col="red"))
abline(v=P2median,col="green", lty="dashed", text(x=P2median, y=1.1, toString(P2median), col="green"))
abline(v=P3median,col="blue", lty="dashed", text(x=P3median, y=1.15, toString(P3median), col="blue"))
abline(v=P4median,col="orange", lty="dashed", text(x=P4median, y=1.2, toString(P4median), col="orange"))


# adds titles to the axes 


legend(0,1,# places a legend at the appropriate place 
       c("Spatial:Grid", "Spatial:Radial", "Temporal:Hourly", "Temporal:Weekly"), # puts text in the legend 
       lty=c(1,1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5,2.5),col=c("red", "green", "blue", "orange")) # gives the legend lines the correct color and width


