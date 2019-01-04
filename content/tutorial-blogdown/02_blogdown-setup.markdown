---
title: "System Setup"

date: 2018-09-09T00:00:00.000Z
lastmod: 2018-09-09T00:00:00.000Z

draft: false # Is this a draft? true/false
toc: true # Show table of contents? true/false
type: docs # Do not modify.

# Add menu entry to sidebar.
linktitle: "System Setup"
menu:
  tutorial-blogdown:
    parent: "01-Getting Started"
    weight: 2
---


For this tutorial, we'll assume familiarity with:

* Using the terminal (I use the [terminal within RStudio](https://blog.rstudio.com/2017/08/11/rstudio-v1-1-preview-terminal/))
* R
* Using the RStudio IDE
* Git and GitHub

If you are not comfortable with all of these, here are some places to get started:

* For Git/GitHub: [Happy Git with R](http://happygitwithr.com) by Jenny Bryan et al.
* For RStudio: [DataCamp's Working with the RStudio IDE (free)](https://www.datacamp.com/courses/working-with-the-rstudio-ide-part-1) by Garrett Grolemund
* For Terminal: 
  * [The Command Line Murder Mystery](https://github.com/veltman/clmystery) by Noah Veltman, and 
  * [The UNIX Workbench](http://seankross.com/the-unix-workbench/) by Sean Kross

I also have [Xcode](https://developer.apple.com/xcode/) and [Homebrew](https://brew.sh) installed- [you will probably need these to download Hugo on a Mac](https://bookdown.org/yihui/blogdown/installation.html). If you don't have either but are on a Mac, this link may help:

* [How to install Xcode, Homebrew, Git, RVM, Ruby & Rails on Mac OS X ](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/)


## Install R {#r}

* A [recent version of R](https://cran.rstudio.com/) (>= 3.5.1 "Feather Spray") is recommended but not required.
  * Scared to update? Read [these instructions](https://whattheyforgot.org/maintaining-r.html#how-to-transfer-your-library-when-updating-r).
  
## Install RStudio {#rstudio}
* [RStudio](https://www.rstudio.com/products/rstudio/download/preview/) (>= 1.2)
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


