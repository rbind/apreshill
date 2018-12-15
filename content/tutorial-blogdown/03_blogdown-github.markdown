---
title: "New project, GitHub first"

date: 2018-09-09T00:00:00.000Z
lastmod: 2018-09-09T00:00:00.000Z

draft: false # Is this a draft? true/false
toc: true # Show table of contents? true/false
type: docs # Do not modify.

# Add menu entry to sidebar.
linktitle: "New project, GitHub first"
menu:
  tutorial-blogdown:
    parent: "01-Getting Started"
    weight: 3
---


For blogdown, I suggest adopting [a new project, GitHub first workflow](http://happygitwithr.com/new-github-first.html). 

## Make a repo on GitHub {#githubfirst}

![](/img/posts/2017-06-12-up-and-running-with-blogdown/blogdown-signpost-1.png)


1. Go online to your [GitHub](https://github.com) account, and create a new repository (check to initialize with a `README` but don't add `.gitignore`- this will be taken care of later). For naming your repo, consider your future deployment plan:

  * If you are going to use [Netlify](https://www.netlify.com) to host the site, you can name this repository anything you want! 
  {{% alert note %}}
  You can see some of the repo names used by members of the `rbind` organization [here](https://github.com/rbind/repositories). 
  {{% /alert %}}
  * If you want to host your site as a [GitHub Page](https://pages.github.com), you should name your repository `yourgithubusername.github.io` (so mine would have been `apreshill.github.io`). If you are going this route, I suggest you follow [Amber's instructions](https://proquestionasker.github.io/blog/Making_Site/) instead of mine!
    


    ![Screenshot above: Creating a new repository in GitHub](/img/posts/2017-06-12-up-and-running-with-blogdown/github-new-repo.png)

1. Go to the main page of your new repository, and under the repository name, click the green **Clone or download** button.

1. In the **Clone with HTTPs** section, click on the clipboard icon to copy the clone URL for your new repository. You'll paste this text in the next section.

## New RStudio Project via git clone {#clone}

Now you will [clone your remote repository](https://help.github.com/articles/cloning-a-repository/) and create a local copy on your computer so you can sync between the two locations. You have two options here: choose either to do this in [RStudio](#rstudioclone) (recommended), or in the [terminal/RStudio](#terminalclone).

![](/img/posts/2017-06-12-up-and-running-with-blogdown/blogdown-signpost-2.png)

### Option 1: in RStudio {#rstudioclone}

We'll follow [Jenny's instructions](http://happygitwithr.com/new-github-first.html#new-rstudio-project-via-git-clone).

1. _File > New Project > Version Control > Git_. 
1. In the "repository URL" paste the URL of your new GitHub repository. It will be something like this https://github.com/rbind/apreshill.git.
1. Press the _tab_ key to automatically fill in the project name.
1. Check **Open in new session**
1. Click on the **Create Project** button

![](/img/new-proj-github.png)

### Option 2: in terminal/RStudio {#terminalclone}

1. Use `cd` to navigate into the directory where you want your repo to be

1. Once there, type: `git clone [paste]`. So my command looked like this:

    ```
    git clone https://github.com/apreshill/apreshill.git
    ```

    And this is what printed to my terminal window:

    ```
    Cloning into 'apreshill'...
    remote: Counting objects: 3, done.
    remote: Compressing objects: 100% (2/2), done.
    remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
    Unpacking objects: 100% (3/3), done.
    Checking connectivity... done.
    ```

1. Close terminal. You are done in there.

1. In RStudio, use the top menu buttons in RStudio to select _File > New Project > Existing Directory_, then browse to the directory on your computer where your GitHub repo is and click on the **Create Project** button.

![Screenshot above: Creating a new project in an existing directory in RStudio](/img/posts/2017-06-12-up-and-running-with-blogdown/r-project-existing-directory.png)

## Check-in {#checkin}

Either way, you should now be "in" your project in RStudio. Are you there?

## Update .gitignore file {#gitignore}

If you are using git for version control, edit your `.gitignore` file. This file should be viewable in your file viewer pane in RStudio. Below is what it should look like: the first four lines will automatically be in this file if you have set up your RStudio Project, but if you plan to use Netlify to deploy, you need to add the `public/` line ([read about here](https://bookdown.org/yihui/blogdown/version-control.html).)

```
.Rproj.user
.Rhistory
.RData
.Ruserdata
blogdown
.DS_Store # if a windows user, Thumbs.db instead
public # if using Netlify
```

## Update project options {#options}

In your project in RStudio, go to the top menu bar of RStudio and select `Tools -> Project Options` and update following [our instructions](https://bookdown.org/yihui/blogdown/rstudio-ide.html#fig:project-options).

![](https://bookdown.org/yihui/blogdown/images/project-options.png)

