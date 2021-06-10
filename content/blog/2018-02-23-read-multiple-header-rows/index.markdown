---
aliases: 
  - read-multiple-header-rows
  - /blog/2018-02-23-read-multiple-header-rows/
slug: multiple-headers
title: Read Data with Multiple Header Rows into R
authors: [alison]
summary: Using the readr package to sidestep a common problem
date: '2018-07-08'
categories:
  - readr
  - readxl
  - data import
image:
  caption: 'Photo of my hex loot, courtesy RStudio, GitHub, and friends.'
  focal_point: ''
---

{{% alert note %}}
A shorter version of this blog post now appears as an [article vignette](https://readxl.tidyverse.org/articles/articles/multiple-header-rows.html) for the `readxl` package, thank you to [Jenny Bryan](https://jennybryan.org/) for the [invitation](https://twitter.com/JennyBryan/status/1016442080636235776)!
{{% /alert %}}

A problem I run up against a lot when working with other people’s data is having multiple header rows in the source data file. I like to use `readr` functions to read in rectangular data like `.csv` and `.tsv` files, but if you skip rows at import using the `skip` argument, you lose the header row as well, which usually has column names. The problem I often have is that the header row has column names that I want to keep, but I’d like to skip the second row (or more), which has some junk in it. Usually this row is some kind of data dictionary inserted between the row of column names and the actual data.

In this post, I’ll walk through a solution to this problem, using the `readr` package. You can also watch along in the video.

{{% youtube "Mayf_XhsQDE" %}}

Warning!: I made a mistake when I said `readr` uses the first 100 rows of your data to predict column types- it uses the first 1000 rows.

------------------------------------------------------------------------

<svg aria-hidden="true" role="img" viewBox="0 0 512 512" style="height:1em;width:1em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#ee5863;overflow:visible;position:relative;"><path d="M216 0h80c13.3 0 24 10.7 24 24v168h87.7c17.8 0 26.7 21.5 14.1 34.1L269.7 378.3c-7.5 7.5-19.8 7.5-27.3 0L90.1 226.1c-12.6-12.6-3.7-34.1 14.1-34.1H192V24c0-13.3 10.7-24 24-24zm296 376v112c0 13.3-10.7 24-24 24H24c-13.3 0-24-10.7-24-24V376c0-13.3 10.7-24 24-24h146.7l49 49c20.1 20.1 52.5 20.1 72.6 0l49-49H488c13.3 0 24 10.7 24 24zm-124 88c0-11-9-20-20-20s-20 9-20 20 9 20 20 20 20-9 20-20zm64 0c0-11-9-20-20-20s-20 9-20 20 9 20 20 20 20-9 20-20z"/></svg>
<a href="data:text/csv;base64,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" download="stickers.csv">Download stickers.csv</a>

------------------------------------------------------------------------

## Being sticker rich

This dataset is from an article published in PLOS ONE called [“Being Sticker Rich: Numerical Context Influences Children’s Sharing Behavior”](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0138928). In this study, children (ages 3–11) received a small (12, “sticker poor”) or large (30, “sticker rich”) number of stickers, and were then given the opportunity to share their windfall with either one or multiple anonymous recipients. This type of experimental design is a version of the [Dictator Game](https://en.wikipedia.org/wiki/Dictator_game).

![](stickers-plos-one.png)

The main research questions the authors explored were: do the number of available resources and/or the number of potential recipients alter the likelihood of a child donating and/or the amount they donate? But, in order to answer this question, we have to be able to read in the data! Luckily, these lovely developmental psychologists opted to share their data on the [Harvard Dataverse](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/LHAQ5W) as a tab-delimited file.

If you download the file, you can open it up in a plain text editor.
![](stickers-txt.png)

You can also open it with Microsoft Excel.
![](stickers-table.png)

## Read in the file

Let’s start by creating a variable called `link` to store the link to the data file.

``` r
# create variable to store url
link <- "https://dataverse.harvard.edu/api/access/datafile/2712105"
```

The file has a `.tab` extension, so we know it is tab-delimited. This means that the right `readr` function for reading this file is `read_tsv`. Since we stored our link already as a character string, that is the only argument to the `read_tsv` function.

``` r
#install.packages("readr")
library(readr) # load the readr package
stickers <- read_tsv(link) 
# spec()
```

Now, we know the second row of data is wonky, but how can we see that in R? There are a number of ways we can go spelunking around into our data file. The easiest to print it. Since we used `readr`, we have a tibble, which nicely prints to screen.

``` r
stickers
```

    # # A tibble: 402 x 18
    #    SubjectNumber  Condition    NumberStickers NumberEnvelopes  Gender  Agemonths
    #    <chr>          <chr>        <chr>          <chr>            <chr>       <dbl>
    #  1 [Included Sam… 1=12:1; 2=1… 1=12; 2=30     1=1 recipient; … 1=fema…        NA
    #  2 1              1            1              1                1              36
    #  3 2              1            1              1                2              36
    #  4 3              1            1              1                2              36
    #  5 4              1            1              1                1              36
    #  6 5              1            1              1                2              36
    #  7 6              1            1              1                2              36
    #  8 7              2            1              2                1              36
    #  9 8              2            1              2                2              36
    # 10 9              3            2              1                2              36
    # # … with 392 more rows, and 12 more variables: Ageyears <dbl>, Agegroups <chr>,
    # #   Subject'sEnvelope <chr>, LeftEnvelope <chr>, RightEnvelope <chr>,
    # #   absolutenumberofstickersgiven(Conditions1or3:Outof12;Conditions2or4:Outof30) <chr>,
    # #   PercentGiven(Outof100percent) <chr>, Giveornot <chr>,
    # #   LargerEnvelopeabs <chr>, LargeEnvelopepercent <chr>,
    # #   SmallerEnvelopeabs <chr>, SmallEnvelopepercent <chr>

Unfortunately, `dplyr::glimpse` can’t help us much, because we have one variable name that is ridiculously long (`absolutenumberofstickersgiven(Conditions1or3:Outof12;Conditions2or4:Outof30)`). We’ll fix that with `dplyr::rename`.

``` r
library(dplyr)
glimpse(stickers)
```

    # Rows: 402
    # Columns: 18
    # $ SubjectNumber                                                                  <chr> …
    # $ Condition                                                                      <chr> …
    # $ NumberStickers                                                                 <chr> …
    # $ NumberEnvelopes                                                                <chr> …
    # $ Gender                                                                         <chr> …
    # $ Agemonths                                                                      <dbl> …
    # $ Ageyears                                                                       <dbl> …
    # $ Agegroups                                                                      <chr> …
    # $ `Subject'sEnvelope`                                                            <chr> …
    # $ LeftEnvelope                                                                   <chr> …
    # $ RightEnvelope                                                                  <chr> …
    # $ `absolutenumberofstickersgiven(Conditions1or3:Outof12;Conditions2or4:Outof30)` <chr> …
    # $ `PercentGiven(Outof100percent)`                                                <chr> …
    # $ Giveornot                                                                      <chr> …
    # $ LargerEnvelopeabs                                                              <chr> …
    # $ LargeEnvelopepercent                                                           <chr> …
    # $ SmallerEnvelopeabs                                                             <chr> …
    # $ SmallEnvelopepercent                                                           <chr> …

More options:

``` r
head(stickers)
```

    # # A tibble: 6 x 18
    #   SubjectNumber   Condition    NumberStickers NumberEnvelopes  Gender  Agemonths
    #   <chr>           <chr>        <chr>          <chr>            <chr>       <dbl>
    # 1 [Included Samp… 1=12:1; 2=1… 1=12; 2=30     1=1 recipient; … 1=fema…        NA
    # 2 1               1            1              1                1              36
    # 3 2               1            1              1                2              36
    # 4 3               1            1              1                2              36
    # 5 4               1            1              1                1              36
    # 6 5               1            1              1                2              36
    # # … with 12 more variables: Ageyears <dbl>, Agegroups <chr>,
    # #   Subject'sEnvelope <chr>, LeftEnvelope <chr>, RightEnvelope <chr>,
    # #   absolutenumberofstickersgiven(Conditions1or3:Outof12;Conditions2or4:Outof30) <chr>,
    # #   PercentGiven(Outof100percent) <chr>, Giveornot <chr>,
    # #   LargerEnvelopeabs <chr>, LargeEnvelopepercent <chr>,
    # #   SmallerEnvelopeabs <chr>, SmallEnvelopepercent <chr>

``` r
tail(stickers)
```

    # # A tibble: 6 x 18
    #   SubjectNumber Condition NumberStickers NumberEnvelopes Gender Agemonths
    #   <chr>         <chr>     <chr>          <chr>           <chr>      <dbl>
    # 1 396           1         1              1               2            136
    # 2 397           4         2              2               1            136
    # 3 398           1         1              1               1            137
    # 4 399           1         1              1               2            137
    # 5 400           4         2              2               2            139
    # 6 401           3         2              1               1            143
    # # … with 12 more variables: Ageyears <dbl>, Agegroups <chr>,
    # #   Subject'sEnvelope <chr>, LeftEnvelope <chr>, RightEnvelope <chr>,
    # #   absolutenumberofstickersgiven(Conditions1or3:Outof12;Conditions2or4:Outof30) <chr>,
    # #   PercentGiven(Outof100percent) <chr>, Giveornot <chr>,
    # #   LargerEnvelopeabs <chr>, LargeEnvelopepercent <chr>,
    # #   SmallerEnvelopeabs <chr>, SmallEnvelopepercent <chr>

``` r
names(stickers)
```

    #  [1] "SubjectNumber"                                                               
    #  [2] "Condition"                                                                   
    #  [3] "NumberStickers"                                                              
    #  [4] "NumberEnvelopes"                                                             
    #  [5] "Gender"                                                                      
    #  [6] "Agemonths"                                                                   
    #  [7] "Ageyears"                                                                    
    #  [8] "Agegroups"                                                                   
    #  [9] "Subject'sEnvelope"                                                           
    # [10] "LeftEnvelope"                                                                
    # [11] "RightEnvelope"                                                               
    # [12] "absolutenumberofstickersgiven(Conditions1or3:Outof12;Conditions2or4:Outof30)"
    # [13] "PercentGiven(Outof100percent)"                                               
    # [14] "Giveornot"                                                                   
    # [15] "LargerEnvelopeabs"                                                           
    # [16] "LargeEnvelopepercent"                                                        
    # [17] "SmallerEnvelopeabs"                                                          
    # [18] "SmallEnvelopepercent"

``` r
# View()
```

Now we are ready to diagnose the problem!

**Problem**: the first row is not really data. It is metadata about the variables, and it is screwing up **readr**’s ability to predict our column types.

**Solution**: we’ll use **readr** and the `read_tsv()` function to read in the data twice. In Step 1, we’ll create a character vector of the column names only. In Step 2, we’ll read in the actual data and skip the multiple header rows at the top. When we do this, we lose the column names, so we use the character vector of column names we created in Step 1 instead.

## Read in the file (again)

### Step 1

**Goal**: we want to read in the first row only and save it as a character vector called `sticker_names`. This row contains the correct column names that we’ll need in Step 2.

``` r
sticker_names <- link %>% 
  read_tsv(n_max = 0) %>% # default: col_names = TRUE
  rename(stickersgiven = 'absolutenumberofstickersgiven(Conditions1or3:Outof12;Conditions2or4:Outof30)') %>% 
  names()
sticker_names
```

    #  [1] "SubjectNumber"                 "Condition"                    
    #  [3] "NumberStickers"                "NumberEnvelopes"              
    #  [5] "Gender"                        "Agemonths"                    
    #  [7] "Ageyears"                      "Agegroups"                    
    #  [9] "Subject'sEnvelope"             "LeftEnvelope"                 
    # [11] "RightEnvelope"                 "stickersgiven"                
    # [13] "PercentGiven(Outof100percent)" "Giveornot"                    
    # [15] "LargerEnvelopeabs"             "LargeEnvelopepercent"         
    # [17] "SmallerEnvelopeabs"            "SmallEnvelopepercent"

``` r
glimpse(sticker_names)
```

    #  chr [1:18] "SubjectNumber" "Condition" "NumberStickers" "NumberEnvelopes" ...

### Step 2

**Goal**: we want to read in all the rows *except* for the first two rows, which contained the variable names and variable descriptions. We want to save this as `stickers`, and set the column names to the `sticker_names` object we created in Step 1.

``` r
stickers <- link %>% 
  read_tsv(skip = 2, col_names = sticker_names)
glimpse(stickers)
```

    # Rows: 401
    # Columns: 18
    # $ SubjectNumber                   <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,…
    # $ Condition                       <dbl> 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3,…
    # $ NumberStickers                  <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2,…
    # $ NumberEnvelopes                 <dbl> 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1,…
    # $ Gender                          <dbl> 1, 2, 2, 1, 2, 2, 1, 2, 2, 2, 2, 1, 1,…
    # $ Agemonths                       <dbl> 36, 36, 36, 36, 36, 36, 36, 36, 36, 36…
    # $ Ageyears                        <dbl> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,…
    # $ Agegroups                       <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,…
    # $ `Subject'sEnvelope`             <dbl> 7, 12, 4, 7, 12, 8, 8, 11, 26, 30, 12,…
    # $ LeftEnvelope                    <dbl> 5, 0, 8, 5, 0, 4, 2, 1, 4, 0, 18, 18, …
    # $ RightEnvelope                   <dbl> NA, NA, NA, NA, NA, NA, 2, 0, NA, NA, …
    # $ stickersgiven                   <dbl> 5, 0, 8, 5, 0, 4, 4, 1, 4, 0, 18, 18, …
    # $ `PercentGiven(Outof100percent)` <dbl> 0.42, 0.00, 0.67, 0.42, 0.00, 0.33, 0.…
    # $ Giveornot                       <dbl> 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0,…
    # $ LargerEnvelopeabs               <dbl> NA, NA, NA, NA, NA, NA, 2, 1, NA, NA, …
    # $ LargeEnvelopepercent            <dbl> NA, NA, NA, NA, NA, NA, 0.5000000, 1.0…
    # $ SmallerEnvelopeabs              <dbl> NA, NA, NA, NA, NA, NA, 2, 0, NA, NA, …
    # $ SmallEnvelopepercent            <dbl> NA, NA, NA, NA, NA, NA, 0.5000000, 0.0…

## Fin!

All together now: the final solution!

``` r
# load packages
library(readr)
library(dplyr)

# create variable to store url
link <- "https://dataverse.harvard.edu/api/access/datafile/2712105"

# read in column names only
sticker_names <- link %>% 
  read_tsv(n_max = 0) %>% # default: col_names = TRUE
  rename(stickersgiven = 'absolutenumberofstickersgiven(Conditions1or3:Outof12;Conditions2or4:Outof30)') %>% 
  names()

# read in data, set column names
stickers <- link %>% 
  read_tsv(skip = 2, col_names = sticker_names)
```

## Addendum

For good measure, I would add a final step to everything above and use `janitor::clean_names()` to put all the variable names into snake case. So my final final solution is here:

``` r
# load packages
library(readr)
library(dplyr)
library(janitor)

# create variable to store url
link <- "https://dataverse.harvard.edu/api/access/datafile/2712105"

# read in column names only
sticker_names <- link %>% 
  read_tsv(n_max = 0) %>% # default: col_names = TRUE
  rename(stickersgiven = 'absolutenumberofstickersgiven(Conditions1or3:Outof12;Conditions2or4:Outof30)') %>% 
  names()

# read in data, set column names
stickers <- link %>% 
  read_tsv(skip = 2, col_names = sticker_names) %>% 
  clean_names()
```

``` r
stickers
```

    # # A tibble: 401 x 18
    #    subject_number condition number_stickers number_envelopes gender agemonths
    #             <dbl>     <dbl>           <dbl>            <dbl>  <dbl>     <dbl>
    #  1              1         1               1                1      1        36
    #  2              2         1               1                1      2        36
    #  3              3         1               1                1      2        36
    #  4              4         1               1                1      1        36
    #  5              5         1               1                1      2        36
    #  6              6         1               1                1      2        36
    #  7              7         2               1                2      1        36
    #  8              8         2               1                2      2        36
    #  9              9         3               2                1      2        36
    # 10             10         3               2                1      2        36
    # # … with 391 more rows, and 12 more variables: ageyears <dbl>, agegroups <dbl>,
    # #   subjects_envelope <dbl>, left_envelope <dbl>, right_envelope <dbl>,
    # #   stickersgiven <dbl>, percent_given_outof100percent <dbl>, giveornot <dbl>,
    # #   larger_envelopeabs <dbl>, large_envelopepercent <dbl>,
    # #   smaller_envelopeabs <dbl>, small_envelopepercent <dbl>

``` r
glimpse(stickers)
```

    # Rows: 401
    # Columns: 18
    # $ subject_number                <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1…
    # $ condition                     <dbl> 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 4…
    # $ number_stickers               <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2…
    # $ number_envelopes              <dbl> 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 2…
    # $ gender                        <dbl> 1, 2, 2, 1, 2, 2, 1, 2, 2, 2, 2, 1, 1, 1…
    # $ agemonths                     <dbl> 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, …
    # $ ageyears                      <dbl> 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3…
    # $ agegroups                     <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    # $ subjects_envelope             <dbl> 7, 12, 4, 7, 12, 8, 8, 11, 26, 30, 12, 1…
    # $ left_envelope                 <dbl> 5, 0, 8, 5, 0, 4, 2, 1, 4, 0, 18, 18, 0,…
    # $ right_envelope                <dbl> NA, NA, NA, NA, NA, NA, 2, 0, NA, NA, NA…
    # $ stickersgiven                 <dbl> 5, 0, 8, 5, 0, 4, 4, 1, 4, 0, 18, 18, 0,…
    # $ percent_given_outof100percent <dbl> 0.42, 0.00, 0.67, 0.42, 0.00, 0.33, 0.33…
    # $ giveornot                     <dbl> 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1…
    # $ larger_envelopeabs            <dbl> NA, NA, NA, NA, NA, NA, 2, 1, NA, NA, NA…
    # $ large_envelopepercent         <dbl> NA, NA, NA, NA, NA, NA, 0.5000000, 1.000…
    # $ smaller_envelopeabs           <dbl> NA, NA, NA, NA, NA, NA, 2, 0, NA, NA, NA…
    # $ small_envelopepercent         <dbl> NA, NA, NA, NA, NA, NA, 0.5000000, 0.000…

## Bonus data dictionary

As an extra bonus, when you do have extra header rows, you can create a data dictionary using the `gather()` function from the **tidyr** package.

``` r
library(tidyr)
stickers_dict <- read_tsv(link, n_max = 1) %>% 
  rename(stickersgiven = 'absolutenumberofstickersgiven(Conditions1or3:Outof12;Conditions2or4:Outof30)') %>% 
  clean_names() %>% 
  gather(variable_name, variable_description)
stickers_dict
```

    # # A tibble: 18 x 2
    #    variable_name           variable_description                                 
    #    <chr>                   <chr>                                                
    #  1 subject_number          [Included Sample Only]                               
    #  2 condition               1=12:1; 2=12:2, 3=30:1, 4=30:2                       
    #  3 number_stickers         1=12; 2=30                                           
    #  4 number_envelopes        1=1 recipient; 2=2 recipients                        
    #  5 gender                  1=female; 2=male                                     
    #  6 agemonths               <NA>                                                 
    #  7 ageyears                <NA>                                                 
    #  8 agegroups               1=3-4yrs; 2=5-6yrs; 3=7-8yrs; 4=9-11yrs              
    #  9 subjects_envelope       How many stickers did the child keep for themselves …
    # 10 left_envelope           1 recipient conditions: How many stickers the subjec…
    # 11 right_envelope          1 recipient conditions: N/A; 2 recipient conditions:…
    # 12 stickersgiven           Regardless of condition, the number of stickers the …
    # 13 percent_given_outof100… Regardless of condition, the proportion of stickers …
    # 14 giveornot               1=Donated 1 or more stickers to the recipient(s); 0=…
    # 15 larger_envelopeabs      Raw number of stickers (out of 30: Condition 2 or 4 …
    # 16 large_envelopepercent   Proportion of stickers (out of 100%; Condition 2 or …
    # 17 smaller_envelopeabs     Raw number of stickers (out of 30: Condition 2 or 4 …
    # 18 small_envelopepercent   Proportion of stickers (out of 100%; Condition 2 or …

## Useful resources

-   Great blog post from [Lisa DeBruine](https://twitter.com/lisadebruine) using `readxl` to read in data with multiple header rows (including those with merged cells!): https://debruine.github.io/multirow\_headers.html
-   This GitHub issue with Hadley’s response that solved all my problems:
    https://github.com/tidyverse/readr/issues/179
-   My original tweet when I discovered this trick!

{{% tweet "904772340902379520" %}}
