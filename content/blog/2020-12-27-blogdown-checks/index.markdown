---
aliases:
  - /blog/2020-12-27-blogdown-checks/
title: 'Unbreak your blogdown site'
slug: blogdown-checks
author: Alison Hill
date: '2020-12-27'
tags:
  - rmarkdown
  - blogdown
summary: The latest release of the blogdown package (not yet on CRAN) includes new checking functions to help users make less breakable Hugo sites. 
featured: no
disable_jquery: no
image:
  caption: '[Photo from kimi-eats-gluten-free](https://www.kimieatsglutenfree.com/2020/06/12/easy-clementine-creme-brulee-no-torch/)'
  focal_point: ''
  preview_only: no
---

This holiday season, the R Markdown elves at RStudio have been busy at work wrapping up the next release of the blogdown package. Blogdown is a package close to my own heart, as it was the subject of [my very first blog post](/post/2017-06-12-up-and-running-with-blogdown/), and that led to co-authoring the [book on blogdown](https://bookdown.org/yihui/blogdown/).

Fast-forward more than three years later, and I have built, borked, and torched more blogdown/Hugo sites than I care to admit. 

![I love Lucy: a little too much](https://media.giphy.com/media/Y48Qr2Ntib9r5RQpeB/giphy.gif)

But, I've also learned a lot about how to use and learn blogdown/Hugo, and how to help other people [troubleshoot](post/2019-03-04-hugo-troubleshooting/) their sites too.

For anyone thinking about dipping their toes into blogdown and making their first Hugo site, the vocabulary alone can be wildly intimidating. I remember being skeptical about Netlify, and also not fully understanding how exactly I had entered into a relationship with Hugo and what our boundaries were. There are so many moving pieces, and many possible missteps for new and even "more senior" users like myself. I've seen it all- users trying to serve a site from within an empty repo, having a missing `theme` folder, ignoring all rendered files, accidentally knitting an R Markdown file ([but now you can!](https://github.com/rstudio/blogdown/commit/d32c2945623581377e256d3f7f6e3566c05e3d6f)). The list goes on and on and on.

![I love Lucy: eating chocolates](https://media.giphy.com/media/XECiLxeHvwdD96Jc6Z/giphy.gif)

I admit- I originally thought education could solve these issues at first. We just needed to improve the documentation, I thought. Maybe the book could be better. But, in truth, we needed to think *inside* the package box, because that is the only failsafe way to reach users. So, the package itself needed to do more. The blogdown package had already implemented several printed warnings and error messages intended to help guide users toward the happy path. However, we [got](https://github.com/rstudio/blogdown/issues/510#issuecomment-743468440) [feedback](https://github.com/rstudio/blogdown/issues/519) that many users were unsure how to act on the messages and sometimes just ignored them (myself included!). Then I asked my colleague [Jenny Bryan](https://jennybryan.org/) about her approach to package warnings and error messages, and she said something very simple (paraphrased from my notes!): 

> When possible, it is much better to offer users control over when and how they can solve their own problems. 

When you force users to wait for an error to occur, you are putting the user in a reactive stance. This is typically not a great mental space to be in to learn. Learning is highly unlikely in a reactive stance too, because messages focus on informing the user *what* the error is, but often fail to say *how* to make it go away. On the other hand, giving users targeted functions can help them feel proactive and empowered. Well-designed functions can give you as the package developer an opportunity to offer opinionated advice, and at the same time, help the user gain a mental model of a complicated situation. This idea is the driver behind the [`usethis::git_sitrep()`](https://usethis.r-lib.org/reference/git_sitrep.html) and [`usethis::proj_sitrep()`](https://usethis.r-lib.org/reference/proj_sitrep.html) functions.

After this conversation with Jenny, I sketched out an [idea](https://github.com/rstudio/blogdown/issues/525) for a series of "checking" functions for blogdown. I wasn't sure all of these were actually possible, but with the amazing help of [Yihui Xie](https://yihui.org/) and [Christophe Dervieux](http://cderv.rbind.io/about/), we came up with five functions to help ensure user success:

+ `check_config()`
+ `check_gitignore()`
+ `check_hugo()`
+ `check_content()`
+ `check_netlify()`


Each of these functions is meant to be used interactively as you build and edit your blogdown site. A clean pre-flight checklist still unfortunately cannot ensure website success, but it will help users sidestep the most common and avoidable pitfalls.

![I love Lucy: pie in the face](https://media.giphy.com/media/26FPAvfNjwa9hCMZW/giphy.gif)

A sixth function, `check_site()`, wraps all five up in a single function, which I suspect will be most useful for existing blogdown users who are already familiar with GitHub, Netlify, and Hugo. 

We ended up doing a lot of massaging of the output formatting ([see my PR](https://github.com/rstudio/blogdown/pull/534)), and finally settled on the following:

```
----------------------------------------------------------
○ A successful check looks like this.
● [TODO] A check that needs your attention looks like this.
| Let's check out your blogdown site!
----------------------------------------------------------
```

I'm really happy with the end result, and I hope users are as well. I not-so-secretly hope these functions help educators feel braver about teaching blogdown too. So, without further ado...

```
| Let's check out your blogdown site!
```

To do this on your own, you'll want to use the remotes package to install the development version of blogdown:

```
remotes::install_github("rstudio/blogdown")
```

## Check your site's configuration

Your Hugo site's main configuration file is located in the project root of your website, called `config.toml` or `config.yaml`. This file is your most direct line of communication with Hugo itself, and settings in this file are usually the first I check when trying to help users troubleshoot their build. 


```r
blogdown::check_config()
```

```
― Checking config.toml
| Checking "baseURL" setting for Hugo...
○ Found baseURL = "https://alison.rbind.io"; nothing to do here!
| Checking "ignoreFiles" setting for Hugo...
● [TODO] Add these items to the "ignoreFiles" setting: "\\.Rmd$", "\\.Rmarkdown$", "\\.knit\\.md$", "\\.utf8\\.md$"
| Checking setting for Hugo's Markdown renderer...
○ All set! Found the "unsafe" setting for goldmark.
― Check complete: config.toml
```

You can see I have one `[TODO]` item. Below, I'll bork up my own `config.toml` file a bit more:

```
― Checking config.toml
| Checking "baseURL" setting for Hugo...
● [TODO] Update "baseURL" to your actual URL when ready to publish.
| Checking "ignoreFiles" setting for Hugo...
● [TODO] Add these items to the "ignoreFiles" setting: "\\.Rmd$", "\\.Rmarkdown$", "\\.knit\\.md$", "\\.utf8\\.md$"
| Checking setting for Hugo's Markdown renderer...
| You are using the Markdown renderer 'goldmark'.
● [TODO] Allow goldmark to render raw HTML by adding this setting to config.toml (see https://github.com/rstudio/blogdown/issues/447 for more info):

[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true

==> Do you want blogdown to set this for you? (y/n) n
― Check complete: config.toml
```

A few more `[TODO]` items here, but all are actionable, and originate from a single file (`config.toml`) which the function also opens for you interactively. 🎉

## Check your `.gitignore` file

If you are using blogdown, you'll likely need a version control system like Git. Files named in a `.gitignore` file will always be ignored whenever you add and commit files to your remote repository, but having the wrong files listed here can easily sink you a few hours (I've had this happen several times with collaborators!). Now, we can run a tidy little check:


```r
blogdown::check_gitignore()
```


```
― Checking .gitignore
| Checking for items to remove...
○ Nothing to see here - found no items to remove.
| Checking for items you can safely ignore...
○ Found! You have safely ignored: .DS_Store
● [TODO] You can safely add to .gitignore: Thumbs.db
| Checking for items to ignore if you build the site on Netlify...
○ Found! You have safely ignored: public, resources
― Check complete: .gitignore
```

This function screens for items you should remove, and for items you can safely add. It also checks if you are using Netlify, which we assume based on the presence of a `netlify.toml` file in your project.

## Check your Hugo versions

Hugo versions were by far my biggest pain point. Earlier this year, I had added some kind of Hugo versioning system built into blogdown to my [giant feature wishlist](https://github.com/rstudio/blogdown/issues/476). I am so relieved that this latest release of blogdown includes this, but that meant we also needed to provide users with ways to inspect and maintain their Hugo versions.


```r
blogdown::check_hugo()
```


```
― Checking Hugo
| Checking Hugo version...
○ Found 4 versions of Hugo. You are using Hugo 0.79.0.
| Checking .Rprofile for Hugo version used by blogdown...
| Hugo version not set in .Rprofile.
● [TODO] Set options(blogdown.hugo.version = "0.79.0") in .Rprofile.
● [TODO] Also run blogdown::check_netlify() to check for possible problems with Hugo and Netlify.
― Check complete: Hugo
```

Note that the new blogdown Hugo versioning system now relies on a `.Rprofile` file that you probably want to keep in the project root. These files are a bit annoying, because anytime you need to edit them, you'll want to restart your R session for changes to take effect. If you don't have a project-level `.Rprofile` file, try the newly added `blogdown::config_Rprofile()` function to create one (see `?config_Rprofile` for help). 

## Check your Hugo content

Your Hugo site's content predictably lives inside the `content/` folder of your project. But there are lots of unpredictable things Hugo can do (or not do) with your content. For example, I think [every blogdown user](/post/2019-03-04-hugo-troubleshooting/#dates) at some point has stumbled into the `draft: TRUE` minefield, or the future dated content abyss. As well, many users accidentally end up with duplicate rendered output files (Hugo will prefer the `.html` if present). This function checks these things for you:


```r
blogdown::check_content()
```

```
― Checking content files
| Checking for previewed content that will not be published...
● [TODO] Found 1 file with a future publish date:

  content/talk/2021-rstudio-global/index.md

  If you want to publish today, change a file's YAML key to 'date: 2020-12-27'
○ Found 0 files marked as drafts.
| Checking your R Markdown content...
○ All R Markdown files have been knitted.
○ All R Markdown output files are up to date with their source files.
| Checking for .html/.md files to clean up...
○ Found 0 duplicate .html output files.
○ Found 0 incompatible .html files to clean up.
― Check complete: Content
```

Note that this also checks that all R Markdown files have some kind of knitted rendered output present. This is 🆕, and we believe is a better default. Think: save-on-knit. You now only need to knit R Markdown files (the previous behavior was knit-on-save, which sometimes led to an error-filled render vortex if your code did not run).


## Check your Netlify setup

Almost done with your pre-flight checklist! The last one helps set you up for deployment success:


```r
blogdown::check_netlify()
```

```
― Checking netlify.toml...
○ Found HUGO_VERSION = 0.79.0 in [build] context of netlify.toml.
| Checking that Netlify & local Hugo versions match...
○ It's a match! Blogdown and Netlify are using the same Hugo version (0.79.0).
| Checking that Netlify & local Hugo publish directories match...
○ Good to go - blogdown and Netlify are using the same publish directory: public
― Check complete: netlify.toml
```

No `[TODO]`s! Now let's bork things up:

```
― Checking netlify.toml...
○ Found HUGO_VERSION = 0.69.0 in [build] context of netlify.toml.
| Checking that Netlify & local Hugo versions match...
| Mismatch found:
  blogdown is using Hugo version (0.79.0) to build site locally.
  Netlify is using Hugo version (0.69.0) to build site.
● [TODO] Option 1: Change HUGO_VERSION = "0.79.0" in netlify.toml to match local version.
● [TODO] Option 2: Use blogdown::install_hugo("0.69.0") to match Netlify version, and set options(blogdown.hugo.version = "0.69.0") in .Rprofile to pin this Hugo version.
| Checking that Netlify & local Hugo publish directories match...
○ Good to go - blogdown and Netlify are using the same publish directory: public
― Check complete: netlify.toml
```

Whoops! You can see that a mismatch was found: I'm using a newer version of Hugo on Netlify than I am using to build locally. You want these to match, so that you can be reasonably sure that what you see on your public site will not be a surprise 😱

![](https://media.giphy.com/media/k2gBKDCrkh72g/giphy.gif)

## Check your site

If you don't want to go file-by-file and step-by-step, and you're into more of a "kitchen sink" approach, give `check_site()` a try. It will wrap all these checks up for you in a single function call. 

Please give the development version of the blogdown package a try, and help us make it better by filing [issues](https://github.com/rstudio/blogdown/issues/new/choose) on GitHub. And I hope these new functions help you have more fun actually working with your site!

![](https://media.giphy.com/media/SpVJOOBAWggAE/giphy.gif)

You can watch my recent talk at the LA R User Group meetup on YouTube to see learn more about the new features you can look forward to with this latest blogdown release [here](/talk/2020-larug/).
