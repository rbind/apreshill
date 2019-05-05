---
title: "New posts"

date: 2018-09-09T00:00:00.000Z
lastmod: 2018-09-09T00:00:00.000Z

draft: false # Is this a draft? true/false
toc: true # Show table of contents? true/false
type: docs # Do not modify.

# Add menu entry to sidebar.
linktitle: "New posts"
menu:
  tutorial-blogdown:
    parent: "Activity prompts"
    weight: 8
---




## Archetypes

When you start thinking about adding content, think "archetypes". These are Hugo's templates for each content section. You can see your theme's built-in archetypes in the themes folder:


```r
fs::dir_ls("themes/hugo-academic/archetypes")
```

```
# themes/hugo-academic/archetypes/default.md
# themes/hugo-academic/archetypes/docs.md
# themes/hugo-academic/archetypes/home.md
# themes/hugo-academic/archetypes/post
# themes/hugo-academic/archetypes/project
# themes/hugo-academic/archetypes/publication
# themes/hugo-academic/archetypes/slides.md
# themes/hugo-academic/archetypes/talk
```

Relevant reading:

* [`blogdown` book chapter on RStudio IDE](https://bookdown.org/yihui/blogdown/rstudio-ide.html)
* [`blogdown` book chapter on output formats](https://bookdown.org/yihui/blogdown/output-format.html): on .md versus .Rmd posts
* [Additional detail from Amber](https://proquestionasker.github.io/blog/Making_Site/#adding-a-blog-post-or-portfolio-piece) on adding a blog post

Bottom line:

Use the **New Post** addin. But, you need the console to do this, so you have to stop `blogdown::serve_site` by clicking on the red **Stop** button first. The Addin is a Shiny interface that runs this code in your console: `blogdown:::new_post_addin()`. So, your console needs to be unblocked for it to run. You also need to be "in" your RStudio project or it won't work.

## Draft posts {#drafts}

Relevant reading:

* [`blogdown` book chapter on building a website for local preview](https://bookdown.org/yihui/blogdown/local-preview.html)

Whether you do a markdown or R Markdown post (see below), you should know that in the YAML front matter of your new file, you can add `draft: TRUE` and you will be able to preview your post using `blogdown::serve_site()`, but conveniently your post will not show up on your deployed site until you set it to false. Because this is a function built into Hugo, all posts (draft or not) will still end up in your GitHub repo though.




## New markdown posts {#markdown}

Pick one of 2 methods:

1. Use the **New Post** addin and with the radio button at the bottom select **Format: Markdown** (recommended)
2. Use the console to author a new `.md` post:


```r
blogdown::new_post()
blogdown::new_post(rmd = FALSE) # false is the default!
```

Here are the `?new_post` arguments:


```r
new_post(title, kind = "default", open = interactive(), 
    author = getOption("blogdown.author"), categories = NULL, 
    tags = NULL, date = Sys.Date(), file = NULL, slug = NULL, 
    subdir = getOption("blogdown.subdir", "post"), 
    rmd = getOption("blogdown.rmd", FALSE))
```

{{% alert note %}}
Remember to use the **Serve Site** addin again so that you can immediately view your changes with every save using *LiveReload*.
{{% /alert %}}

## New RMarkdown posts {#rmd}

Again, you have your choice of one of 2 methods:

1. Use the **New Post** addin and with the radio button at the bottom select **Format: RMarkdown** (recommended)
2. Use the console to author a new `.Rmd` post:

```
blogdown::new_post(rmd = TRUE) # false is the default!
```


After you edit your `.Rmd` post, in addition to saving the changes in your `.Rmd` file, you *must* use `blogdown::serve_site`- this is how the output `html` file needs to be generated.   

{{% alert warning %}}
Do *not* knit your `.Rmd` posts- use `blogdown::serve_site` instead. If you happen to hit the knit button, just **Serve Site** again to rewrite the `.html` file.
{{% /alert %}}

Ultimately, your [YAML front matter looks something like this](https://bookdown.org/yihui/blogdown/output-format.html#output-format); note that some but not all features of `rmarkdown::html_document` [are supported in `blogdown`](https://bookdown.org/yihui/blogdown/output-format.html#fn15):

```
---
title: "My Awesome Post"
author: "John Doe"
date: "2017-02-14"
output:
  blogdown::html_page:
    toc: true
    toc_depth: 1
    number_sections: true
    fig_width: 6
---
```



{{% alert note %}}
Remember to use the **Serve Site** addin again so that you can immediately view your changes with every save using *LiveReload* and your `.html` file is properly output.
{{% /alert %}}



## Adding images to a post {#images}

If you want to include an image that is not a figure created from an R chunk, the [recommended method](https://github.com/rstudio/blogdown/issues/45) is to: 

1. Add the image to your `/static/img/` folder, then 
2. Reference the image using the relative file path as follows:

```
![my-image](/img/my-image.png)
```


