# Genetech Lab Course

## For Whom?

This repo contains all the material for the computer labs associated with the
course BB2255. Students attending the CB204V course should also follow this 
material.

You will find the all the essential information regarding these labs within this
repo, such as guidelines regarding the execution of the labs, contact
information, deadlines and brief descriptions of the labs with links to material
that might be of help to you.

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

* **Why use R?:** The usefulness of a language is to a large
extent dependent on the community, and people contributing with libraries.
Whilst R as an language in no way is superior to for example Python or Julia, as
of now the set of available tools for bioinformatic analysis in R by far exceeds
the others. This allows you to conduct advanced analyses with just a few lines
of code rather than several hundreds or thousands. Popular machine learning
frameworks such as TensorFlow have also started to provide an interface for
usage in R, meaning that more complex statistical inference using techniques
from machine learning like CNN's, Autoencoders and LSTM's now can be utilized
with ease as well.

* **Where to start?** The first computer lab will focus on learning the basics
of R, and we will assume that you have zero previous experience with the
language, hence that could figure as your first starting point. Nevertheless, if
you want to place yourself in a very good position and gain somewhat of a
headstart we'd recommend you to have a look at some of the online tutorials out
there, there's plenty to choose from ("R programming tutorial" has `2 060 000
000` hits on google... ), so at least one should be compatible with your
preferred ways of learning.

## :dna: Installation session :dna:
**Main Responsible TA:** Marco Vicari<br>
**Time:** Mon 29 Nov, 10:00-12:00<br>

This lecture is an introduction to the hands on part of the course and getting everyone up to speed with working in RStudio Cloud.

## :dna: Lab 1 | Basic R programming and markdown :dna:

**Main Responsible TA:** Sami Saarenpää<br>
**Lab Status:** Ready :+1: <br>
**Working file:** [main.Rmd](labs/ex1/main.Rmd) <br>

Here you will familiarize yourself with some of the basic syntax and
documentation in R. This lab will lay the foundation for the two next labs,
where the focus will be more on analyzing data with the help of certain
bioinformatic packages. Thus it is imperative that you put effort into learning
how to orient yourself in R.

### Preparatory work
Before Lab 1 starts make sure that you have RStudio Cloud setup, as described on the [`master`](https://github.com/almaan/genetech/tree/master) 
page of this repository.

### Hand-in

In addition to changing the author information (see Guidelines section below),
also change the variable `GRADE_MODE` from `FALSE` to `TRUE` before handing in
the lab, if your lab knitts without any complications, you have solved all the
exercises correctly.

### Resources

- Rmarkdown cheat sheet: [LINK](https://raw.githubusercontent.com/rstudio/cheatsheets/master/rmarkdown-2.0.pdf)
- Learn X in Y minutes (R): [LINK](https://learnxinyminutes.com/docs/r/)
- Swirl, Learn R in R: [LINK](https://swirlstats.com/)


## :dna: Lab 2 | Single Cell RNA-seq analysis :dna:
**Main Responsible TA:** Pontus Höjer<br>
**Lab Status:** Ready :+1: <br>
**Working file:** [main.Rmd](labs/ex2/main.Rmd) <br>

Single-cell RNA sequencing (or scRNA-seq) has become one of the most valuable tools 
in genomics to to answer questions about molecular processes at the cellular level. 
For example, scRNA-seq has been used to define new celltypes and cell states, study 
cell to cell interactions, track differentiation processes over time, study responses 
to drugs and much more. scRNA-seq methods have also become important tools in ongoing 
research efforts to create atlases of organs in the human body in efforts such as the 
Human Cell Atlas (HCA). 

In this lab we will explore the popular Seurat R package for single-cell genomics data 
analysis. You will be introduced to some of the most basic steps in a scRNA-seq analysis
workflow including quality control, normalization, batch correction, dimensionality 
reduction, unsupervised clustering and differential expression analysis.

## :dna: Lab 3 | Spatial Transcriptomics analysis :dna:

**Main Responsible TA:** Nayanika Bhalla<br>
**Lab Status:** Ready :+1: <br>
**Working file:** [main.Rmd](labs/ex3/main.Rmd) <br>

In this lab you will work with Visium data, the spatial gene expression of human
breast cancer data! While similar to single cell data in some ways, there are
also some important differences. One thing that's extremely attractive with
spatial transcriptomics data is that the very design of the method allows us to
visualize the gene expression in the physical 2D plane - which is one of the
exercises in this lab. You will also apply some of the concepts introduced in
the previous labs, in order to make sense of your spatial data.

### Preparatory work
For the best experience we recommended that you read up a bit on the following
concepts, still these concepts will be briefly explained in the lab:

* Spatial Transcriptomics (The method presented [here](https://science.sciencemag.org/content/353/6294/78))
* Dimensionality Reduction (Focus on PCA) 
* Clustering
* Latent Dirichlet Allocation (LDA)
* Single cell and spatial transcriptomics data integration (The method we are using is presented [here](https://www.nature.com/articles/s42003-020-01247-y))

## Guidelines

### Hand-ins

All labs should be handed in via Canvas, they should be provided as a
**knitted** `html` file, raw markdown files will not be corrected but rather
sent back for you to knit.

All labs will start with something similar to this:


```{yaml}
---
title: "Lab 1 - Introduction to R"
author: "FirstName1 LastName1, FirstName2 LastName2, ... " # REPLACE WITH YOUR OWN NAME(S) 
date: "`r format(Sys.time(), '%Y-%m-%d')`"
output:
  html_document:
    toc: true
    toc_depth: 3
    toc_float:
      collapse: false
    theme: "readable"
---
```
When you hand in the modified lab, change the author field to your name(s).

### Workload

 We encourage and strongly recommend that you in groups of three or two. 
 Please state who you are working with in the report and comment section of 
 your hand in, also make sure EVERYONE of you hand in a copy of the report (identical).

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

* Sami Saarenpää : sami.saarenpaa@scilifelab.se
* Pontus Höjer : pontus.hojer@scilifelab.se
* Nayanika Bhalla : nayanika.bhalla@scilifelab.se
* Adelina Rabenius : adelina.rabenius@scilifelab.se
* Marco Vicari : marco.vicari@scilifelab.se
