---
title: "Build your site"

date: 2019-05-01T00:00:00.000Z
lastmod: 2019-05-01T00:00:00.000Z

draft: false # Is this a draft? true/false
toc: true # Show table of contents? true/false
type: docs # Do not modify.

# Add menu entry to sidebar.
linktitle: "Step 3: Build your site"
menu:
  tutorial-blogdown:
    weight: 5
---



![](/img/tutorials/blogdown-signpost-4.png)

Now you can finally build your site using the `blogdown::new_site()` function. But **first** you should at least think about themes...

## Shop themes {#themes}

There are over 90 [Hugo themes](https://themes.gohugo.io). All of them are hosted on GitHub, so using them essentially means that you download a zip file containing all the theme files into a directory within your project. In the blogdown book, we offer a [shorter list of strong themes](https://bookdown.org/yihui/blogdown/other-themes.html). I went with [hugo-academic](https://github.com/gcushen/hugo-academic). 

First, some things to consider as you choose your theme:

1. It can be very hard to switch themes, so choose wisely.
1. When was the last file updated on the GitHub repo? 
1. How many issues are filed in the repo, and how old are they? Is the theme author responsive? Look for issues asking if the theme is orphaned or not being actively maintained- these would be some red flags that would cause me to move on.


## Deep thoughts on Hugo themes {#advice}

I've now tried at least 20 Hugo themes. Here is some more unsolicited advice:

1. Don't be scared by what look like complicated themes. Most themes can be simplified when you customize the menus and content. Themes that are too simple can lack features that you'll eventually want to use- with Hugo themes, I find it pretty easy to strip off features you **don't** need, but sometimes difficult to add in features that you **do** need.

1. If you are a blogdown beginner, don't try to hack it with a theme that doesn't include an example site. If you follow my instructions on this page and there is no example site that you can view locally, pick a new theme. 

1. Similarly, if you get to the bottom of this page and you cannot serve your site successfully on your own computer (i.e., things just do not look right, or you get an error message, or you see a lot of broken image links), pick a new theme. Solving these issues is often not trivial, and I don't see them as "teachable moments" for blogdown beginners.

1. Given the above advice, be prepared to try out several themes. I recommend choosing your top 5 themes, and realistically you'll probably end up going with your number 5 pick. Don't get your heart set on any one theme until you fully take it for a test drive on your own machine.

1. Don't be afraid to delete and start over. There is literally zero harm that can be done by creating new blogdown sites, publishing them, then deleting them if you hate them.

1. Don't spend too much time on themes. Set aside a block of time to research this, pick your five, then take them for a test drive. I see way too many users get paralyzed by the sheer number of choices, and this often serves as a very effective procrastination method.

## Default theme {#default}

If you are happy with the default theme, which is the [lithium theme](https://themes.gohugo.io/theme/hugo-lithium-theme/), you can use: 


```r
blogdown::new_site(theme_example = TRUE, 
                   sample = TRUE,
                   empty_dirs = TRUE, 
                   to_yaml = TRUE)
```

I always highly recommend these two arguments:

+ `theme_example` essentially copies the theme's `exampleSite` folder (if it exists) into your project root directory so you can render the full site. You can always delete the example content later, but I like to leave it to make sure the site renders "out of the box".
    
+ `sample` adds a sample R Markdown (`.Rmd`) blog post. Depending on a theme's file structure, this post may end up in a weird place within the `content/` folder.

## Different theme {#different}

If you want a theme other than the default, you can specify the theme at the same time as you call the `new_site` function where the `theme` argument takes a string (so "in quotes") as the input containing the creator's GitHub username / repository name:


```r
# for example, create a new site with the academic theme
blogdown::new_site(theme = "gcushen/hugo-academic", 
                   theme_example = TRUE, 
                   sample = TRUE,
                   empty_dirs = TRUE, 
                   to_yaml = TRUE)
```


## Change your mind {#change}

If instead you want to add the theme later (like I did, because I didn't see the above example until it was too late!), you can do this:
    

```r
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

## Start over  {#startover}

*Optional, but perhaps necessary!*

At this point I'm hoping you are looking at a fully functional website that you can locally host. Click around. Make sure things work **right out of the box.** Isn't it very exciting? 

If you are not looking at a fully functional site right now, start over! I can almost guarantee that if you are unable to serve an example site for a Hugo theme locally, that that will not be the only pain you'll experience with that theme. Deep breath- it is not you, it is your theme!
