---
title: "Netlify: Continuous Deployment"

date: 2018-09-09T00:00:00.000Z
lastmod: 2018-09-09T00:00:00.000Z

draft: false # Is this a draft? true/false
toc: true # Show table of contents? true/false
type: docs # Do not modify.

# Add menu entry to sidebar.
linktitle: "Netlify: Continuous Deployment"
menu:
  tutorial-blogdown:
    parent: "03-Deploy your site"
    weight: 10
---


![](/img/posts/2017-06-12-up-and-running-with-blogdown/blogdown-signpost-5.png)

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





![Screenshot above: Basic build settings in Netlify](/img/posts/2017-06-12-up-and-running-with-blogdown/netlify-build-settings.png)

Netlify will deploy your site and assign you a random subdomain name of the form `random-word-12345.netlify.com`. Mine was particularly unfortunate, with the random word `garbage-collector-janice`. You should know that you can change this; I changed mine to `apreshill.netlify.com`. 


{{% alert note %}}
Anytime you change your subdomain name, you need to update the `baseurl` in your `config.toml` file (so I changed mine to baseurl = "https://apreshill.netlify.com/").
{{% /alert %}}


At this point, you should be up and running with `blogdown`, GitHub, and Netlify, but here are some ideas if you want to go further...
