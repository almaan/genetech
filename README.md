# Genetech Lab Course

## For Whom?

This repo contains all the material for the computer labs associated with the
course CB2040.

You will find the all the essential information regarding these labs within this
repo, such as guidelines regarding the execution of the labs, contact
information, deadlines and brief descriptions of the labs with links to material
that might be of help to you.

Make sure that you have Docker installed and the latest imaged pulled from the
Docker repo, as described on the "master" page of this repository.

The slides from the first lecture (introduction) can be found
[here](https://almaan.github.io/genetech).

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
Whilst R as a language in no way is superior to for example Python or Julia, as
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

## :dna: Lab 1 | Basic R programming and markdown :dna:

**Main Responsible TA:** TBA<br>
**Lab Status:** Ready :+1: <br>

Here you will familiarize yourself with some of the basic syntax and
documentation in R. This lab will lay the foundation for the two next labs,
where the focus will be more on analyzing data with the help of certain
bioinformatic packages. Thus it is imperative that you put effort into learning
how to orient yourself in R.

### Preparatory work
Before Lab 1 starts make sure that you:

*TBA: Sami do we need some instructions here for RStudio cloud?*

### Hand-in

In addition to changing the author information (see Guidelines section below),
also change the variable `GRADE_MODE` from `FALSE` to `TRUE` before handing in
the lab, if your lab knitts without any complications, you have solved all the
exercises correctly. Note that this is only necessary for lab 1.

### Resources

- Rmarkdown cheat sheet: [LINK](https://raw.githubusercontent.com/rstudio/cheatsheets/master/rmarkdown-2.0.pdf)
- Learn X in Y minutes (R): [LINK](https://learnxinyminutes.com/docs/r/)
- Swirl, Learn R in R: [LINK](https://swirlstats.com/)


## :dna: Lab 2 | Data visualization and Bulk RNA-seq analysis :dna:
**Main Responsible TA:** TBA<br>
**Lab Status:**  Ready :+1: <br> 

RNA sequencing (RNA-seq or bulk RNA-seq) has been a golden standard in life sciences for more than a decade. 
It uses next-generation sequencing (NGS) to quantify the RNA molecules in a biological sample and it is able to find differentially expressed genes at a sample level.
It is commonly used in case-control studies, eg. to study an effect of a new drug to a tissue.
For a long period of time RNA-seq has been the only available high-throughput method to study gene expression and it has had a huge impact on molecular biology enabling researches to study genome-wide gene expression patterns in biological samples.

This lab consists of two parts. 
First you will be introduced to ggplot2, a widely-used R package for visualisation. 
This will be used in this lab, but also later on in the course and even later during your studies. 
The second part will concentrate on RNA-seq.
You will be introduced to a RNA-seq analysis pipeline including pre-processing, quality control,  normalisation and differential gene expression using DESeq2 to find differentially expressed genes.

### Preparatory work
For the best experience we recommended that you read up a bit on the following
concept, still it will be briefly explained in the lab:

* DESeq2, DE-analysis tool presented [here](https://www.youtube.com/watch?v=UFB993xufUU&t=1s)) and [here](https://www.youtube.com/watch?v=Gi0JdrxRq5s))


## :dna: Lab 3 | Single Cell RNA-seq analysis :dna:
**Main Responsible TA:** Ludvig Larsson<br>
**Lab Status:** Ready :+1: <br>

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

## :dna: Lab 4 | Spatial Transcriptomics analysis :dna:

**Main Responsible TA:** TBA<br>
**Lab Status:** <span style="color:red"> Being Proofread | Final release @ 2022-10-13</span>:hourglass_flowing_sand:<br> 

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
* Matrix Factorization
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
author: "John Doe"
date: "10-13-2022"
output:
  html_document
/---
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

* Sami Saarenpää : sami.saarenpaa@scilifelab.se
* Ludvig Larsson : ludvig.larsson@scilifelab.se
* Nayanika Bhalla : nayanika.bhalla@scilifelab.se
* Pontus Höjer : pontus.hojer@scilifelab.se
* Marco Vicari : marco.vicari@scilifelab.se

