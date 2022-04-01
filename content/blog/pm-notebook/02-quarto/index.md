---
title: "We don't talk about Quarto"
subtitle: "Until now!"
excerpt: "Until now! Since RStudio has shared Quarto in a published Nature article and in their public conf schedule, I'll share my behind-the-scenes experience testing and teaching Quarto."
format: hugo
date: '2022-03-31'
draft: false
editor_options: 
  markdown: 
    wrap: 72
---



> Thumbnail image from the Official Disney Fan Club website
> (<https://d23.com/why-everyone-is-talking-about-bruno-from-encanto/>)

## Background

This time last year, I was busily checking Quarto, and totally terrified
of checking Twitter. Seriously, I held my breath every time. It. Was.
Not. Ready. It was changing fast and breaking fast. Everyday I was
seeing the GitHub stars slowly creeping up, and I was nervous. And we
had all agreed on our team that *"We don't talk about Quarto"* on the
outside. That means we were not tweeting or blogging about it, or even
at that point trying to teach it to anyone --- yet.

But, slowly things started easing up. By the time summer internship
positions at RStudio were announced, I was excited to have reserved a
slot for our first Quarto intern, who would be tasked with working with
myself, [JJ Allaire](https://github.com/jjallaire), and [Charles
Teague](https://github.com/dragonstyle) to help get the Quarto docs off
the ground. We brought [Paul Villanueva](https://pommevilla.rbind.io/)
on in one of the best hiring decisions I've made, and he ended up doing
*so much more* than just docs! By August 2021, I had convinced Paul to
join me as a TA to teach the first public Quarto workshop for the
R/Medicine. And I honestly felt comfortable teaching Quarto then --- it
felt like it was time. Luckily, the Quarto team had stabilized releases
of Quarto in August before the workshop, and we were able to spin up a
custom RStudio Cloud environment to use a preview release of the RStudio
IDE, and we were off!

Now, fast forward to me 6 months from my time at RStudio and I am
writing a book with the amazing [Rich
Iannone](https://github.com/rich-iannone) about doing data science with
R and Quarto, in a Quarto book, and I've built an internal knowledge
repository for my IBM team with Quarto (these are not R or RStudio
users!). So in this post, I thought I'd finally share my notes to myself
after testing and teaching Quarto over the past year, and now as a user
and enabler.

![Mirabel sliding down the stairs in
Encanto](https://media.giphy.com/media/ievgCulkRxHoVBlkwH/giphy.gif)

## What you'll need to know

-   Quarto is actually a separate installation.

    -   **What to do?** Follow [Step
        1](https://quarto.org/docs/get-started/) to download Quarto for
        your OS. I do this now regularly about once a week to make sure
        I'm getting the latest goodies.

    -   There is also an [R
        package](https://cran.r-project.org/web/packages/quarto/index.html),
        which will allow you to render at the command line if you aren't
        an RStudio IDE/button clicking person, but you could also use
        the command line, which is what I do.

-   Quarto works within the RStudio IDE.

    -   **What to do?** Download the latest RStudio IDE release from
        this link:
        <https://quarto.org/docs/get-started/hello/rstudio.html>

    -   It has actually worked inside the RStudio IDE for almost a year.
        It was previously supported only in the
        [dailies](https://dailies.rstudio.com/) (which are honestly
        low-risk to download and use!). But nowadays it works with the
        latest official released version of the RStudio IDE.

    -   It also works in [VSCode](https://code.visualstudio.com/); see
        **Step 2** [here](https://quarto.org/docs/get-started/).

-   The RStudio IDE's [Visual R Markdown
    Editor](https://rstudio.github.io/visual-markdown-editing/) was in
    actuality the first "shots fired" from Quarto.

    -   **Fun fact:** I forgot to tell our first Quarto intern, Paul,
        about the visual editor until about 4 weeks into his
        internship--- and it totally changed his outlook, even as an
        experienced Markdown user. So don't sleep on the [visual
        editor](https://quarto.org/docs/visual-editor/) when teaching
        and using Quarto. In particular, don't miss:

        -   [Easy editing/formatting of Markdown
            tables](https://quarto.org/docs/visual-editor/content.html#editing-tables)

        -   Copy/paste from Google docs

        -   [Citations](https://quarto.org/docs/visual-editor/technical.html#citations)

        -   [The "insert anything" keyboard
            shortcut](https://quarto.org/docs/visual-editor/options.html#insert-anything)

        -   [Emojis
            🥰](https://quarto.org/docs/visual-editor/content.html#emojis)

## What you'll like

If you are anything like me...

-   SUBFOLDERS for projects (praise be). Yes you can have a website or
    book or any other multi-file Quarto project and render content in
    even deeply nested subdirectories. Rejoice!

-   Two column (and more) [flexible
    layouts](https://quarto.org/docs/authoring/figures.html#complex-layouts)
    with images, code, text, tables, plots, anything. This to me was the
    "one killer feature" when JJ first started showing me regular demos
    --- I was floored.

-   "Batteries included" HTML features across single documents and
    projects (like HTML books, websites, etc). This may be a RIP to the
    wonderful ["Pimp my rmd"](https://holtzy.github.io/Pimp-my-rmd/).

    -   Here are just a few features that were available in some but not
        all R packages with `.Rmd` -\> HTML output formats: [code
        folding](https://quarto.org/docs/output-formats/html-code.html#folding-code),
        [copy/paste
        chunks](https://quarto.org/docs/output-formats/html-code.html#copy-button),
        [callout
        blocks](https://quarto.org/docs/authoring/callouts.html), [TOC
        on the
        side](https://quarto.org/docs/output-formats/html-basics.html#table-of-contents),
        [code
        linking](https://quarto.org/docs/output-formats/html-code.html#code-linking)
        via [downlit](https://downlit.r-lib.org/) (previously only
        available in [pkgdown](https://pkgdown.r-lib.org/)),
        [tabsets](https://quarto.org/docs/output-formats/html-basics.html#tabsets),
        [anchored
        headings](https://quarto.org/docs/output-formats/html-basics.html#anchor-sections)

-   [Global chunk
    options](https://quarto.org/docs/computations/execution-options.html)
    set in your YAML using the `execute` key (no more [**knitr** setup
    chunk](https://apreshill.github.io/rmd4cdc/#112)!). See all
    supported chunk options (that go beyond **knitr** ones)
    [here](https://quarto.org/docs/reference/cells/cells-knitr.html).

    <div class="cell">

    ``` yaml
    ---
    title: "We don't talk about Quarto"
    subtitle: "Until now!"
    execute:
      echo: false
    ---
    ```

    </div>

-   [Easier verbatim
    chunks](https://quarto.org/docs/computations/execution-options.html#fenced-echo)
    using `echo: fenced` as a code chunk option. For example, I am using
    this chunk option here (invisibly) to show a full chunk

    <div class="cell panel-tabset">

    ``` r
    1 + 1
    ```

    <div class="cell-output-stdout">

        [1] 2

    </div>

    </div>

-   [Chunk
    options](https://quarto.org/docs/computations/r.html#chunk-options)
    as YAML with the special hashpipe `#|` (great for [longish alt
    text](https://www.rstudio.com/blog/knitr-fig-alt/)) (note that
    Quarto also added a way to [add alt
    text](https://quarto.org/docs/authoring/figures.html#alt-text) for
    Markdown inserted images, thanks to [Silvia
    Canelon](https://github.com/quarto-dev/quarto-web/issues/20))

    <div class="cell"
    fig-alt="Scatterplot of flipper length by bill length of 3 penguin species, where we show penguins with bigger flippers have bigger bills.">

    ```` markdown
    ```{r}
    #| fig-alt: "Scatterplot of flipper length by bill length of 3 penguin species, where we show penguins with bigger flippers have bigger bills."
    #| warning: false
    library(palmerpenguins)
    library(ggplot2)
    ggplot(data = penguins, aes(x = flipper_length_mm,
                                y = bill_length_mm,
                                color = species)) +
      geom_point(aes(shape = species), alpha = 0.8) +
      scale_color_manual(values = c("darkorange","purple","cyan4")) 
    ```
    ````

    <div class="cell-output-display">

    <img src="index_files/figure-gfm/unnamed-chunk-6-1.png" width="768" />

    </div>

    </div>

-   Universal
    [cross-referencing](https://quarto.org/docs/authoring/cross-references.html)
    ([no more `bookdown::html_document2()`,
    etc.](https://pkgs.rstudio.com/bookdown/reference/index.html#single-document-output-formats))

-   [Show
    source](https://quarto.org/docs/output-formats/html-code.html#code-tools)
    to anyone viewing your HTML output (this was only possible with
    `rmarkdown::html_document()` - [my
    tweet](https://twitter.com/apreshill/status/1108925218850893832?lang=en)
    from when I first discovered this output option!)

-   [Parameters](https://quarto.org/docs/computations/parameters.html)
    (side note: here is the first **rmarkdown**
    [issue](https://github.com/rstudio/rmarkdown/issues/33) from 2014
    that [Tom Mock](https://themockup.blog/) and I found where the idea
    for parameters was "born" 👶)

-   Compatibility with
    [Hugo](https://gohugo.io/)/[blogdown](https://bookdown.org/yihui/blogdown/).
    This post is a `.qmd` file with `format: hugo` [rendered with
    Quarto](https://quarto.org/docs/output-formats/hugo.html).

    <div class="cell">

    ``` yaml
    ---
    title: "We don't talk about Quarto"
    subtitle: "Until now!"
    format: hugo
    ---
    ```

    </div>

    There is nothing stopping you from using Quarto to render individual
    posts, then blogdown to use Hugo, or just use Hugo from command
    line. Hugo specific flavor of Markdown (goldmark) is also [supported
    by the visual
    editor](https://rstudio.github.io/visual-markdown-editing/markdown.html#hugo-markdown).

## What you'll stumble on

-   Chunk options as YAML

    -   I always forgot the symbol, which is `#|` (read: the hashpipe).
        If you also cannot remember this, channel your 90s kid and enjoy
        this Weezer flashback:

{{\< youtube \_9BGLtqqkVI \>}}

    -   No equal sign, use a colon instead

    -   If the value is `true`/`false`, use lower case! (no more
        screaming!) 😱

-   To render to a specific format, use the `format` YAML (instead of
    `output`)

    -   This one screwed me up so bad, I actually tried to go back to
        **rmarkdown** at one point and couldn't figure out why I
        couldn't knit to `output_format: html_document` 🤦🏻

-   Use `kebab-case` for all YAML keys *and* to delimit fig/layout/code
    chunk options instead of ... what we had before. This will be
    confusing at first because your **knitr** chunk options won't match
    the package documentation. See
    [here](https://github.com/quarto-dev/quarto-cli/pull/83) for the
    change (it will auto-convert `fig.alt` for example to `fig-alt`, but
    still).

-   You'll be rendering as your verb, not knitting, but you'll still be
    using the **knitr** package as your
    [engine](https://quarto.org/docs/tools/rstudio.html#knitr-engine) if
    you want to use R instead of Python code chunks.

    -   This also means to watch **knitr** for news! [Follow releases
        carefully](https://github.com/yihui/knitr/releases)--- they will
        still matter.

-   for projects (books, websites, blogs), render vs preview

## What you'll miss (for now)

-   Defining your own format.

-   Making and bundling templates that are easily shareable.

-   Xaringan and remark.js for slides. This particular package and
    flavor of markdown was never supported in the visual editor because
    it is not a Pandoc-defined output format. So for HTML slides in
    Quarto, reveal.js is where it is at. I had a post about doing that
    research too (actually all my testing at that time was in Quarto!).
