# read in the Advertising.csv data set
advertising = read.csv("../../data/Advertising.csv", row.names=1)
tv = advertising$TV
radio = advertising$Radio
newspaper = advertising$Newspaper
sales = advertising$Sales

# compute a "regression" object and the summary of it
reg = lm(sales ~ tv + radio + newspaper)
s = summary(reg)
save(reg, s, file="../../data/regression.RData")
save.image()

# scatterplots
png("../../images/scatterplot-tv-sales.png")
plot(tv, sales, main="Scatterplot between TV and Sales", 
     xlab="TV budgets (in $1000)", ylab="Sales (in 1000)", pch=20, col='navy')
abline(reg$coefficients[1:2], col='red')
dev.off()

png("../../images/scatterplot-radio-sales.png")
plot(radio, sales, main="Scatterplot between Radio and Sales", 
     xlab="Radio budgets (in $1000)", ylab="Sales (in 1000)", pch=20, col='navy')
abline(reg$coefficients[c(1,3)], col='red')
dev.off()

png("../../images/scatterplot-newspaper-sales.png")
plot(newspaper, sales, main="Scatterplot between Newspaper and Sales", 
     xlab="Newspaper budgets (in $1000)", ylab="Sales (in 1000)", pch=20, col='navy')
abline(reg$coefficients[c(1,4)], col='red')
dev.off()

# three diagnostics plots
png("../../images/residual-plot.png")
plot(reg, which=1)
dev.off()

png("../../images/scale-location-plot.png")
plot(reg, which=3)
dev.off()

png("../../images/normal-qq-plot.png")
plot(reg, which=2)
dev.off()