# Multiple Regression Analysis

## About

This repository holds the third homework for the fall 2016 edition of Statistics 159 at UC Berkeley. The goal of this assignment is to reproduce the analysis from Section 3.2 (pages 71 to 82), from the book [An Introduction to Statistical Learning](http://www-bcf.usc.edu/~gareth/ISL/) (by James et al). In addition to practice applying regression analysis in R, the assignment also consists of writing some functions as well as their unit tests.

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

Author: Jie Sun

## File Structure

The complete file-structure for this assignment is the following:

```
stat159-fall2016-hw03/
	.gitignore
	README.md
	LICENSE
	Makefile
	session-info.txt                     # produced by session-info-script.R
	code/
	  README.md
	  test-that.R
	  functions/
	    regression-functions.R
	  scripts/
	    eda-script.R
	    regression-script.R
	    session-info-script.R
	  tests/
	    test-regression.R
	data/
	  README.md
	  Advertising.csv
	  eda-output.txt                      # produced by eda-script.R
	  correlation-matrix.RData            # produced by eda-script.R
	  regression.RData                    # produced by regression-script.R
	images/
		histogram-sales.png                # produced by eda-script.R
		histogram-tv.png                   # produced by eda-script.R
		histogram-radio.png                # produced by eda-script.R
		histogram-newspaper.png            # produced by eda-script.R
		scatterplot-matrix.png             # produced by eda-script.R
		scatterplot-tv-sales.png           # produced by regression-script.R
		scatterplot-radio-sales.png        # produced by regression-script.R
		scatterplot-newspaper-sales.png    # produced by regression-script.R
		residual-plot.png                  # produced by regression-script.R
		scale-location-plot.png            # produced by regression-script.R
		normal-qq-plot.png                 # produced by regression-script.R
	report/
		report.Rmd
		report.pdf
```

## Instructions to Reproduce Everything Here

1. Initialize the file structure on the command line.

  ```
  mkdir your_working_directory
  cd your_working_directory
  touch .gitignore README.md Makefile LICENSE
  mkdir code data images report
  mkdir code/functions code/scripts code/tests
  ```

2. Create a repository both on Github and the local machine. Add changes and make commits if necessary.

  ```
  git init
  git add *
  git commit -m "first commit"
  git remote add origin git@github.com:your_username/your_repo_name.git
  git push -u origin master
  ```

3. Start writing files of your choice. `code/scripts` directory is a good place to start.

    * In `eda-script.R`, compute summary statistics, histograms, matrix of correlations and scatterplot-matrix
    (pairwise scatterplots).

    * In `regression-script.R`, compute a `"regression"` object---via `lm()`---as well as the summary of such regression object---via `summary()`.

    * In `session-info-script.R`, include `library()` calls to ALL the packages used for this project, as well as the output of the function `sessionInfo()`. After you're done, output `session-info.txt` by running:

    ```
    Rscript session-info-script.R
    ```

4. The next part is `functions/`. Write functions to compute values for `RSS`, `TSS`, `RSE`, `R^2` and `F-statistic` which all take an object of class `"lm"` as input.

5. Later on, write `tests/` and `test.R`. For testing purposes, use the data `mtcars` (that comes in R), and compute a multiple regression of `mpg` on `disp` and `hp`.

  ```
  # multiple regression
  reg <- lm(mpg ~ disp + hp, data = mtcars)

  # summary of 'reg'
  regsum <- summary(reg)
  ```
And then compare the outputs of your functions with reference values in `tests/test-regression.R`:

  ```
  # RSS
  sum(reg$residuals^2)

  # TSS
  sum((mtcars$mpg - mean(mtcars$mpg))^2)

  # RSE
  regsum$sigma

  # R2
  regsum$r.squared

  # F-statistic
  regsum$fstatistic[1]
  ```
In `test-that.R`, load the source function file and run the test file.

6. With everything in hand, write a report in `report.Rmd`.

6. Here comes the fun part - `Makefile`. There are seven target files.

  - `data:` will download the file `Advertising.csv` to the folder `data/`
  - `tests:` will run the unit tests of your functions (i.e. executes the code
  in `test-that.R`)
  - `eda:` will perform the exploratory data analysis (i.e. executes the code
  in `eda-script.R`)
  - `regression:` will perform the series of regression analyses (i.e. executes
  the code in `regression-script.R`)
  - `report:` will generate `report.pdf` (or `report.html`)
  - `clean:` will delete the generated report (pdf and/or html)
  - `all:` will be associated to phony targets `eda`, `regression`, and `report`

5. Don't forget about `.gitignore`. Just include files that you don't want Git to track in your project.

6. Wrap up with `LICENSE` and `README.md`.

5. Yay! Let's make! And we're done.

  ```
  make all
  ```
