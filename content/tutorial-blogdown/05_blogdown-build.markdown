---
title: "Pick theme & serve site"

date: 2018-09-09T00:00:00.000Z
lastmod: 2018-09-09T00:00:00.000Z

draft: false # Is this a draft? true/false
toc: true # Show table of contents? true/false
type: docs # Do not modify.

# Add menu entry to sidebar.
linktitle: "Pick theme & serve site"
menu:
  tutorial-blogdown:
    parent: "02-Build your site"
    weight: 5
---



![](/img/tutorials/blogdown-signpost-4.png)

Now you can finally build your site using the `blogdown::new_site()` function. But **first** you should at least think about themes...

There are over 90 [Hugo themes](https://themes.gohugo.io). All of them are hosted on GitHub, so using them essentially means that you download a zip file containing all the theme files into a directory within your project. In the blogdown book, we offer a [shorter list of strong themes](https://bookdown.org/yihui/blogdown/other-themes.html). I went with [hugo-academic](https://github.com/gcushen/hugo-academic). Some things to consider as you choose your theme:

1. It can be very hard to switch themes, so choose wisely.
1. When was the last file updated on the GitHub repo? 
1. How many issues are filed in the repo, and how old are they?


Whatever theme you choose, you'll need to pick one of 3 ways to make your new site:

## Default theme {#default}

If you are happy with the default theme, which is the [lithium theme](https://themes.gohugo.io/theme/hugo-lithium-theme/), you can use: 

```
blogdown::new_site(theme_example = TRUE, 
                   sample = TRUE) # default theme is lithium
```

I always highly recommend these two arguments:

+ `theme_example` essentially copies the theme's `exampleSite` folder (if it exists) into your project root directory so you can render the full site. You can always delete the example content later, but I like to leave it to make sure the site renders "out of the box".
    
+ `sample` adds a sample R Markdown (`.Rmd`) blog post. Depending on a theme's file structure, this post may end up in a weird place within the `content/` folder.

## Different theme {#different}

If you want a theme other than the default, you can specify the theme at the same time as you call the `new_site` function where the `theme` argument takes a string (so "in quotes") as the input containing the creator's GitHub username / repository name:

```
# for example, create a new site with the academic theme
blogdown::new_site(theme = "gcushen/hugo-academic", 
                   theme_example = TRUE, 
                   sample = TRUE)
```


## Change your mind {#change}

If instead you want to add the theme later (like I did, because I didn't see the above example until it was too late!), you can do this:
    
```
library(blogdown)
new_site() # default theme is lithium
# need to stop serving so can use the console again
install_theme("gcushen/hugo-academic", 
              theme_example = TRUE,
              sample = TRUE,
              update_config = TRUE)
```


## Serve your site {#servesite}

To view the theme example site locally, you can use the **Serve Site** add-in, or run the `blogdown::serve_site` function in your R console. 

{{% alert note %}}
Now is a good time to review the `blogdown::serve_site()` documentation and [how _LiveReload_ works](https://bookdown.org/yihui/blogdown/a-quick-example.html) (and how it blocks your R console by default)
{{% /alert %}}


