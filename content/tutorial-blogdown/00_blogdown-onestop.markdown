---
title: "Overview (tl;dr)"

date: 2018-09-09T00:00:00.000Z
lastmod: 2018-09-09T00:00:00.000Z

draft: false # Is this a draft? true/false
toc: true # Show table of contents? true/false
type: docs # Do not modify.

# Add menu entry to sidebar.
linktitle: "Overview (tl;dr)"
menu:
  tutorial-blogdown:
    parent: "Up & running with blogdown"
    weight: 1
---



![](/img/tutorials/blogdown.gif)

If you are pretty comfortable working with R, RStudio, R projects (`.Rproj`) and GitHub (via RStudio), these steps may be detailed enough for you to get started:

1. Create a GitHub repo (no `README`, no `.gitignore`)
1. Create a new RStudio project by cloning the repo to a local directory
1. Install the `blogdown` R package via `install.packages("blogdown")`
1. Install Hugo via the `blogdown::install_hugo()` function
1. Create a site using a Hugo theme hosted on GitHub via `blogdown::new_site(theme = "user/repo", theme_example = TRUE)`
1. If it doesn't automatically start, use the RStudio Addin to serve your site (renders first in the RStudio Viewer pane, i.e., where your R plots generally render; be sure to click on the teeny-tiny viewer pane and "Show in new window" to view in your local browser)

All together now, once you are "in" your RStudio project that is linked to a remote GitHub repo:


```r
install.packages("blogdown")
library(blogdown)
install_hugo()
new_site()
```


Insert video walk through here
