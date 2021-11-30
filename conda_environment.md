# Setting up an anaconda environment

Anaconda is a package and virtual environment manager which is quite useful for a number of reasons. 
For example, let's say that you have been working on a R coding project for a few years, and during this time,
there have been a new release of R as well as some of the packages that you have been using. You are not quite 
sure how these updates will affect your code, but you are interested in using these latest releases for a new project. 
In this case, a virtual environment can be quite handy! 

Inside virtual envoronments, you can specify exactly what R distribution to use as well as R package versions. 
Since you can have as many virtual environments as you want, you can just create one for each project. Then, 
whenever you want to work on an old project again, you simply need to activate the project virtual environment. 
This is just one use case for anaconda, but it's a very useful one.

## Install

Go to the [anaconda website](https://www.anaconda.com/products/individual) and find the link for the installer.
Here we will use the MacOS 64-bit Command Line Installer: https://repo.anaconda.com/archive/Anaconda3-2021.11-MacOSX-x86_64.sh

* For windows, you can just use the graphical installer.

Open a new terminal window, download the installer and run the script:

```
wget https://repo.anaconda.com/archive/Anaconda3-2021.11-MacOSX-x86_64.sh
sh Anaconda3-2021.11-MacOSX-x86_64.sh
```

You can check that anaconda was successfully installed by running.

```
conda --version
```

## Create a virtual environment

Virtual environments can be created by running:

```
# DO NOT RUN
conda create --name myenv
```

where `myenv` is the name of your virtual environment. Once this environment has been created,
you can activate it by running:

```
# DO NOT RUN
conda activate myenv
```

Now that the environment is activated, you can install a specific version of R which will just 
be accesible within this environment. Same for R packages, anything you install here will only 
be accesible within the environment.

Below, we will demonstrate how to create a virtual environment for the cb2040/bb2255 lab courses.
We have created a `.yml` file for you which holds information about what specific R version
and R package versions are required to run the labs. You can think of the `.yml` file as a recipe
for creating your environment. 

```
conda env create -f environment.yml
```

If this is successful, you should now be able to activate the `genetech` environment:

```
conda activate genetech
```

Now you should also be able to launch RStudio within this environment:

```
rstudio
```

NOTE: You have to launch RStudio within the environment, not just open the RStudio desktop 
application, otherwise you will not have access to the virtual environment from RStudio.