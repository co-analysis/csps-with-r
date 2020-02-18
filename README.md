# csps-with-r

Purpose: introducing beginners to R, RStudio and the Civil Survey People Survey data.

The training is currently a single R Markdown file knitted to HTML. The HTML file will be made available online when the GitHub repo is made open.

The document is available here: https://co-analysis.github.io/csps-with-r/

## Important note on the data

The CSPS data used in this document **is not real data**. Instead, it's a 'synthetic' version created using [the {synthpop} package](https://cran.r-project.org/web/packages/synthpop/vignettes/synthpop.pdf).

In short, this means that the data distributions within the variables are preserved, but no response represents a real individual. This means we can get some realistic-looking outputs without any response being from a real individual.

## Future plans

Longer term, this should be developed into a {bookdown} project that covers far more than just the very basics of using R and RStudio. It should also demonstrate more thorough analysis of the CSPS data, like calculating percent-positive scores. 

The book should probably cover some case studies using the {cspstools} package too, as that develops.