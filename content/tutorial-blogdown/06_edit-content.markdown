---
title: "Edit content"

date: 2018-09-09T00:00:00.000Z
lastmod: 2018-09-09T00:00:00.000Z

draft: false # Is this a draft? true/false
toc: true # Show table of contents? true/false
type: docs # Do not modify.

# Add menu entry to sidebar.
linktitle: "Edit content"
menu:
  tutorial-blogdown:
    parent: "Activity prompts"
    weight: 7
---



Now that you have customized your site configurations, it is a great time to focus your energy on content. 

First, take about five minutes to explore the website you published on Netlify- look very carefully at the menu items you have, and then look very carefully at your local `content/` folder. 

*I'll wait*

I'm hoping that here is where you might have a lightbulb moment: your content folder holds all the content you see rendered on your site. Want to change a blog post? That is usually in a folder called `content/blog/` or `content/post`. Want to change an about page? Look for `content/about`. 

These are called "sections" in Hugo lingo- in fact, each folder in `content/` is considered a section. Typically this boils down to folders with markdown files inside, if you are looking at the example site content. For 




To make new content, you'll want to use the 

## Addins & workflow

Relevant reading:

* [`blogdown` book chapter on the RStudio IDE](https://bookdown.org/yihui/blogdown/rstudio-ide.html)


Addins: use them- you won't need the `blogdown` library loaded in the console if you use the Addins. My workflow in RStudio at this point (again, just viewing locally because we haven't deployed yet) works best like this:

1. Open the RStudio project for the site
2. Use the **Serve Site** add-in (only once due to the magic of *LiveReload*)
3. View site in the RStudio viewer pane, and open in a new browser window while I work
3. Select existing files to edit using the file pane in RStudio
4. After making changes, click the save button (don't `knit`!)- the console will reload, the viewer pane will update, and if you hit refresh in the browser your local view will also be updated
5. When happy with changes, add/commit/push changes to GitHub

Having `blogdown::serve_site` running locally with *LiveReload* is especially useful as you can immediately see if you have totally screwed up. For example, in editing my `about.md` file, this error popped up in my console after making a change and I was able to fix the error right away:

```
Started building sites ...
ERROR 2017/06/08 16:22:34 failed to parse page metadata for home/about.md: (18, 6): missing comma
Error: Error building site: Errors reading pages: Error: failed to parse page metadata for home/about.md: (18, 6): missing comma for about.md
```


The above workflow is only for editing existing files or posts, but not for **creating new posts**. For that, read on...
