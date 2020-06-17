#!/usr/bin/Rscript

## Installation Script for GeneTech course

# get installed packages
i.pkgs <- rownames(installed.packages())

# packages on CRAN
n.pkgs <- c("BiocManager",
            "dplyr",
            "ggplot2",
            "knitr",
            "jpeg",
            "pheatmap",
            "Seurat",
            "rmarkdown",
            "viridis"
          )

# packages on Bioconductor
b.pkgs <- c("SNPRelate",
            "airway",
            "GenomicRanges",
            "snpStats",
            "SummarizedExperiment",
            "ggbio",
            "DESeq2"
            )

# to collect stats
success <- c()
fail <- c()

# install CRAN based packages
for (p in n.pkgs) {
  # check if already installed
  if (!(p %in% i.pkgs)){
    # try-catch install
    stat <- try(install.packages(p,
                                 repos = "https://ftp.acc.umu.se/mirror/CRAN/"))

    # add status
    if (!(is.null(attr(stat,"class")))) {
      fail <- c(fail,p)
      } else {
        success <- c(success,p)
      }
  } else {
    success <- c(success,p)
  }
}

# install Bioconductor packages
for (p in b.pkgs) {
  # check if already installed
  if (!(p %in% i.pkgs)){
    # try-catch install
    stat <- try(BiocManager::install(p))
    # add status
    if (!(is.null(attr(stat,"class")))) {
      fail <- c(fail,p)
    } else {
      success <- c(success,p)
    }
  } else {
    success <- c(success,p)
  }
}

# log-message construction
success <- ifelse(is.null(success),
                  "NONE\n\n",
                  paste(success,collapse = "\n"))

fail <- ifelse(is.null(fail),
               "NONE\n\n",
               paste(fail,collapse = "\n")
               )

txt <- paste(c("\n----\n",
               "Successful installs:\n",
               "----\n",
               success,
               "\n\n----\n",
               "Failed installs\n",
               "----\n",
               fail),
               collapse  = "")

# print summary message
cat(txt)
# write summary message to log-file
cat(txt,
    file = "install-log.txt")
