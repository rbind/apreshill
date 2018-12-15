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
    parent: "02-Build your site"
    weight: 6
---



The config.toml file lives in your blogdown project root directory:


```r
fs::dir_ls(".")
```

```
## alison-rbind.Rproj archetypes         config.toml        
## content            data               index.Rmd          
## layouts            public             resources          
## static             themes
```

See it? Editing this file is the quickest way to personalize and customize your site. It is also completely dependent on your theme.

To edit, in the RStudio file pane viewer, mouse over to your project root directory and open this file.




## TOML versus YAML

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


## Syntax highlighting

🖍
Just do it. Life is better when things are colourful. Plus, it's really not hard— I didn't even have to do anything special with my blogdown theme to get it working. This is covered in the blogdown book[^blogdown] as both a [theme parameter](https://bookdown.org/yihui/blogdown/themes.html#the-default-theme) and a [custom template](https://bookdown.org/yihui/blogdown/templates.html#how-to).

## Relevant reading:

* [`blogdown` book chapter on configuration](https://bookdown.org/yihui/blogdown/configuration.html)
* [Additional detail from Amber](https://proquestionasker.github.io/blog/Making_Site/#site-configuration)
* You can also view [my `config.toml` file](https://github.com/rbind/apreshill/edit/master/config.toml)
