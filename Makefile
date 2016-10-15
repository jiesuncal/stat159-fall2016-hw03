# shortcut variables for some commands
rs=rscript
code_dir=cd code
scripts_dir=cd code/scripts

.PHONY: data tests eda regression report clean all

# download the dataset
data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > data/Advertising.csv

# run tests
tests: code/test-that.R code/tests/test-regression.R
	$(code_dir) && $(rs) test-that.R

# generate summary statistics, histograms, matrix of correlations and
# scatterplot-matrix
eda: data/Advertising.csv code/scripts/eda-script.R
	$(scripts_dir) && $(rs) eda-script.R

# generate the regression object and its summary
regression: data/Advertising.csv code/scripts/regression-script.R
	$(scripts_dir) && $(rs) regression-script.R

# render report
report: report/report.Rmd eda regression
	$(rs) -e 'library(rmarkdown); render("report/report.Rmd","pdf_document")'
	$(rs) -e 'library(rmarkdown); render("report/report.Rmd","html_document")'

# session
session: code/scripts/session-info-script.R
	$(scripts_dir) && $(rs) session-info-script.R

# clean up report outputs
clean:
	rm -f report/report.pdf
	rm -f report/report.html

# all
all: eda regression report
