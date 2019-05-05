---
title: "Edit configurations"

date: 2018-09-09T00:00:00.000Z
lastmod: 2018-09-09T00:00:00.000Z

draft: false # Is this a draft? true/false
toc: true # Show table of contents? true/false
type: docs # Do not modify.

# Add menu entry to sidebar.
linktitle: "Edit configurations"
menu:
  tutorial-blogdown:
    parent: "Step 5+: Customize site"
    weight: 6
---



The config.toml file lives in your blogdown project root directory:


```r
fs::dir_ls(".")
```

```
## R               apreshill.Rproj config.toml     content         
## data            index.Rmd       layouts         netlify.toml    
## public          resources       static          themes
```

See it? Editing this file is the quickest way to personalize and customize your site. It is also completely dependent on your theme.

To edit, in the RStudio file pane viewer, mouse over to your project root directory and open this file.



```r
fs::dir_ls(".", recurse = TRUE, regexp = ".toml")
```

```
## config.toml
## data/fonts/alison.toml
## data/themes/alison.toml
## netlify.toml
## public/post/2019-02-19-hugo-netlify-toml
## public/post/2019-02-19-hugo-netlify-toml/featured.png
## public/post/2019-02-19-hugo-netlify-toml/featured_hu15824f77946f0182c818ed6da31198c4_54408_150x0_resize_box_2.png
## public/post/2019-02-19-hugo-netlify-toml/featured_hu15824f77946f0182c818ed6da31198c4_54408_1600x400_fill_q90_box_smart1_2.png
## public/post/2019-02-19-hugo-netlify-toml/featured_hu15824f77946f0182c818ed6da31198c4_54408_680x500_fill_q90_box_smart1_2.png
## public/post/2019-02-19-hugo-netlify-toml/index.html
## public/post/2019-02-19-hugo-netlify-toml/netlify-adv-build.png
## public/post/2019-02-19-hugo-netlify-toml/netlify-deploy-settings.png
## public/post/2019-02-19-hugo-netlify-toml/netlify-sign-up.png
## themes/hugo-academic/data/academic.toml
## themes/hugo-academic/data/assets.toml
## themes/hugo-academic/data/fonts/classic.toml
## themes/hugo-academic/data/fonts/default.toml
## themes/hugo-academic/data/fonts/playfair.toml
## themes/hugo-academic/data/themes/1950s.toml
## themes/hugo-academic/data/themes/apogee.toml
## themes/hugo-academic/data/themes/coffee.toml
## themes/hugo-academic/data/themes/cupcake.toml
## themes/hugo-academic/data/themes/dark.toml
## themes/hugo-academic/data/themes/default.toml
## themes/hugo-academic/data/themes/forest.toml
## themes/hugo-academic/data/themes/ocean.toml
## themes/hugo-academic/exampleSite/config.toml
## themes/hugo-academic/theme.toml
```

## TOML versus YAML

This file is formatted using TOML syntax - learn more at https://learnxinyminutes.com/docs/toml/

## All configurations

https://gohugo.io/getting-started/configuration/#all-configuration-settings

## Base URL

Now, edit the `baseurl` in your `config.toml` file. The URL *should always* end with a `/` trailing slash. Both of these baseurls worked for me when viewing locally:

```
baseurl = "https://example.com/"
baseurl = "/"
```

{{% alert warning %}}
Make sure that the `baseurl = ` listed ends with a trailing slash `/`!
{{% /alert %}}

Go ahead and edit all the other elements in the `config.toml` file now as you please- this is how you personalize your site!

Some themes have more lengthy `config.toml` files, and usually the one that has populated from the example site has helpful comments for how to make changes. 

Typical things you can edit from the `config.toml` file:

+ Your site title and description
+ Syntax highlighter (look for a way to choose `highlight.js` options)
+ The site's navigation links (what appears in either the upper menu or a side navbar, for example; look for `[[menu.main]]` fields)
+ A profile picture
+ Links to your social media like twitter, github, etc. (often integrated with Font Awesome icons, or some other icon pack)

Things that are nice if you can change, but don't get too down if your site doesn't have these:

+ A way to refer to an additional CSS file
+ Related to above: an easy way to change the fonts or main site color palettes
+ An image for a twitter card

## Relevant reading:

* [`blogdown` book chapter on configuration](https://bookdown.org/yihui/blogdown/configuration.html)
* [Additional detail from Amber](https://proquestionasker.github.io/blog/Making_Site/#site-configuration)
* You can also view [my `config.toml` file](https://github.com/rbind/apreshill/edit/master/config.toml)
