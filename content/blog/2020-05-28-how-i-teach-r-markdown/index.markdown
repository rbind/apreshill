---
title: How I Teach R Markdown
author: Alison Hill
date: '2020-05-28'
categories: []
tags:
  - rmarkdown
subtitle: ''
summary: 'A handful of guiding principles for introducing beginners to the R Markdown family of packages.'
authors: []
lastmod: '2020-05-28T20:45:57-07:00'
featured: no
disable_jquery: no
image:
  caption: '[Photo by Timur Kozmenko on Unsplash](https://unsplash.com/photos/7gGvtQ8U4BU)'
  focal_point: ''
  preview_only: no
projects: []
---

Ah, [R Markdown](https://rmarkdown.rstudio.com/). I love teaching R Markdown. But this was not a love at first sight story. When I first started teaching with R at Oregon Health & Science University many moons ago, my students used R Markdown for their homework assignments and in-class labs. This is a great way to start for beginners, to be honest- just use it! I found that most people are not very disoriented by a file that mixes text and code; a concern I had at first and one that I've heard voiced by other educators. It seems natural to use if it is your first exposure to *all the data science things*, especially if you've never used an R script.

I did notice, though, that over the course of even just a few weeks, many of my students would reach unbearable levels of R Markdown curiosity. I would see signs of growing pains in their assignments, like how can I turn off these messages and warnings when I load packages? This is so long- how can I make it easier to find things? How can I make it look *better*?

For all learners, there comes an uncomfortable point where you simply cannot just continue to use this awesome tool without learning how to use it. And I realized when I was teaching that ultimately it was unfair of me to assume that they would just learn an entire ecosystem while I stood idly by, clutching the secrets of being an ["R Markdown Whisperer"](https://twitter.com/sharlagelfand/status/1114264529477799937?s=20) close to my chest.

Like, **why can't you just find the piñata, kid**? But more importantly, what happens when you can't? I think the risk is that learners either won't like or won't appreciate a tool that I genuinely [think would make their working lives better](https://community.rstudio.com/t/convince-me-to-start-using-r-markdown/1636/7). If I believed it was worth their time to use it, it was worth my time to teach it.

![](https://media.giphy.com/media/xFcFJAryrhO6s/giphy.gif)

So like any good educator, I evolved. I decided that the next year, I would teach R Markdown. And I did. I went from:

> "Just use it"

![](https://media.giphy.com/media/pHiWkDofYnRv2/giphy.gif)

To:

> "Just tell them how to use it already"

![](https://media.giphy.com/media/3o7TKvFKwclJQDY30A/giphy.gif)

I waited until a few weeks into a quarter, and I spent a full lab period walking students through "Hey- this bit where you put the title of each assignment and your name? That's called YAML! Here is what it does..." I showed them how to use [bootswatch themes](https://bookdown.org/yihui/rmarkdown/html-document.html#appearance-and-style), make a [floating table of contents](https://bookdown.org/yihui/rmarkdown/html-document.html#table-of-contents), control their output using the power of [knitr](https://bookdown.org/yihui/rmarkdown/r-code.html) code chunks and chunk options.

Guess what happened? The next batch of assignment my TA team and I received were...stunning. Creative. Beautiful. Thoughtful and thought-provoking. Students had taken care with their markdown headers, they played with flatly/yeti/united, they cared about not printing the giant output of a code chunk. It was a thing of beauty. I remember one of my beloved TAs, [Grace Lawley](https://grace.rbind.io/), commenting that one star student's homework "brought tears to her eyes" (and yes, I trained Grace too as she was also my research assistant, so she was already baptized into the R Markdown family).

But I have to admit, the first time I taught it, I had a hard time teaching it! I realized that I lacked vocabulary around things I used everyday, but had never really talked about out loud with anyone *in words*.

Now, in my role at RStudio, I've devoted a lot of time and energy trying to figure out how we can make R Markdown easier- easier to discover, easier to debug, easier to use, and easier to talk about.

So without further ado, here are some of my guiding principles when introducing R Markdown to beginners, for those who are ready to go beyond casual knitter:

##  #1. Make it. Make it again. 

Knit early. Knit often. That means starting with a pre-filled Rmd document usually that you know *will* knit. How do you motivate repeated knitting and make it satisfying? Teach the basics of output formats and options by editing mainly the YAML. Your goal is to show how small effort --\> high polish. For single docs, I love [`html_document()`](https://bookdown.org/yihui/rmarkdown/html-document.html) with a floating table of contents and a theme (like [this](https://rstudio-education.github.io/sharing-short-notice/#24)), switching quickly to [`bookdown::html_document2()`](https://bookdown.org/yihui/rmarkdown/bookdown-output.html#a-single-document) and `distill::distill_article()`. The latter two also enable automated figure numbering, which for scientific audiences is quite nice!

{{< tweet 1101866080996212736 >}}
    
Bonus when using a `theme` with `html_document()`: show off the `code_download` output option!

{{< tweet 1108925218850893832 >}}   

## #2. Make it pretty. 

The starting Rmd should have a nice [ggplot2](https://ggplot2.tidyverse.org/) graphic in there, and maybe a pretty [gt](https://gt.rstudio.com/) table too. This is a motivational, aspirational document! I also try to use local data sets, so they can see how that actually works, as opposed to using a data package. 

{{< tweet 1101978567842291712 >}}

## #3. Make it snappy. 

I aim to get to a shareable link in the first 20 minutes (at most!). I like to use [Netlify Drop](https://app.netlify.com/drop) for this. No account sign-up needed, and everyone knows how to drag-and-drop (see video below). It is very satisfying to get a link they can share with their mom/best friend/arch nemesis (kidding). I like to have everyone drop their links in a chat too, like a Slack, Google Doc, or a Gitter channel if doing a workshop. My favorite motto: *"if it knits, it ships"* 🚢

<iframe src="https://rstudio-education.github.io/sharing-short-notice/images/single-doc-dnd.mp4" width="672" height="400px"></iframe>

## #4. Make it real.

Teach folks what they need to know to actually use the tool productively in real life. If you are an avid R Markdown user, this means that you *know* without a doubt that file paths will eventually be painful, for example. At the end of an intro, I go back and highlight things I just used to make sure they notice them like R Projects and the here package for data importing. I also love a good ["Your Turn"](https://rmd4medicine.netlify.app/slides/01-rmd-anatomy.html#77) exercise where you get a fresh data dump and all they have to do is re-knit. As in, "Surprise! Now instead of 3 sites, you have data from all 6 sites- what do you do?"

## #5. Make it easy. 

People will only keep using R Markdown if they see it making their life easier. So show them how. For example, the RStudio IDE has some very nice built-in features that make it much easier to be an R Markdown user. I point out things having a [global setup chunk](https://apreshill.github.io/rmd4cdc/#112), and IDE features like:

![](https://rmd4medicine.netlify.app/slides/images/rmd-nav.png)

## What do I save until later?

1.  Rendering with `render()`. I think knitting in the RStudio IDE can get you very far- this I consider an intermediate to advanced concept that is confusing if introduced too early. I've never heard someone say *"Well there is this simple button, but how can I do the same thing from the command line?"*

2.  [Parameterized reports](https://bookdown.org/yihui/rmarkdown/parameterized-reports.html). I actually *do* use parameters though! I'll have at least one or two often in one of my Rmds, and mention them briefly in my wrap-up. I teach parameters explicitly with actual exercises when I have \> 1 hour.

3.  Multiple Rmd output formats. I tend to start with single output formats first. If I have > 1.5 hours and it matches my learning objectives, then I happily oblige- I love teaching [bookdown](https://bookdown.org/yihui/rmarkdown/books.html), [blogdown](https://bookdown.org/yihui/rmarkdown/websites.html), and [distill websites](https://rstudio.github.io/distill/website.html). But to start, I stay single.

4.  Markdown. I skim markdown, and always provide a link to an interactive tutorial. This [one](https://commonmark.org/help/tutorial/) is my favorite. Teaching markdown can be...dry. I show some bits on the slides because I cannot count on everyone doing the interactive tutorial ahead of time, but I do not linger much.

  ![](https://media.giphy.com/media/U7Uxq9Lyz02oStvUIE/giphy.gif)

If you are curious to see some of the materials I've used to teach R Markdown, click on the `rmarkdown` button just below this post! 🚀 

But remember: there is no one way to learn R Markdown, and no one way to teach it either. I love seeing the creativity of the community when introducing the R Markdown family- so keep them coming!

![](https://media.giphy.com/media/Q86zzvI3UUCADQCF0h/giphy.gif)
