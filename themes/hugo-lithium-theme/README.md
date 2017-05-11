# Hugo Lithium

A simple responsive blog theme for [Hugo](https://gohugo.io/) forked from https://github.com/jrutheiser/hugo-lithium-theme with modifications to make it work better with [**blogdown**](https://github.com/rstudio/blogdown).

The easiest way to get started is to create a new (empty) RStudio project, then

```r
devtools::install_github('rstudio/blogdown')  # install blogdown
blogdown::install_hugo()  # install Hugo
blogdown::new_site(theme = 'yihui/hugo-lithium-theme')
```

Then you should be able to see an example website launched in the RStudio Viewer.
