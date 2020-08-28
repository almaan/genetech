# Genetech Lab Course

## For Whom?

This repo contains all the material for the computer labs associated with the
two courses CB2040 or BB2255 (which overlap to a large extent); the only difference between the two is that the latter (BB2255) has one less lab session, meaning that:

* Students from CB2040 should do : Lab 1, Lab 2, Lab 3 and Lab 4
* Students from BB2255 should do : Lab 1, Lab 3 and Lab 4


You will find the all the essential information regarding these labs within this
repo, such as guidelines regarding the execution of the labs, contact
information, deadlines and brief descriptions of the labs with links to material
that might be of help to you.

The slides from the first lecture (introduction) can be found [here](link).

## R - a primer

* **What is R?:** R is an interpreted programming language, just like python, in
short meaning you do not have to compile your code in order to run it. R was
first released in 1993, it has become widely popular among statisticians due to
a vast array of libraries which allows for seamless implementation of several
statistical techniques such as GLM's (generalized linear models), classical
statistical testing, clustering and classifiers.  Bioinformatics in large can be
considered as statistics applied to biological data, hence R with it's rich
library of tools for statistical analysis has become popular to use among
bioinformaticians.

* **Why use R?:** The usefulness of a language is too a large
extent dependent on the community, and people contributing with libraries.
Whilst R as an language in no way is superior to for example Python or Julia, as
of now the set of available tools for bioinformatic analysis in R by far exceeds
the others. This allows you to conduct advanced analyses with just a few lines
of code rather than several hundreds or thousands. Popular machine learning
frameworks such as TensorFlow have also started to provide an interface for
usage in R, meaning that more complex statistical inference using techniques
from machine learning like CNN's, Autoencoders and LSTM's now can be utilized
with ease as well.

* **Where to get R?:** You can download R to your personal computer, following
the instructions at the official webpage. If you are unfamiliar with R or do not
have an extensive programming background using the IDE Rstudio is something we
recommend - though you are of course free to use your favorite IDE or text
manager (like Vim or Emacs).

  * Download R - [LINK](https://ftp.acc.umu.se/mirror/CRAN/)
  * Download RStudio [LINK](https://rstudio.com/products/rstudio/download/#download)


* **Where to start?** The first computer lab will focus on learning the basics
of R, and we will assume that you have zero previous experience with the
language, hence that could figure as your first starting point. Nevertheless, if
you want to place yourself in a very good position and gain somewhat of a
headstart we'd recommend you to have a look at some of the online tutorials out
there, there's plenty to choose from ("R programming tutorial" has `1 390 000
000` hits on google... ), so at least one should be compatible with your
preferred way of learning.

## Lab 1 | Basic R programming and markdown

**Main Responsible TA:** Alma Andersson<br>

Here you will familiarize yourself with some of the basic syntax and
documentation in R. This lab will lay the foundation for the two next labs,
where the focus will be more on analyzing data with the help of certain
bioinformatic packages. Thus it is imperative that you put effort into learning
how to orient yourself in R.

### Preparatory work
Before Lab 1 starts make sure that you:

1. Install R
2. Clone this repo (see below)
3. Install R packages for Lab 1 (see below)
4. Install Rsdtudio or an IDE that can process R Markdown files

execute the above steps in the order that they are given.

### Cloning the repo

Git is a system developed for distributed version control, which basically means
that meaning that it prevents people working on the same project from
overwriting each other's code, you can think of it as a sort of "Google Docs"
for programming (but way more sophisticated).

You will create a copy the code that we (the TAs) have put up here by _cloning_
this repository. To do this, open the terminal and:

1. Orient yourself to a directory where you want to put all the material
2. Run the command `git clone https://github.com/almaan/genetech.git`

The files will be downloaded and found in a subfolder of your current directory
called `genetech`. 

### R packages - Installation

As mentioned above, the real value of R comes with its large ecosystem of
_packages_ which contain several nifty features that makes it easier to conduct
our analysis. In short, a package is code written by someone else that spares
you from having to write thousands of lines of code.

While packages saves us **a lot** of work, they can also cause some headaches -
mainly when one is trying to install them. To - hopefully - make this process
slightly less painful for you, we've prepared an installation script for you.
Thus what you should do in order to install all the packages you need for this
course, is to:

1. Install R (you cannot install R packages before you have installed R)
2. From the terminal run the file `install-packages.R`, to do so:
    1. Open the terminal
    2. Go to the directory this cloned repo (the one called `genetech`)
    3. Change directory to `labs/prep`
    4. Run the command `Rscript --vanilla .install-packages.R**


### Hand-in

In addition to changing the author information (see Guidelines section below),
also change the variable `GRADE_MODE` from `FALSE` to `TRUE` before handing in
the lab, if your lab knitts without any complications, you have solved all the
exercises correctly.

## Lab 2 | Bulk RNA-seq analysis
**Main Responsible TA:** Sami Saarenpää<br>
TBA

## Lab 3 | Single Cell RNA-seq analysis
**Main Responsible TA:** Ludvig Larsson<br>
TBA

## Lab 4 | Spatial Transcriptomics analysis

**Main Responsible TA:** Alma Andersson<br>

In this lab you will work with Spatial Transcriptomics (ST) data (as prestend by
Ståhl et.al). While similar to single cell data in some ways, there
are also some important differences. One thing that's extremely attractive with
ST-data is that the very design of the method allows us to visualize the gene
expression in the physical 2D plane - which is one of the exercises in this lab.
You will also apply some of the concepts introduced in Lab2, in order to make
sense of your spatial data.

### Preparatory work
You should more or less have all tools required to conduct this lab on your computer, 
meaning you won't have to install plenty of new packages. However, we recommended 
that you read up a bit on the following concepts:

* Spatial Transcriptomics (The method presented [here](https://science.sciencemag.org/content/353/6294/78))
* Dimensionality Reduction (Focus on PCA) 
* Clustering (Focus on Kmeans)

## Guidelines

### Hand-ins

All labs should be handed in via Canvas, they should be provided as a
**knitted** `html` file, raw markdown files will not be corrected but rather
sent back for you to knit.

All labs will start with something similar to this:


```{yaml}
---
title: "Lab 1 - Introduction to R"
author: "Alma Andersson"
date: "11-09-2020"
output:
  tufte::tufte_html: default 
---
```
When you hand in the modified lab, change the author field to your name(s).

### Workload

Programming and this type of analysis is best learnt by doing; hence we
encourage and strongly recommend that you work alone. But you may work in pairs
if that is what you prefer, however groups of more than two people are **not**
accepted. If you do work in pairs, please state who you are working with in the
report and comment section of your hand in, also make sure BOTH of you hand in a
copy of the report (identical).

### Deadlines

* **Your Deadlines:** You will have one week to complete each lab and hand in
  the report for that specific lab. Meaning if your lab is on Monday week T then
  it should be handed in no later than Monday 23:59:59 week T+1. Red days and
  holidays (aside from Saturday and Sunday) will be taken into consideration.

* **Our Deadlines:** We will make sure to grade all reports within one week
  after your deadline (with exception for late reports, see below). Meaning if
  your lab is on Monday week T then it should have been corrected no later than
  Monday 23:59:59 week T+2. Red days and holidays (aside from Saturday and
  Sunday) will be taken into consideration.

### Late or incomplete reports

* If you hand in your report late, we will still correct it. But you will be
  given an extra assignment to complete, information regarding the deadline for
  this assignment is given by us if such a scenario arise. Finally, note that a
  report is only considered as handed in when all questions have been answered -
  meaning that handing in a report with only 50% of the questions answered
  before the deadline will not be considered as "in time".

* If you hand in a report that we do not consider of high enough quality, (i.e.
  questions have been answered incorrectly), you will be given a second attempt
  to complete the report. We will accept two iterations of this procedure (i.e.
  you will be given two chances to hand in a sufficiently good report additional
  to your first). If you after two attempts still have not provided us with a
  report of acceptable quality, you will be given an extra assignment, along
  with more explicit details of what you need to change in order for your
  original report to pass.

## Contact Information

* Alma Andersson : almaan [at] kth.se
* Sami Saarenpää : sami.saarenpaa [at] scilifelab.se
* Ludvig Larsson : ludvig.larsson [at ] scilifelab.se

