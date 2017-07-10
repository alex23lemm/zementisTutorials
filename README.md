<!-- README.md is generated from README.Rmd. Please edit that file -->
zementisTutorials
=================

[![Build Status](https://travis-ci.org/alex23lemm/zementisTutorials.svg?branch=master)](https://travis-ci.org/alex23lemm/zementisTutorials)

Overview
--------

zementisTutorials offeres several tutorials around data science, Zementis, and PMML.

Installation
------------

You can install zementisTutorials from github with:

``` r

# install.packages("devtools")
devtools::install_github("alex23lemm/zementisTutorials")
```

Usage
-----

The following courses are currently offered via zementisTutorials and can be executed using the learnr package:

**De-mystifying Data Science**

The course introduces the data science process and common analytics terminology hands-on using R. Students will solve a real-world data science problem on their own. The course is completely self-contained and no prior analytics or R knowledge is required.

``` r

learnr::run_tutorial("data_science_introduction", package = "zementisTutorials")
```

**Zementis Introduction**

Basic introduction to Zementis Server from an end-user perspective. Students will learn how to deploy a ML model to Zementis Server and how to score new data using file uploads, the embedded REST client, an external REST client, and the Zementis Excel Add-In.

``` r

 learnr::run_tutorial("zementis_introduction", package = "zementisTutorials")
```
