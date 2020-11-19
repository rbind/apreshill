---
title: Up & Running with hugodown
author: Alison Hill
date: '2020-07-12'
categories:
  - hugo
  - hugodown
  - netlify
tags:
  - hugo
aliases:
  - up-and-running-with-hugodown
authors:
  - alison
summary: A guide to getting up and running with hugodown, the Hugo Academic theme,
  GitHub, and Netlify
image:
  caption: '[Photo by Ivan Botha on Unsplash](https://unsplash.com/photos/biz5Kfa-JMQ)'
  focal_point: ''
---




## Welcome

Hi! Hello! Welcome. Bienvenidos.

Almost 3 years ago, I wrote my [first blog post](/post/2017-06-12-up-and-running-with-blogdown/) and published it on my own website. Since then, that single post has been viewed over 23,823 times. That may not seem like a lot to some folks, but it is to me! Even more meaningful to me, though, has been watching the launches of so many people's personal websites.

![](https://media.giphy.com/media/L2jHJeRY4twe4/giphy.gif)


But, making, deploying, and maintaining a Hugo website using blogdown was not always pain-free. 

![](https://media.giphy.com/media/xT0xeK2LxlMVXiAOuk/giphy.gif)

Here are some great posts that document pretty common user experiences and frustrations:

+ [Maëlle Salmon's post: *What to know before you adopt Hugo/blogdown*](https://masalmon.eu/2020/02/29/hugo-maintenance/)

+ [Athanasia Mowinckel's post: *Changing your blogdown workflow*](https://drmowinckels.io/blog/changing-you-blogdown-workflow/)

The tidyverse team was an early blogdown adopter, and certainly felt their fair share of frustrations too. In an effort to design some of those away, there is a new experimental Hugo website building package in town, named [hugodown](https://hugodown.r-lib.org/). Because hugodown is actively under development, and may never be available on CRAN,  	:rotating_light: tread here with caution :rotating_light:. 

Nevertheless, I thought it would be fun to take my original blogdown post, and see if I could trace the same process of building a Hugo website using hugodown. I also wanted to add details about using the Hugo Academic theme, based on questions I get during workshops and that I see on the RStudio Community forums.

So if you are feeling fearless and want to live on the bleeding edge, read on to give hugodown a spin along with me.

![](https://media.giphy.com/media/l0G19cFS7nkpGaOLC/giphy.gif)

## tl;dr

If you already know what you are doing, this entire post can be condensed into just a few lines of code:


```r
remotes::install_github("r-lib/hugodown")
usethis::create_project()
hugodown::create_site_academic()
hugodown::hugo_start()
usethis::use_github()
```

## Pre-requisites

Getting any website up and running with all the moving parts (RStudio, GitHub, Hugo, Netlify) can take a few tries. In this post, I'm passing along what works for me, and the workflow that I use when I teach Hugo website development. Everyone's mileage may vary, though, depending on your operating system and your approach. 

For this blog post, I'm assuming you have basic familiarity with R, the RStudio IDE, & GitHub. If that is not you, you will need to work through [Happy Git with R](http://happygitwithr.com) by Jenny Bryan et al. first, then come back here when you are ready. 

Since hugodown is currently only available on GitHub, you'll need to also setup a [GitHub Personal Access Token](https://happygitwithr.com/github-pat.html) to install it. 

In my original 2017 post, I mentioned that at that time, I was a new mom, and just in the process of writing all that up, I filled up my tea mug twice with ice cold water, and filled my water bottle with scalding hot water. This time around isn't too different! Fast forward 3 years: it is 2020, there is a global pandemic, I've been under stay-at-home orders with a toddler at home for months. So buckle up :cowboy:

![](https://media.giphy.com/media/uELDhoOZdSnUk/giphy.gif)

{{% alert note %}}
I've included code chunks below using the [rstudioapi](https://rstudio.github.io/rstudioapi/) package to help you navigate to the right file at the right time. Hugo sites have a dizzying and heavily nested directory structure! You'll need to run `install.packages("rstudioapi")` to use those code chunks, but you can also navigate on your own to the file you need too.
{{% /alert %}}

## Step 0: Set your intentions

![](00-hugodown.gif)

During workshops, I try to set aside some time at the start for folks to set their website intentions. This might feel a bit like navel-gazing, but trust me here. I know you just want to jump in and get started! 

But, hear me out. The process of actually building the site can be complicated, and it is easy to get lost in the weeds. Too often, folks run out of steam when it is time to do the most fun and important piece: dreaming about the kind of site you want to make!

{{% alert todo %}}
Do this right now! Take 10 minutes to set your intentions---grab a pen and notepad.
{{% /alert %}}

### 1. Content {#todo-content}

Hugo is made for blogs. But, in addition to a blog, the academic theme provides a unique system of widgets. You can have one or many widgets on pages in your site. I like to think of widgets like [Mr. Potato Head](https://en.wikipedia.org/wiki/Mr._Potato_Head). Each page is your potato head, and the widgets are all the pieces you could use. 

![](https://media.giphy.com/media/tjGVkrPMjngt2/giphy.gif)

Take the homepage for example, seen on the [Academic demo site](https://academic-demo.netlify.app/). Each band or section you see is a widget. Widgets can be stand-alone pages, or can be combined on a single page. 

Examples:

+ Multiple widget page: my [resume](/resume/) and [about](/about/) pages
+ Single widget page: my [projects](/projects/)

{{% alert todo %}}
Look at the [Academic demo site](https://academic-demo.netlify.app/) and write down some widgets you see that you like, and the ones you definitely don't.
{{% /alert %}}

### 2. Menu {#todo-menu}

Now that you have a sense of the content you want, how do you want a visitor to be able to explore your content? I typically recommend limiting the top navbar to 5 links max (excluding the search icon). 

{{% alert todo %}}
Write down up to 5 items to appear in your upper navbar.
{{% /alert %}}

### 3. Homepage {#todo-home}

This is the first page a visitor lands on when they find your site. Think of it like a welcome mat. Do you like a single page site where you scroll and see everything on one page? Or do you prefer a short and sweet homepage? Do you want a photo and a bio to be the first thing visitors see? What else?
    
Here are some examples of personal websites built with the Hugo Academic theme to inspire you:

+ https://malco.io/
+ https://isabella-b.com/
+ https://silvia.rbind.io/
+ https://maya.rbind.io/
+ https://www.allisonhorst.com/
+ https://juliasilge.com/
+ https://desiree.rbind.io/

{{% alert todo %}}
Write down the widgets you want to see on your homepage. It can be one, or many.
{{% /alert %}}

Keep these notes handy! 


## Step 1: Create project

![](01-hugodown.png)

Open up RStudio to create a new project where your website's files will live.
    
1. Click `File > New Project > New Directory > New Project` (yes, choose *New Project* twice, this is not a typo!).

1. Be intentional about *where* you tell RStudio to create this new project, and *what* you name your project.

1. Check the *Create a git repository* box.

1. Click **Create Project**.

    ![Screenshot above: Creating a new project in RStudio](new-rproj.png)

    For naming your project, consider your future deployment plan:

    + [**Netlify**](https://www.netlify.com). I recommend using Netlify to host the site. In this case, you can name the repository anything you want! 
      
    + [**GitHub Pages**](https://pages.github.com). If you want to host your site with GitHub Pages, you should name your repository `yourgithubusername.github.io` (so mine would have been `apreshill.github.io`). This post won't be able to help you with publishing.

{{% alert note %}}
You can see some of the repo names used by members of the `rbind` organization [here](https://github.com/rbind/repositories). 
{{% /alert %}}

    
## Step 2: Create site

![](02-hugodown.png)

1. hugodown isn't available from CRAN yet (and might never be), but you can install the development version from GitHub with:

    ```
    > if (!requireNamespace("remotes")) install.packages("remotes")
    > remotes::install_github("r-lib/hugodown")
    Using github PAT from envvar GITHUB_PAT
    Downloading GitHub repo r-lib/hugodown@master
    ```

1. Let's use our first hugodown function to create a website with the Hugo Academic theme:

    ```
    > library(hugodown)
    > create_site_academic()
    Error: hugo 0.66.0 not installed
    ℹ Do you need to call `hugo_install('0.66.0')`?
    Run `rlang::last_error()` to see where the error occurred.
    ```

    If you get this message like I did, let's do as we're told:

    ```
    > hugo_install('0.66.0')
    Finding release
    Downloading hugo_extended_0.66.0_macOS-64bit.tar.gz...
    Installing to /Users/alison/Library/Caches/hugodown...
    ```

1. Now let's try that again:

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

    My new project did in fact open up, so I closed the old one.

1. Start with the `README`, which leads us to...

    ```
    This is a [hugo](http://gohugo.io/) [academic](https://sourcethemes.com/academic) created by [hugodown](http://hugodown.r-lib.org/).
    
    ## Basic operation
    
    * Preview the site with `hugodown::hugo_start()`; it will automatically
      update (navigating to the latest change) as you modify `contents/`.
    
    * Create a new post with `hugodown::use_post('post/short-title')`.
    ```

1. Following the `README`, we start by previewing the example site using `hugodown::hugo_start()`.

    ![](hugo_start.png)

    Exciting, isn't it? Now, don't trap your site in the RStudio Viewer pane. Let it out! Click to "Show in new window" (to the right of the :broom: icon) to preview it in a normal browser window. 


### Add a new post

This is where R Markdown enters the picture :tada: 

Hugodown allows you to create new `.Rmd` posts that are knittable (to `.md` files), then previewable in your Hugo site. Use the console to author a new `.Rmd` post; I'll name my post "hi-hugo":

```
> hugodown::use_post(path = "post/hi-hugo")
● Modify '/Users/alison/rscratch/test-hugodown/content/post/hi-hugo/index.Rmd'
```

This takes the path to where you want your post to live, relative to the `content/` folder (so that piece of the path is assumed, rightly so!). In the Academic theme, the example site organizes blog posts into the `content/post/` folder, but the name of this folder varies across Hugo themes. 

{{% alert note %}}
A rule that is true 90% of the time: folders in `content/` are singular, not plural--- :heavy_check_mark: `post`; :x: `posts`
{{% /alert %}}

If you look in your **Files** pane, you can see that this creates a folder with the name of my post (`"hi-hugo"`). The actual R Markdown file is named `index.Rmd`. This is a Hugo [page bundle](/post/2019-02-21-hugo-page-bundles/). Each post gets its own bundle, or folder. Inside the post bundle is where all your static images, static data files like `.csv` files should go. 

```
content/
├── posts
│   ├── hi-hugo
│   │   ├── bakers.csv
│   │   ├── image1.jpg
│   │   ├── image2.png
│   │   └── index.Rmd
```

In the post itself, use the relative file path like:

```
![my-first-image](image1.jpg)
```

Let's look at the `index.Rmd`---the output format here is `hugodown::md_document()`. We'll knit this `.Rmd` to a `.md` file. You can knit freely here in hugodown! To knit an `.Rmd` post, you can either:

1. Use the Knit button to knit to the correct output format, or

1. Use the keyboard shortcut `Cmd+Shift+K` (Mac) or `Ctrl+Shift+K` (Windows/Linux).

After knitting, you should now see:

```
content/
├── posts
│   ├── hi-hugo
│   │   ├── bakers.csv
│   │   ├── image1.jpg
│   │   ├── image2.png
│   │   ├── index.Rmd
│   │   └── index.md
```

Go ahead and add an R code chunk like:

````
```{r}
summary(Orange)
```
````

After you edit your `.Rmd` post, save then knit. 

{{% alert note %}}
The most important thing here is to realize that the act of knitting creates an `index.md` file in the same post bundle as `index.Rmd`. The `index.md` version is what then feeds into the Hugo static site generator.
{{% /alert %}}

Try it again! Add another R code chunk like:

````
```{r echo=FALSE}
library(ggplot2)
oplot <- ggplot(Orange, aes(x = age, 
                   y = circumference, 
                   colour = Tree)) +
  geom_point() +
  geom_line() +
  guides(colour = FALSE) +
  theme_bw()
oplot
```
````

You should see something like:

![](post-plot.png)

{{% alert warning %}}
Many R Markdown output options for HTML documents are not going to be possible here, like tabbed sections, floating table of contents, the `code_download` button, etc. Also, HTML widgets are a little dicey currently.
{{% /alert %}}

### Workflow

My workflow in RStudio at this point (again, just viewing locally because we haven't deployed yet) works best like this:

1. Open the RStudio project for the site

1. Start the Hugo server using `hugodown::hugo_start()` (only once due to the magic of *LiveReload*)

1. View site in the RStudio viewer pane, and open in a new browser window while I work

1. Select existing files to edit using the file pane in RStudio

1. After making changes, click the save button and, if working with an `.Rmd` document, `knit`! To knit an `.Rmd` post, you can use the Knit button to knit to the correct output format. You can also use the keyboard shortcut `Cmd+Shift+K` (Mac) or `Ctrl+Shift+K` (Windows/Linux).

1. The console will detect the change (it will print `Change detected, rebuilding site.`), the viewer pane will update, and if you hit refresh in the browser your local view will also be updated.

1. When happy with changes, add/commit/push changes to GitHub.

Having `blogdown::serve_site` running locally with *LiveReload* is especially useful as you can immediately see if you have totally screwed up. For example, in editing my `about.md` file, this error popped up in my console after making a change and I was able to fix the error right away:

```
Started building sites ...
ERROR 2017/06/08 16:22:34 failed to parse page metadata for home/about.md: (18, 6): missing comma
Error: Error building site: Errors reading pages: Error: failed to parse page metadata for home/about.md: (18, 6): missing comma for about.md
```

So now you have the basic mechanics of the site working.

## Step 3: Build your site

![](03-hugodown.png)

Now, we'll leave hugodown and R Markdown behind. We'll just be using Hugo and the Academic theme to build your personal website.

### Configure your site

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


### Goodbye Nelson B.

Let's say goodbye to [Nelson Bighetti](https://themes.gohugo.io/theme/academic/#about). Everything in this single markdown file populates what is called the `about` widget; a customized one looks like this:

![](about.png)


Find and open the file `content/authors/admin/_index.md`:


```r
rstudioapi::navigateToFile("content/authors/admin/_index.md")
```

Edit the YAML metadata to change:

+ The [icons](https://sourcethemes.com/academic/docs/page-builder/#icons) and where they link to

+ Your current role and organization

+ Your interests

+ Your education

The text under the YAML is your bio; you can use markdown here. Add an `avatar.jpg` file too (it *must* be named this).


### Prune widgets

Remember how we started with thinking about your [content](#todo-content)? We are ready to prune out some of our unwanted widgets.

Recall that on the [Academic demo site](https://academic-demo.netlify.app/), the entire home page is filled with widgets! The default example site is the exact same as the demo. It sets almost every available widget to **active** to show you the range of what you could do. 

Deactivating the widgets you don't need and only activating the ones you want will help you avoid having your home page feel like the "scroll of death," as my friend [Jackie Wirz](https://twitter.com/jackiewirz) called it. I like to think of the home page as [Mr. Potato Head](https://en.wikipedia.org/wiki/Mr._Potato_Head). The home page is the potato, and the widgets are all the pieces you could use. 

![](https://media.giphy.com/media/tjGVkrPMjngt2/giphy.gif)

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


### Re-plant widgets

If you opted for a more streamlined home page with fewer widgets, you may experience *widget pruning regret*. Many are very useful, and you may wish to use widgets on *other* pages that are not the home page. In this theme, this is possible! Even if you turn off a widget on the home page, you can create what is called a widget page and add or even combine widgets there. I make heavy use of widget pages in my own site. Here are the steps (following the [docs](https://sourcethemes.com/academic/docs/managing-content/#create-a-widget-page)):

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


## Step 4: Deploy in Netlify

![](05-hugodown.png)

Deploying in Netlify through GitHub is smooth. You can make it smoother by adding a `netlify.toml` file in the project root directory. I have a post with more details  [here](/post/2019-02-19-hugo-netlify-toml/).

1. When you are ready to deploy, commit your changes and push to GitHub, then go online to [Netlify](https://www.netlify.com). 

2. Click on the **Sign Up** button and sign up using your existing GitHub account (no need to create another account)

3. Log in, and select: `New site from Git > Continuous Deployment: GitHub`.

4. From there, Netlify will allow you to select from your existing GitHub repositories. You'll pick the repo you've been working from with `hugodown`, then you'll configure your build. This involves specifying two important things: 

    + Build command: `hugo`
    + Publish directory: `public`
    
You can check your `hugo` version in terminal using the command [`hugo version`](https://gohugo.io/overview/quickstart/). This is what my output looked like:

```bash
$ hugo version
Hugo Static Site Generator v0.66.0-A301F6B2/extended darwin/amd64 BuildDate: 2020-05-25T09:16:12Z
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

At this point, you should be up and running with `hugodown`, GitHub, and Netlify.


## We made it!

So, we hit a few bumps in the road, but I'm interested to watch how this package matures, and hopefully I'll be able to help improve quality of life for users (and selfishly for me!). Happy hugodown-ing!

![](https://media.giphy.com/media/l2Je4FGrsRuYskcda/giphy.gif)
