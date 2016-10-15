.PHONY: data tests eda regression report clean all

data: data/Advertising.csv
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > data/Advertising.csv

tests:
	cd code && Rscript test-that.R

eda: data/Advertising.csv code/scripts/eda-script.R
	cd code/scripts && Rscript eda-script.R

regression: data/Advertising.csv code/scripts/regression-script.R
	cd code/scripts && Rscript regression-script.R

report: report/report.Rmd
	rscript -e 'library(rmarkdown); render("report/report.Rmd","pdf_document")'
	rscript -e 'library(rmarkdown); render("report/report.Rmd","html_document")'

clean:
	rm -f report/report.pdf
	rm -f report/report.html

all: eda regression report
