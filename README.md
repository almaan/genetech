# Gene Technology Lab Course

- [Introduction](#introduction)
- [Getting started with Posit cloud](#getting-started-with-posit-cloud)
- [Guidelines](#guidelines)
    - [Hand-ins](#hand-ins)
    - [Deadlines](#deadlines)
    - [Late or incomplete reports](#late-or-incomplete-reports)
- [R - a primer](#r---a-primer)
- [FAQ](#faq)
- [Contact Information](#contact-information)

## Introduction

Hello and welcome to the Gene Technology lab course landing page! This GitHub
repository contains all the instructions and material for the computer labs for
the two courses [CB2040](cb2040.md) and [BB2255](bb2255.md) (CB204V students should 
follow the material for BB2255). Since the two aforementioned courses have a large 
overlap in content we store it at the same place.

For the computer labs, we'll be using the programming language [R](#r---a-primer) which is particularly 
useful for statistical computing and data visualization. R is together with Python one 
of the most popular languages for biological research and comes with a large ecosystem 
of open source packages to process and analyze biological data. 

As we (the TAs) are constantly trying to improve the course, we have decided to try 
something new for this year that we are hoping will make it easier for you to get started. 
Previous years, we have tried to provide instructions for how to set up a working R 
environment on the students own laptops, but we have realized that this is quite the 
challenge since students have access to different hardware and operating systems. We don't
want you to spend hours and hours stuck trying to intepret and solve error messages, so 
instead we are going to use a cloud based solution that only requires you to have a 
decent internet connection!

["Posit Cloud"](https://posit.cloud/) (formerly [RStudio cloud](https://rstudio.cloud/)) 
is a cloud-based solution where everything is preinstalled and ready 
to go. You will be provided with login details so that you can start coding directly 
from a web browser. 

Information about the computer exercises relevant for each respective course is found here:

- [CB2040](cb2040.md)
- [BB2255 (CB204V)](bb2255.md)

**Note**: read through this page before switching to your course specific page.

## Getting started with Posit cloud

Before you start working, you should have received an invite from the TAs. If
you click on the invite you will be redirected to this page where you can setup 
a new account:

![join-rstudio-cloud](imgs/join.png)

When you have created an account and is logged in to Posit cloud, you should 
see something like this:

![assignment-contributor](imgs/assignmentContributor.png)

If it's the first time you log in, you press the start button which will create 
a copy of the "genetech" project that will be your own. If you already have created a copy, 
you will see a continue button to access your project.

When you have opened the project, you should see the RStudio IDE (see image below).

1. __Text editor__ - This is where you will be able to modify files. We will be working with
the rmarkdown format where you can combine text and code.
2. __Console__ - Here you can run code outside of the rmarkdown file. All the code you run, either
in the rmarkdown file or in the console, share the same environment. This means that if you modify 
an object in the console, it might overwrite objects that you work on in the rmarkdown file and 
vice versa.
3. __Environment__ - Here you can see a list of all the variables created in your current environment. 
You can get infomation about properties of the variables and you can explore also expore their content.
4. __Files/Plots/Packages/Help/Viewer__ - Here you can access and interact with files stored locally 
and get documentation for certain R packages and functions. This is also where plots show up when 
executing code in the console. 

![rstudio-ide](imgs/RStudio_server_highlighted.png)

## Guidelines

### Hand-ins

All labs will start with something similar to this:

```{yaml}
---
title: "Introduction to R"
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

Before you "knit" the repory, please make sure that you are not printing the content of any large objects. 
For example, do not print the content of expression matrices as this will fill up the notebook:

````
# DO NOT DO THIS
print(counts)
````

When you have written your answers in the rmarkdown document, you need to "knit" the document into an HTML 
file. First, you click on the Knit button and choose "Knit to HTML" which will trigger the knitting process. 
When the process has finished, you should see a file called `main.html` in the file explorer (bottom right). 

![knit](imgs/knit.png)

To download the `main.html` file, you can check the box next to it :ballot_box_with_check:, press the cog wheel :gear: icon above and select "Export..." from the dropdown menu.
Now you get a popup where you can chose a file name and download the file to your computer. This is the file that you will upload 
on Canvas! 

**Make sure that you can open the file and that you can see the content of it before uploading.**

![image](https://user-images.githubusercontent.com/27061883/192314278-7dc71f81-6889-4979-a684-77a3a1da53f3.png)

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

## FAQ

> My Rmarkdown code snippet won't run on Posit (RStudio) Cloud. I just get a :clock1: symbol where its waiting to run the code. 

- Try to restart the current environment. Go to the `Session` dropdown menu and click `Restart R`. 
- If you have an Adblocker running, disable it for the Posit Cloud webpage. 

## Contact Information

* Sami Saarenpää : sami.saarenpaa@scilifelab.se
* Pontus Höjer : pontus.hojer@scilifelab.se
* Nayanika Bhalla : nayanika.bhalla@scilifelab.se
* Marco Vicari : marco.vicari@scilifelab.se
* Solène Frapard : solene.frapard@scilifelab.se
* Mengxaio He : mengxiao.he@scilifelab.se
* Artemy Zhigulev : artemy.zhigulev@scilifelab.se
* Xiya Song : xiya.song@scilifelab.se
