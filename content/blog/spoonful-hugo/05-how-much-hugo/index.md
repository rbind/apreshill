---
aliases:
 - /post/2020-12-12-how-much-hugo/
slug: how-much-hugo
title: 'How much Hugo do I need to know?'
author: Alison Hill
date: '2020-12-12'
categories:
  - blogdown
  - hugo
tags:
  - blogdown
  - hugo
summary: When and why you need to learn Hugo as an R blogdown user.
authors:
  - alison
---

Greetings and happy holidays! As many folks are looking forward to down time over the holidays, my inbox naturally starts filling in with questions like "What is the difference between blogdown and X?", "How hard is Hugo to learn?", and "Which Hugo theme do you recommend?" These are all great questions. But the best one in my mind that one needs to ask is:

> "How much Hugo do I need to know *right now*?" 

And the answer, of course, depends on where you are starting from and where you'd like to end up.

In this post, I'll share when and why I think a typical R blogdown user needs to learn Hugo. I'll tell you a secret: I enjoyed learning Hugo. But I learned blogdown first, and frankly was blissfully unaware of the complexity of the underlying Hugo templating language. I was a happy blogdown user for about 1.5 years before taking the plunge to actually learn Hugo. Why did I do it? I needed to build a website for the RStudio Education team, and for sustainability and maintenance, I had been burned by external themes in various ways too many times for my personal site.

We decided as a team that we didn't want our site to depend on a third-party Hugo theme. What can go wrong with using third-party Hugo themes? For one, if you choose a not very active or well-maintained theme, then you could get stuck with a not well-maintained theme. Or worse, your theme could get orphaned, with no maintainer. But, on the flip-side, if you pick a very active and well-maintained theme, you might find yourself dealing with theme and Hugo updates more than you would like (*cough cough* like the Wowchemy/Academic theme). 

The [tidyverse.org](https://www.tidyverse.org/) site was built with a lot of custom HTML, CSS, and some Hugo layout files. I decided to turn that site into a real Hugo theme, and use that theme across teams. You may not have noticed any change [when we switched to the new theme](https://github.com/tidyverse/tidyverse.org/pull/350)- at least I hope you didn't! That site and the [RStudio Education](https://education.rstudio.com/) site both use the same Hugo theme I built.

Now that I've gone from casual Hugo user to theme developer, I have some advice. Generally, as a blanket rule, here is what you should and should not touch:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">An <a href="https://twitter.com/hashtag/rstats?src=hash&amp;ref_src=twsrc%5Etfw">#rstats</a> <a href="https://twitter.com/hashtag/blogdown?src=hash&amp;ref_src=twsrc%5Etfw">#blogdown</a> file hierarchy cheatsheet:<br><br>├─ archetypes &lt;- edit me! <br>├─ config.toml &lt;- edit me! <br>├─ content &lt;- edit me! <br>├─ data &lt;- edit me! <br>├─ layouts &lt;- edit me! <br>├─ public &lt;- ignore me!<br>├─ static &lt;- use me! (png/pdf/csv/xls)<br>├─ themes &lt;- don&#39;t touch! <a href="https://t.co/gvVA703Lwa">pic.twitter.com/gvVA703Lwa</a></p>&mdash; Alison Hill (@apreshill) <a href="https://twitter.com/apreshill/status/1078494406301212672?ref_src=twsrc%5Etfw">December 28, 2018</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

<!--![](https://media.giphy.com/media/l1J9wMccAykUCLIic/giphy.gif)-->

But what can you do with **blogdown** before learning Hugo? When and how do you know when you need to get to know Hugo better? Hopefully this post will help answer these questions.

Inspired by Jenny Bryan's talk on [lazy evaluation](https://resources.rstudio.com/rstudio-conf-2019/lazy-evaluation), I'm framing these learning decision points based on *what you want to get done*. 

## You want to: make a website with blogdown

> **You need to know this much Hugo:** Hugo takes a collection of files (called content) and generates a collection of static HTML files as a single, cohesive, navigable website (plopped in your `public/` folder). How it looks depends on which Hugo theme you pick `r emo::ji("paint")`

You'll need to:

+ [pick a Hugo theme](https://bookdown.org/yihui/blogdown/themes.html), which dictates the style and layout of your content. 
+ [build and serve your site locally](https://bookdown.org/yihui/blogdown/rstudio-ide.html).
+ deploy your site! If you are just starting out, I recommend **everyone** starts by first [dragging and dropping](https://app.netlify.com/drop) your project's `public/` folder into Netlify. There is your site `r emo::ji("boom")`. With a link. That you can send to your best friend *right now*. 
+ [realize this is a **static** site](https://bookdown.org/yihui/blogdown/static-sites.html). Read up on static sites!

But you probably want to do more...

## You want to: customize your site

> **You need to know this much more Hugo:** Hugo themes typically use one or more metadata files (TOML or YAML) to set up global variables to use to build your site. This is usually the way to add a site url, a site name, link social accounts for personal websites, basically take any of the default content you see and customize it for you.

The main files to edit are: 

+ [configuration files](https://bookdown.org/yihui/blogdown/configuration.html)

To get familiar with `TOML`, I recommend:

+ [a brief intro from the blogdown book](https://bookdown.org/yihui/blogdown/configuration.html#toml-syntax), and
+ [Learn TOML in Y Minutes](https://learnxinyminutes.com/docs/toml/).

But, since the time we published the blogdown book, Hugo introduced configuration directories, which allowed us to no longer have one giant `config.toml` file, and instead have multiple configuration files, like this: 

```go-text-template
├── config.toml            <- Hugo-defined variables
├── config
│   ├── _default
│   │   ├── menus.toml     <- menus :)
│   │   └── params.toml    <- theme-specific variables
```

Here is how you can think of these:

+ `config.toml`/`config.yaml`: your most direct communication with Hugo. These are standard Hugo-defined variables that have defaults you can override in this file. You can view all of them [here](https://gohugo.io/getting-started/configuration/#all-configuration-settings). These are universal across themes.

+ `menus.toml`: your way of editing the content in a side or upper navigation menu bar; see example [here](https://gohugo.io/getting-started/configuration/#all-configuration-settings). These work the same way across themes (with the exception of drop-down menus, which work in some themes but not others).

+ `params.toml`: your theme's way of providing an API for Hugo. These are variables that your theme creator has made for you! This is a gift, but not the kind you can re-gift easily. This file will not work with any other theme.

If your theme uses only a single `config.toml` file, you can infer these subsections as you scroll down:

```toml
# before the first use of [[]]
# are all the Hugo variables

# Menu Configuration- same as menus.toml
[[menu.main]]

# Theme Configuration- same as params.toml
[params]
```

You still don't need to learn Hugo...yet. 

## You want to: add content to your site

> **You need to know this much more Hugo:** Remember how the input to Hugo is a "collection of files"? The input is more specifically a collection of markdown files. Hugo themes use content written in markdown files (for blogdown users, R Markdown files work too) to generate your site's content; with one very important rule &mdash; the same structure that works to organize your site content is used to organize the rendered site.

But, what does that **mean**?

![](https://media.giphy.com/media/Poaj36am3ZqaA/giphy.gif)

The main files to edit are: 

+ files in the [`content/` folder](https://bookdown.org/yihui/blogdown/content.html) (and see my post on [page bundles](/post/2019-10-26-hugo-layouts/))

First, the structure and the names inside your `content/` folder is meaningful. The **names** of each folder determine what Hugo layout will be applied. Why do you care? If you change the content name, things may not look good because Hugo can't find the right layout. Think of your site like going to a party at a friend's house- you can bring food, wine, maybe a board game- your host knows what to do with these things. But if you bring a monkey, for example, your host has no idea what to do with it!

![monkey at party](https://media.giphy.com/media/JPgG1GbGnGbgBitA1Q/giphy.gif)

Yuo *can* override this by adding a `layout` key to your file's YAML, as described [here](https://gohugo.io/content-management/front-matter/#front-matter-variables). The relevant bit is here:

> "`layout`: the layout Hugo should select from the lookup order when rendering the content. If a `type` is not specified in the front matter, Hugo will look for the layout of the same name in the layout directory that corresponds with a content’s section."


The subfolders also tell you where you can find your content on your site. 

```go-text-template
.
├── content/
│   ├── authors/            # => https://example.com/authors/
│   ├── privacy/index.md    # => https://example.com/privacy/
│   └── home/               # => https://example.com/
```

You should take a bit of time to get the "cook's tour" of your site. Try looking at each file and guessing the URL you'll use to see it in the rendered site. Do this now and it will become like second nature.

You'll no doubt run into one question: what is the difference between `index.md` and `_index.md` files? `index.md` are simple pages; the single file goes into the site and a single file comes back out when you view the site. This is called a [leaf bundle](https://gohugo.io/content-management/page-bundles/) in Hugo.

```go-text-template
.
├── content/
│   ├── privacy/index.md       # => a leaf bundle
│   └── blog/                  # => a branch bundle
│       ├── _index.md          # => AHA!
│       ├── gorillas/index.md  # => a leaf bundle
│       ├── baboons/index.md   # => another leaf bundle
│       └── monkeys/index.md   # => yet another leaf bundle
```

An `_index.md` file, on the other hand, signals that this folder has a *listing page* activated. This is called a [branch bundle](https://gohugo.io/content-management/page-bundles/) in Hugo. Listing pages are a bit magical, so make sure you understand them now. Typically, if you edit the `_index.md` file at all, you edit the YAML of this file- often the page content below the YAML isn't revealed by the theme (this is a bit hand-wavy and I'm sorry for that).

So if you have `content/blog/gorillas/index.md`, you get not one but two pages. Let's pretend my baseurl is `alison.rbind.io`. You get a **list** page that will render at `alison.rbind.io/blog/`, and indexes all the `index.md` files inside that content folder. You also get a **single** page that will render at `alison.rbind.io/blog/gorillas/`, which shows you the full content of the `index.md` file.


## You want to: customize colors and fonts on your site

> **You need to know this much more Hugo:** It depends on your theme :) You may need to learn CSS, and you may need to learn to *read* Hugo now.

Many Hugo themes enable users to edit aesthetic elements like colors and fonts. So, depending on your Hugo theme, you may not need to know CSS. Other themes provide a way to “plug in” a custom CSS file to change those things and more (like spacing, font sizing, etc.). Guess where that is? Usually it is in your `config.toml` file in the `[params]` section (if no configuration directory) or the `params.toml` file. The theme author should leave you a breadcrumb to figure out what you should name and where you should place your custom CSS file.

For example, the Hugo academic theme provides a few ways in. In the `params.toml` file, you can use an included [site color theme](https://github.com/gcushen/hugo-academic/blob/b5963ac66c4c0400e88cd603a74d7734365f0885/exampleSite/config/_default/params.toml#L5) or make your own, and customize your fonts. You can also provide your own custom CSS file by including it here: https://github.com/gcushen/hugo-academic/blob/master/assets/scss/custom.scss

If your theme doesn't provide this level of support, then you may need to learn Hugo. Sometimes the options are tough to find, unfortunately, but many theme designers provide at least a plug-in option. Others may require you to dig into some of your theme's partial layouts (i.e., `themes/theme_name/layouts/partials/`) and learn to read them. Here are some examples:

+ **Plug-in CSS**: Hugo [Tranquil Peak](https://github.com/kakawait/hugo-tranquilpeak-theme/blob/d306f0d7f67ca5880cb97530056c59216597cd51/exampleSite/config.toml#L175-L178) theme tells you to place the file inside your `static/` folder then provide the path and filename in the `config.toml` file:

    ```toml
    [params]
      # Custom CSS. Put here your custom CSS files. They are loaded after the theme CSS;
      # they have to be referred from static root. Example
      # [[params.customCSS]]
      #   href = "css/mystyle.css"         <- AHA!
    ```

+ **Go Fish**: Hugo [I Am Sam](https://github.com/victoriadrake/hugo-theme-sam/blob/39ea2d5e64fd0426d275060cfa6c549df66cdece/layouts/partials/head/css.html#L14-L18) theme doesn't give you this in the `config.toml` file, but looking at one of the layout partials you can see that the theme is actually built to plug-in your custom CSS:

    ```go-html-template
    <!-- Custom css -->
    {{ range .Site.Params.customCSS -}}    <- AHA!
    {{ $style := resources.Get . }}
    <link rel="stylesheet" href="{{ $style.RelPermalink }}" integrity="{{ $style.Data.Integrity }}" crossorigin="anonymous" media="screen">
    {{- end }}
    ```


## You want to: renovate the layout of content on your site

> **You need to know this much more Hugo:** You need to learn to use Hugo variables.

I say renovate, but these can be anywhere from small to big renovation projects. The key word here is renovate, which in Hugo world, means you want to *override* your site's theme. Let's say you want different information to show up in your [site's footer](https://github.com/rbind/apreshill/commit/be80b68eec3183dea304b66eaab874d496d7d1bb). Or maybe you want add something new to the [metadata](https://github.com/maelle/simplymaelle/pull/10) for your blog posts.

Here is a great blog post to get you started:

+ [Override a Hugo theme](https://zwbetz.com/override-a-hugo-theme/)

**tl;dr:** If you adapt your existing theme's Hugo layout files, be sure to make a copy of the layout you want to edit **first** and add it to your project root's `layouts/` folder before editing. Please do not edit any files anywhere in your `themes/` folder.

Now, the hardest part of doing is often figuring out which layout file is the one you need to edit. Often you'll need to do some digging to figure out which file is the one to touch.

```go-text-template
.
├── layouts/
│   ├── _default/           # edit me!
│   ├── authors/            # edit me!
│   └── partials/           # edit me!
├── themes/
│   ├── theme_name/
│   │   ├── layouts
│   │   │   ├── _default/   # do not touch
│   │   │   ├── authors/    # do not touch (seriously)
│   │   │   └── partials/   # `r emo::ji("fire")`
```

You'll also want to learn about Hugo [**variables**](https://gohugo.io/variables/), especially:

+ [Site variables](https://gohugo.io/variables/site/)
+ [The `.Site.Params` variable](https://gohugo.io/variables/site/#the-siteparams-variable)
+ [Page variables](https://gohugo.io/variables/page/)
+ [The `.Param` method for page variables](https://gohugo.io/variables/page/#the-param-method)

You also might need to understand Hugo [logic](https://gohugo.io/templates/introduction/#logic) like:

+ [iteration](https://gohugo.io/templates/introduction/#iteration) and
+ [conditionals](https://gohugo.io/templates/introduction/#conditionals)




{{% alert note %}}
Important: I learned this the hard way, but you [cannot](https://gohugo.io/templates/introduction/#html-comments-containing-go-templates) wrap your Hugo code in HTML comments to deactivate it; all Hugo code even inside of HTML comments will still be evaluated when you build your site.
{{% /alert %}}


## You want to: create your own Hugo theme

> **You need to know this much more Hugo:** Welcome to the wizarding world of Hugo! `r emo::ji("wizard")` You now need to learn to write Hugo templates.

Here are some resources for writing Hugo [**templates**](https://gohugo.io/templates/):

+ [Context (aka “the dot”) ](https://gohugo.io/templates/introduction/#the-dot)
+ [Hugo, the scope, the context and the dot](https://regisphilibert.com/blog/2018/02/hugo-the-scope-the-context-and-the-dot/)
+ [Lookup order](https://gohugo.io/templates/lookup-order/#examples-layout-lookup-for-regular-pages)
+ [Base templates](https://gohugo.io/templates/base/)
+ [Single page templates](https://gohugo.io/templates/single-page-templates/)
+ [List page templates](https://gohugo.io/templates/lists/)

These resources were especially helpful to me:

+ The [blogdown book section on templates](https://bookdown.org/yihui/blogdown/templates.html)
+ The [blogdown book section on customizing layouts](https://bookdown.org/yihui/blogdown/custom-layouts.html)
+ The [Hugo docs](https://gohugo.io/documentation/) are pretty strong
+ [Make a Hugo blog from scratch | zwbetz](https://zwbetz.com/make-a-hugo-blog-from-scratch/)
+ [Hugo Community Discourse Forum](https://discourse.gohugo.io/)
+ [All of Mike Dane's Hugo tutorials](https://www.mikedane.com/static-site-generators/hugo/)

I spent a lot of time looking at other Hugo themes; here are some quality ones to learn from:

+ [Maëlle Salmon's](https://masalmon.eu/) ROpenSci Hugo theme: https://github.com/ropensci/roweb2/tree/master/themes/ropensci

+ [Amber Thomas's](https://amber.rbind.io/) Data Science Hugo theme:
https://github.com/ProQuestionAsker/hugo-data-science

+ [Danielle Navarro's](https://djnavarro.net/) slum Hugo theme: https://github.com/djnavarro/hugo-slum

+ My own humble Hugo theme: https://github.com/rstudio/hugo-graphite

---

Again, this is all just based on my own experiences- your mileage may vary as always.
