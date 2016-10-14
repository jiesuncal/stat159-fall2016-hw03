# read in the Advertising.csv
advertising = read.csv("../../data/Advertising.csv", row.names=1)
tv = advertising$TV
radio = advertising$Radio
newspaper = advertising$Newspaper
sales = advertising$Sales

# compute summary statistics and matrix of correlations
sink("../../data/eda-output.txt", append=FALSE, split=FALSE)
summary(advertising)
cor_matrix = cor(advertising)
cor_matrix
sink()

# plot histograms for all the variables
png("../../images/histogram-sales.png")
hist(sales, main='Histogram of Sales', xlab='Sales (in 1000)')
dev.off()

png("../../images/histogram-tv.png")
hist(tv, main='Histogram of TV Advertising Budgets', xlab='TV budgets (in $1000)')
dev.off()

png("../../images/histogram-radio.png")
hist(radio, main='Histogram of Radio Advertising Budgets', xlab='Radio budgets (in $1000)')
dev.off()

png("../../images/histogram-newspaper.png")
hist(newspaper, main='Histogram of Newspaper Advertising Budgets', xlab='Newspaper budgets (in $1000)')
dev.off()

# save binary format
save(cor_matrix, file="../../data/correlation-matrix.RData")
save.image()

# scatterplot-matrix (pairwise scatterplots)
png("../../images/scatterplot-matrix.png")
pairs(advertising, main='Pairwise Scatterplot of Advertising Data')
dev.off()
