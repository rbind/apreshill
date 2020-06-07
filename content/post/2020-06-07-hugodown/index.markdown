---
aliases: [up-and-running-with-hugodown]
title: Up & Running with hugodown
authors: [alison]
date: '2020-06-07'
tags: [hugo]
categories:
  - hugodown
  - hugo
  - netlify
summary: A guide to getting up and running with hugodown, the Hugo Academic theme, GitHub, and Netlify
image:
  caption: '[Photo by Ivan Botha on Unsplash](https://unsplash.com/photos/biz5Kfa-JMQ)'
  focal_point: ''
---




## Overview

Hi! Hello! Welcome. Bienvenidos.

Almost 3 years ago, I wrote my first blog post and published it on my own website. Since then, that single post has been viewed over 22,668 times. That may not seem like a lot over 3 years, but for me it is. I had been thinking I was long overdue to update my original post. But, although I have learned a lot more about Hugo (and even developed my own theme) since then, this practical guide was still a good "how-to".

However, not all has been rosy in Hugo town. Now, there is a new Hugo website building package in town, named hugodown. Soon after the package was "announced" when Hadley Wickham made the repository public, you could tell that some of the pain experienced by some blogdown users had been designed away. Here are some great posts, if you are curious:

+ [Maëlle Salmon's post: *What to know before you adopt Hugo/blogdown*](https://masalmon.eu/2020/02/29/hugo-maintenance/)

+ [Athanasia Mowinckel's post: *Changing your blogdown workflow*](https://drmowinckels.io/blog/changing-you-blogdown-workflow/)

+ Hugodown package site

Because hugodown is actively under development, and may never be available on CRAN, tread here with caution. It is an experimental package. However, I thought it would be fun to take my original blogdown post, and see how well I could trace the same process if you want to be on the bleeding edge and give hugodown a spin. Caveat emptor!

## Pre-requisites

For any website-builder, getting up and running with all the moving parts (RStudio, GitHub, Hugo, Netlify) can take a few tries. In this post, I'm passing along what works for me, and the workflow that I use when I teach Hugo website development. Everyone's mileage may vary, though, depending on your operating system and your approach. About me: I am a macOS user, and I use R, RStudio, Git (usually via [GitHub](https://github.com)), and terminal regularly, so I'm assuming familiarity here with all of these. If that is not you, here are some places to get started:

* For Git: [Happy Git with R](http://happygitwithr.com) by Jenny Bryan et al.
* For Terminal: [The Command Line Murder Mystery](https://github.com/veltman/clmystery) by Noah Veltman, and [The UNIX Workbench](http://seankross.com/the-unix-workbench/) by Sean Kross

In my original 2017 post, I mentioned that at that time, I was a new mom, and just in the process of writing all that up, I filled up my tea mug twice with ice cold water, and filled my water bottle with scalding hot water. This time around isn't too different! It is 2020, there is a global pandemic and I've been under stay-at-home orders with a toddler at home for months. So buckle up :cowboy:

![](https://media.giphy.com/media/uELDhoOZdSnUk/giphy.gif)


## In GitHub

![](blogdown-signpost-1.png)


1. Go online to your [GitHub](https://github.com) account, and create a new repository (check to initialize with a `README` but don't add `.gitignore`- this will be taken care of later). For naming your repo, consider your future deployment plan:

    * If you are going to use [Netlify](https://www.netlify.com) to host the site, you can name this repository anything you want! 
{{% alert note %}}
You can see some of the repo names used by members of the `rbind` organization [here](https://github.com/rbind/repositories). 
{{% /alert %}}
    * If you want to host your site as a [GitHub Page](https://pages.github.com), you should name your repository `yourgithubusername.github.io` (so mine would have been `apreshill.github.io`). If you are going this route, I suggest you follow [Amber's instructions](https://proquestionasker.github.io/blog/Making_Site/) instead of mine!
    


![Screenshot above: Creating a new repository in GitHub](github-new-repo.png)

2. Go to the main page of your new repository, and under the repository name, click the green **Clone or download** button.

3. Choose either SSH or HTTPS (if you don't know which, choose HTTPS). Choose by clicking on the clipboard icon to copy the remote URL for your new repository. You'll paste this text into RStudio in the next section.
    
## In RStudio

![](blogdown-signpost-2.png)

Now you create a new RStudio project via [git clone](https://help.github.com/articles/cloning-a-repository/). This will create a local copy on your computer so you can sync between the two locations: your remote (the one you see on github.com) and your local desktop.
    
1. Click `File > New Project > Version Control> Git`.

1. Paste the copied URL from the previous step.

1. Be intentional about where you tell RStudio to create this new Project.

1. Click **Create Project**.

##  Still in RStudio 

![](blogdown-signpost-3.png)



1. hugodown isn't available from CRAN yet (and might never be), but you can install the development version from GitHub with:

    ```
    > if (!requireNamespace("remotes")) install.packages("remotes")
    > remotes::install_github("r-lib/hugodown")
    ```

2. Let's use our first hugodown function to create a website with the Hugo Academic theme:

    ```
    > library(hugodown)
    > create_site_academic()
    Error: hugo 0.66.0 not installed
    ℹ Do you need to call `hugo_install('0.66.0')`?
    Run `rlang::last_error()` to see where the error occurred.
    ```

    OK, so I did as I was told:

    ```
    > hugo_install('0.66.0')
    Finding release
    Downloading hugo_extended_0.66.0_macOS-64bit.tar.gz...
    Installing to /Users/alison/Library/Caches/hugodown...
    ```

4. Now let's try that again:

    ```
    > create_site_academic()
    Overwrite pre-existing file 'test-hugo.Rproj'?
    
    1: Yup
    2: Absolutely not
    3: Nope
    
    Selection: 
    ```
    
    Enter your selection in the affirmative here with the correct number (so I entered `1`). This printed to my console:

    ```
    ✓ Writing 'test-hugo.Rproj'
    ✓ Adding '.Rproj.user' to '.gitignore'
    ✓ Downloading academic theme
    ✓ Copying site components
    ✓ Installing academic theme
    ✓ Patching configuration files
    ✓ Adding 'resources', 'public' to '.gitignore'
    ✓ Opening './' in new RStudio session
    ```

    My new project did in fact open up, so I close the old one.

5. Start with the `README`, which leads us to...


## Preview the site

![](blogdown-signpost-4.png)

Following the `README`, we start by previewing the example site using `hugodown::hugo_start()`.

## Decorate your site

Let's start with the last thing you typically do to your home- decorate.

Open up the file `config/_default/params.toml`. Play with any of these configurations, but especially fonts/themes. You can see the ones designed by Desirée De Leon in the data/ folder.



```r
rstudioapi::navigateToFile("config/_default/params.toml")
```

While you are at it, edit the other configuration files:

* You can also view [my `config.toml` file](https://github.com/rbind/apreshill/blob/master/config.toml)

{{% alert note %}}
If you want deeper customization of the styling, you can create a new CSS file `assets/scss/custom.scss` and use it to override any existing styles. You can see mine [here](https://github.com/rbind/apreshill/blob/master/assets/scss/custom.scss); heavily borrowing from my former intern [Desirée De Leon](https://desiree.rbind.io/)!
{{% /alert %}}


## All about you

Let's say goodbye to [Nelson Bighetti](https://themes.gohugo.io/theme/academic/#about). Find and edit the file `content/authors/admin/_index.md`. Add an `avatar.jpg` file too.


```r
rstudioapi::navigateToFile("content/authors/admin/_index.md")
```

Icons: https://sourcethemes.com/academic/docs/page-builder/#icons

This single markdown file populates what is called the `about` widget; a customized one looks like this:

![](about.png)



## Prune widgets

While on the subject of widgets, the entire home page is filled with widgets! The default example site sets almost every available widget to **active** to show you the range of what you could do. 

Deactivating the widgets you don't need and only activating the ones you want will help you avoid having your home page feel like the "scroll of death," as my friend [Jackie Wirz](https://twitter.com/jackiewirz) called it. I like to think of the home page as Mr. Potato Head. The home page is the potato, and the widgets are all the pieces you could use. 

Each widget is a `*.md` file in the `content/home/` folder. The metadata at the top helps you configure each widget; namely whether it is `active` (true or false) and the widgets `weight` (ordering, actual numbers doesn't matter- only relative to the other weights).

For example, to turn off the hero widget, use this code in your console and set `active = false`:


```r
rstudioapi::navigateToFile("content/home/hero.md", line = 5, column = 10)
```

Take about 10 minutes about try out turning widgets off and on, and changing their order to see what you like! 

{{% alert note %}}
You can also delete a widget file. You can always recover `*.md` widget files by going into your `themes/hugo-academic/exampleSite/content/home/` folder.
{{% /alert %}}

For my own site, I use 4 main home page widgets:

1. [*about*](/#about) (photo / icons / bio / interests / education)
1. [*slider*](/#slider) (used to showcase some feedback from my workshops)
1. [*posts*](/#posts) (set to show only the most recent)
1. [*talks*](/#talks) (set to show only the most recent)


## Re-plant widgets

If you opted for a more streamlined home page with fewer widgets, you may be having widget pruning regret. Many are very useful, and you may wish to use widgets on *other* pages that are not the home page. In this theme, this is possible! Even if you turn off a widget on the home page, you can create what is called a widget page and add or even combine widgets there. I make heavy use of widget pages in my own site. Here are the steps (following the [docs](https://sourcethemes.com/academic/docs/managing-content/#create-a-widget-page)):

1. Create a new folder in `content/`; let's call it `resume`

2. Inside `content/resume/`, add a file named `index.md`

3. Populate `content/resume/index.md` with a YAML, like this:

    ```yaml
    ---
    summary: More about my work experience
    title: "Resume"
    type: widget_page
    ---
    ```
    
{{% alert note %}}
The very critical line here is the `type: widget_page`---this sets you up to now copy over widgets from `content/home/` in this new folder. 
{{% /alert %}}

4. Copy the widget `*.md` files you'd like to use into this `content/resume/` folder. Edit their metadata (weights, other info), and be sure to set `active = true`. For my own resume, I copied the *experience* and *accomplishments* widgets over.

5. If you want to access this new widget page from your top navbar, open up your `config/_default/menus.toml` and add it there, like:

    ```toml
    [[main]]
      name = "Resume"
      url = "/resume"
      weight = 50
    ```
    
{{% alert note %}}
You can link to any specific widget by taking your baseurl and appending `/#{name-of-widget}`, so `/#slider` links to [*my slider*](/#slider). And `/resume/#accomplishments` links to [*my honors & awards*](/resume/#accomplishments)
{{% /alert %}}

## Workflow

My workflow in RStudio at this point (again, just viewing locally because we haven't deployed yet) works best like this:

1. Open the RStudio project for the site
1. Start the Hugo server using `hugodown::hugo_start()` (only once due to the magic of *LiveReload*)
1. View site in the RStudio viewer pane, and open in a new browser window while I work
1. Select existing files to edit using the file pane in RStudio
1. After making changes, click the save button and `knit`! To knit an .Rmd post, you can use the Knit button to knit to the correct output format. You can also use the keyboard shortcut `Cmd+Shift+K` (Mac) or `Ctrl+Shift+K` (Windows/Linux).
1. The console will detect the change (it will print `Change detected, rebuilding site.`), the viewer pane will update, and if you hit refresh in the browser your local view will also be updated.
1. When happy with changes, add/commit/push changes to GitHub.

Having `blogdown::serve_site` running locally with *LiveReload* is especially useful as you can immediately see if you have totally screwed up. For example, in editing my `about.md` file, this error popped up in my console after making a change and I was able to fix the error right away:

```
Started building sites ...
ERROR 2017/06/08 16:22:34 failed to parse page metadata for home/about.md: (18, 6): missing comma
Error: Error building site: Errors reading pages: Error: failed to parse page metadata for home/about.md: (18, 6): missing comma for about.md
```


The above workflow is only for editing existing files or posts, but not for **creating new posts**. For that, read on...

## Add new posts

Relevant reading:

* [`blogdown` book chapter on RStudio IDE](https://bookdown.org/yihui/blogdown/rstudio-ide.html)
* [`blogdown` book chapter on output formats](https://bookdown.org/yihui/blogdown/output-format.html): on .md versus .Rmd posts
* [Additional detail from Amber](https://proquestionasker.github.io/blog/Making_Site/#adding-a-blog-post-or-portfolio-piece) on adding a blog post

Bottom line:

Use the **New Post** addin. But, you need the console to do this, so you have to stop `blogdown::serve_site` by clicking on the red **Stop** button first. The Addin is a Shiny interface that runs this code in your console: `blogdown:::new_post_addin()`. So, your console needs to be unblocked for it to run. You also need to be "in" your RStudio project or it won't work.

### Draft posts

Relevant reading:

* [`blogdown` book chapter on building a website for local preview](https://bookdown.org/yihui/blogdown/local-preview.html)

Whether you do a markdown or R Markdown post (see below), you should know that in the YAML front matter of your new file, you can add `draft: TRUE` and you will be able to preview your post using `blogdown::serve_site()`, but conveniently your post will not show up on your deployed site until you set it to false. Because this is a function built into Hugo, all posts (draft or not) will still end up in your GitHub repo though.




#### New markdown posts

Use the console to author a new `.md` post:

```
hugodown::use_post()
blogdown::new_post(ext = '.md') # md is the default!
```

Here are the `?new_post` arguments:


```r
new_post(title, kind = "", open = interactive(),
    author = getOption("blogdown.author"), categories = NULL, tags = NULL,
    date = Sys.Date(), file = NULL, slug = NULL,
    title_case = getOption("blogdown.title_case"),
    subdir = getOption("blogdown.subdir", "post"),
    ext = getOption("blogdown.ext", ".md"))
```

{{% alert note %}}
Remember to use the **Serve Site** addin again so that you can immediately view your changes with every save using *LiveReload*.
{{% /alert %}}

#### New .Rmd posts

Use the console to author a new `.Rmd` post:

```
hugodown::use_post()
```




After you edit your `.Rmd` post, in addition to saving the changes in your `.Rmd` file, you *must* use `blogdown::serve_site`- this is how the output `html` file needs to be generated.   

{{% alert warning %}}
Do *not* knit your `.Rmd` posts- use `blogdown::serve_site` instead. If you happen to hit the knit button, just **Serve Site** again to rewrite the `.html` file.
{{% /alert %}}

Ultimately, your [YAML front matter looks something like this](https://bookdown.org/yihui/blogdown/output-format.html#output-format); note that some but not all features of `rmarkdown::html_document` [are supported in `blogdown`](https://bookdown.org/yihui/blogdown/output-format.html#fn15):

```
---
title: "My Awesome Post"
author: "Alison Hill"
date: "2020-06-12"
output: hugodown::md_document()
---
```



{{% alert note %}}
Remember to use the **Serve Site** addin again so that you can immediately view your changes with every save using *LiveReload* and your `.html` file is properly output.
{{% /alert %}}



#### Adding images to a post

If you want to include an image that is not a figure created from an R chunk, the [recommended method](https://github.com/rstudio/blogdown/issues/45) is to: 

1. Add the image to your `/static/img/` folder, then 
2. Reference the image using the relative file path as follows:

```
![my-image](/img/my-image.png)
```


## Deploy in Netlify

![](blogdown-signpost-5.png)

Deploying in Netlify through GitHub is smooth. Yihui and Amber give some [beginner instructions](https://bookdown.org/yihui/blogdown/deployment.html), but Netlify is so easy, I recommend that you skip dragging your `public` folder in and instead [automate the process through GitHub](https://bookdown.org/yihui/blogdown/netlify.html#netlify).

1. When you are ready to deploy, commit your changes and push to GitHub, then go online to [Netlify](https://www.netlify.com). 
2. Click on the **Sign Up** button and sign up using your existing GitHub account (no need to create another account)
3. Log in, and select: `New site from Git -> Continuous Deployment: GitHub`.
4. From there, Netlify will allow you to select from your existing GitHub repositories. You'll pick the repo you've been working from with `blogdown`, then you'll configure your build. This involves specifying two important things: the build command and the publish directory (this should be `public`).

    * More about the build command from [Netlify](https://www.netlify.com/docs/continuous-deployment/#common-configuration-directives): *"For Hugo hosting, `hugo` will build and deploy with the version 0.17 of `hugo`. You can specify a specific `hugo` release like this: `hugo_0.15`. Currently `0.13`, `0.14`, `0.15`, `0.16`, `0.17`, `0.18` and `0.19` are supported. For version `0.20` and above, you’ll need to create a Build environment variable called `HUGO_VERSION` and set it to the version of your choice."* I opted for the former, and specified `hugo_0.19`. 
    
You can check your `hugo` version in terminal using the command [`hugo version`](https://gohugo.io/overview/quickstart/). This is what my output looked like, so I could run version `0.20` if I wanted to through Netlify, but I went with `0.19` and it works just fine.

```
$ hugo version
Hugo Static Site Generator v0.20.7 darwin/amd64 BuildDate: 2017-05-08T18:37:40-07:00
```





![Screenshot above: Basic build settings in Netlify](netlify-build-settings.png)

Netlify will deploy your site and assign you a random subdomain name of the form `random-word-12345.netlify.com`. Mine was particularly unfortunate, with the random word `garbage-collector-janice`. You should know that you can change this; I changed mine to `apreshill.netlify.com`. Do this by navigating to your site on Netlify, then click on **Settings**. Under **Site information**, click on the *Change site name* button.

![](netlify-site-name.png)


{{% alert note %}}
Anytime you change your subdomain name, you need to update the `baseurl` in your `config.toml` file (so I changed mine to baseurl = "https://apreshill.netlify.com/").
{{% /alert %}}

Change the baseurl here:


```r
rstudioapi::navigateToFile("config.toml", line = 12)
```

### `*.rbind.io` domain names

You may want a different [domain name](https://bookdown.org/yihui/blogdown/domain-name.html) than the one provided by Netlify. I opted for a free subdomain `*.rbind.io` offered by RStudio. To do the same, head over to the [rbind/support GitHub page](https://github.com/rbind/support/issues) and open a new issue. All you need to do is let them know what your Netlify subdomain name is (`*.netlify.com`), and what you want your subdomain name to be (`*.rbind.io`). The [awesome `rbind` support team](https://support.rbind.io) will help you take it from there! 

{{% alert note %}}
Again, you will need to update the `baseurl` in your `config.toml` file to reflect your new rbind subdomain name (so mine is baseurl = "https://alison.rbind.io/").
{{% /alert %}}

At this point, you should be up and running with `blogdown`, GitHub, and Netlify, but here are some ideas if you want to go further...


## Have fun!

Lastly, don't forget to just have fun with it. Happy `blogdown`ing!

<iframe src="https://giphy.com/embed/13Y6LAZJqRspI4" width="480" height="357" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/dancing-seinfeld-elaine-benes-13Y6LAZJqRspI4">via GIPHY</a></p>
