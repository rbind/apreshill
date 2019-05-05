---
title: "Create a new RStudio Project via git clone"

date: 2019-05-01T00:00:00.000Z
lastmod: 2019-05-01T00:00:00.000Z

draft: false # Is this a draft? true/false
toc: true # Show table of contents? true/false
type: docs # Do not modify.

# Add menu entry to sidebar.
linktitle: "Step 2: New RStudio Project"
menu:
  tutorial-blogdown:
    weight: 4
---


Now you will clone your remote repository *and* create a local copy on your computer so you can sync between the two locations. In one fell swoop, we'll also create a [new RStudio project](http://happygitwithr.com/new-github-first.html#new-rstudio-project-via-git-clone).

![](/img/tutorials/blogdown-signpost-2.png)


1. _File > New Project > Version Control > Git_. 
1. In the "repository URL" paste the URL of your new GitHub repository. It will be something like either:
    - https://github.com/apreshill/apreshill.git ([HTTPS version](http://happygitwithr.com/credential-caching.html))
    - git@github.com:apreshill/apreshill.git ([SSH](http://happygitwithr.com/ssh-keys.html))
1. Press the _tab_ key to automatically fill in the project name.
1. Check **Open in new session**
1. Click on the **Create Project** button

![](/img/tutorials/rstudio-clone.png)


## Check-in {#checkin}

You should now be "in" your project in RStudio. Are you there?

## Update .gitignore file {#gitignore}

If you are using git for version control, edit your `.gitignore` file. This file should be viewable in your file viewer pane in RStudio. Below is what it should look like: the first four lines will automatically be in this file if you have set up your RStudio Project, but if you plan to use Netlify to deploy, you need to add the `public` line ([read about here](https://bookdown.org/yihui/blogdown/version-control.html).)

```
.Rproj.user
.Rhistory
.RData
.Ruserdata
blogdown
.DS_Store # if a windows user, Thumbs.db instead
public # if using Netlify
```

## Update project options {#options}

In your project in RStudio, go to the top menu bar of RStudio and select `Tools -> Project Options` and update following [our instructions](https://bookdown.org/yihui/blogdown/rstudio-ide.html#fig:project-options).

![](https://bookdown.org/yihui/blogdown/images/project-options.png)

