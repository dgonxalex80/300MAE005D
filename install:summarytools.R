install.packages("remotes")        # Using devtools is also possible
library(remotes)
install_github("rapporter/pander") # Strongly recommended
install_github("dcomtois/summarytools", build_vignettes = TRUE)



install.packages(c('htmltools', 'matrixStats', 'pander', 'pryr', 
                   'rapportools', 'RCurl', 'Hmisc', 'rstudioapi', 
                   'rmarkdown', 'stringr'))
install.packages('knitr', dependencies = TRUE)
update.packages(ask = FALSE, repos = 'https://cran.rstudio.org')



devtools::install_github('dcomtois/summarytools', ref='0-8-9')