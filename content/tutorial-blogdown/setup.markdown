---
title: "System Setup"

date: 2019-05-01T00:00:00.000Z
lastmod: 2019-05-01T00:00:00.000Z

draft: false # Is this a draft? true/false
toc: true # Show table of contents? true/false
type: docs # Do not modify.

# Add menu entry to sidebar.
linktitle: "Step 0: System Setup"
menu:
  tutorial-blogdown:
    weight: 2
---

## Basic ingredients


For this tutorial, I assume you are an R user and you are familiar with:

* Using the RStudio IDE
* Using GitHub via RStudio
* Installing R packages

I also have [Xcode](https://developer.apple.com/xcode/) and [Homebrew](https://brew.sh) installed- [you will probably need these to download Hugo on a Mac](https://bookdown.org/yihui/blogdown/installation.html). If you don't have either but are on a Mac, this link may help:

* [How to install Xcode, Homebrew, Git, RVM, Ruby & Rails on Mac OS X ](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/)


## Install the blogdown package {#blogdown}

From your RStudio console you can install the blogdown package directly from CRAN, or you can install the development version from GitHub.


```r
install.packages("blogdown")
# or for the development version...
if (!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("rstudio/blogdown")
```


## Stop right here

If you are able to push/pull from a local RStudio project to an online GitHub repository, stop right here and move along to the [next section](../03_blogdown-github).

![](https://media.giphy.com/media/86EWcWkruTHPO/giphy.gif)

If you cannot (or you have no idea what I am talking about), I suggest you follow the below instructions.

---

## Install R {#r}

* A [recent version of R](https://cran.rstudio.com/) is recommended but not required.
  * Scared to update? Read [these instructions](https://whattheyforgot.org/maintaining-r.html#how-to-transfer-your-library-when-updating-r).
  
## Install RStudio {#rstudio}
* [RStudio](https://www.rstudio.com/products/rstudio/download/preview/) 
  * I recommend downloading the [preview version](https://www.rstudio.com/products/rstudio/download/preview/) so you can have the option to show [hidden files like .gitignore](https://github.com/rstudio/rstudio/issues/1769)
    ![](https://user-images.githubusercontent.com/470418/39076409-ece2f37c-44af-11e8-8dd9-f2cc46f6ce0d.png)

The next sections walk you through the free, online book ["Happy Git with R"](http://happygitwithr.com) by Jenny Bryan.

## Install Git

1. [Register a GitHub account](http://happygitwithr.com/github-acct.html)
1. [Install Git](http://happygitwithr.com/install-git.html) 
1. [Introduce yourself to Git](http://happygitwithr.com/hello-git.html)

## Connect Git, GitHub, RStudio

1. [Connect to GitHub](http://happygitwithr.com/push-pull-github.html)
1. Do one of the following:
    - [Cache credentials for HTTPS](http://happygitwithr.com/credential-caching.html)
    - [Set up keys for SSH](http://happygitwithr.com/ssh-keys.html)
1. [Connect RStudio to Git and GitHub](http://happygitwithr.com/rstudio-git-github.html)

## Test-drive

We will follow a ["New project, GitHub first" workflow](http://happygitwithr.com/new-github-first.html). This means that if you want to work locally, you'll want to be comfortable doing the following steps:

1. [Make a repo on GitHub](http://happygitwithr.com/new-github-first.html#make-a-repo-on-github-1)
1. [Make a new RStudio project via git clone](http://happygitwithr.com/new-github-first.html#new-rstudio-project-via-git-clone)
1. [Make local changes, save, commit](http://happygitwithr.com/new-github-first.html#make-local-changes-save-commit-1)
1. [Push your local changes to GitHub](http://happygitwithr.com/new-github-first.html#push-your-local-changes-to-github)


