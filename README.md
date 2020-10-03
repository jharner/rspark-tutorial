### rspark-tutorial

`rspark-tutorial` provides content illustrating the use of `rspark`, a Docker-based computing environment. `rspark` runs R, RStudio, PostgreSQL, Hadoop, Hive, and Spark in containers on your local computer (or optionally on AWS). The content covers a range of topics including many aspects of the `tidyverse`, machine learning using Spark, etc.

This tutorial is meant to run in conjunction with `rspark-docker`, which contains images of the `rspark` components. The steps for installing and launching the `rspark-docker` containers is given here:  

[https://github.com/jharner/rspark-docker](https://github.com/jharner/rspark-docker)  

#### Downloading the `rspark-tutorial content

To get access to the tutorial content within `rsaprk-docker`, do the following:

1. Make sure `git` is installed and up to date. This step should have been done when you cloned `rspark-docker`, but from the command line you can run:

git version

Compare the returned version with the current version. See the directions in the `rspark-docker` README for installing or updating, if necessary.

2. Issue the following command in a terminal to clone `rspark-tutorial`:  

git clone https://github.com/jharner/rspark-tutorial.git

This will create a directory (folder) in your home directory by default containing the local `git` repo of `rspark-tutorial`. If you prefer installing `rspark-tutorial` in another directory, `cd` there first.

#### Uploading the `rspark-tutorial` content to `rspark-docker`

Assuming that `rspark-docker` has been started and that you have logged into the RStudio container:

1. Zip the `rspark-tutorial` folder on your local computer.

2. Click on the `Files` tab in the RStudio container and then click the `Upload` menu item. Navigate to the zipped version of `rspark-tutorial` and upload.  

3. Execute the `.Rmd` files in the various modules/sections to generate R notebooks or R markdown output files.

Once you have cloned `rspark-tutorial`, you will be able to pull updates by issuing the following command from within the `rspark-tutorial` directory (folder):

`cd rspark-docker`  
`git pull origin master`  

The `git` pulls will keep your tutorial up to date.

If you want an excellent Git GUI, then download and install: [Sourcetree](https://www.sourcetreeapp.com).





