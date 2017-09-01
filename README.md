# tidyviz-shiny
Companion Shiny Image for TidyViz

[![Build Status](https://img.shields.io/badge/build-passed-brightgreen.svg)](https://img.shields.io/badge/build-passed-brightgreen.svg) [![](https://images.microbadger.com/badges/version/jvera/tidyviz-shiny.svg)](https://microbadger.com/images/jvera/tidyviz-shiny "Get your own version badge on microbadger.com")  [![license](https://img.shields.io/badge/license-GPLv2-blue.svg)](https://opensource.org/licenses/GPL-2.0)


image            | description                               | size   | metrics | build status 
---------------- | ----------------------------------------- | ------ | ------- | --------------
[tidyviz-shiny](https://hub.docker.com/r/jvera/tidyviz-shiny)            |  base is tidyviz |[![](https://images.microbadger.com/badges/image/jvera/tidyviz-shiny.svg)](https://microbadger.com/images/jvera/tidyviz-shiny "Get your own image badge on microbadger.com")| [![](https://img.shields.io/docker/pulls/jvera/tidyviz-shiny.svg)](https://hub.docker.com/r/jvera/tidyviz-shiny) | [![](https://img.shields.io/docker/automated/jvera/tidyviz-shiny.svg)](https://hub.docker.com/r/jvera/tidyviz-shiny/builds)


Same packages from TidyViz image are installed here to keep sharing data easily. 
Follow procedures to share volumes between Docker containers for a proper workflow: programming in Tidyviz and sharing via tidyviz-shiny


## Usage:

Run container with:

docker run --rm -p 3838:3838 jvera/tidyviz-shiny

I recommend to expose a directory on the host to the container at same location as tidyviz container. Plus providing access to logs, command will be as follows:
(Note that if the directories on the host don't already exist, they will be created automatically)

docker run --rm -p 3838:3838 -v ~/dockerdata:/srv/shiny-server/ \
    -v /srv/shinylog/:/var/log/shiny-server/ \
    jvera/tidyviz-shiny

If you have an app in ~/dockerdata/appdir, you can run the app by visiting http://localhost:3838/appdir/

In a real deployment scenario, you will probably want to run the container in detached mode (-d) and listening on the host's port 80 (-p 80:3838):

docker run -d -p 80:3838 -v ~/dockerdata:/srv/shiny-server/ \
    -v /srv/shinylog/:/var/log/shiny-server/ \
    jvera/tidyviz-shiny





Launch Rstudio server from docker container

For example, you can ssh into your AWS instance, here I suppose you already have docker installed, and pull the image

docker pull tengfei/sevenbridges
To launch sevenbridges Rstudio server image, I recommend you read this tutorial

Or following the quick instruction here

docker run -d -p 8787:8787 tengfei/sevenbridges
docker run -d -p 8787:8787 -e USER=<username> -e PASSWORD=<password> rocker/rstudio
You will be able to access the Rstudio in the browser by something like

http://<your ip address>:8787

Sometimes you want to add more users, to add users

## Enter the container
docker exec -it <container-id> bash
## Interactively input password and everything else
adduser <username>
Launch both Rstudio and Shiny server from same docker container

Sometimes it’s very conventient to launch both Rstudio and Shiny server from a singel container and your users can manage to using Rstudio and publish Shiny apps at the same time in the same container. To do so, just pull the same image and launch them at different port.

docker run  -d -p 8787:8787 -p 3838:3838 --name rstudio_shiny_server tengfei/sevenbridges
To mount file system you need to use --privileged with fuse.

docker run  --privileged -d -p 8787:8787 -p 3838:3838 --name rstudio_shiny_server tengfei/sevenbridges
check out the ip from docker machine if you are on mac os.

docker-machine ip default
In your browser, http://<url>:8787/ for Rstudio server, for example, if 192.168.99.100 is what returned, visit  http://192.168.99.100:8787/ for Rstudio.

For shiny server, per user app is hosted http://<url>:3838/users/<username of rstudio>/<app_dir>, for example, for user rstudio (a default user) and an app called 01_hello, it will be http://<url>:3838/users/rstudio/01_hello/. To develop your shiny app from Rstudio server, you can login your rstudio server with your username, and create a fold at home folder called ~/ShinyApps and develop shiny apps under that folder, for example, you can create an app called 02_text at  ~/ShinyApps/02_text/.

Let’s try this, please login your rstudio at http://<url>:8787 now, then try to copy some example over to your home folder under ~/ShinyApps/

dir.create("~/ShinyApps")
file.copy("/usr/local/lib/R/site-library/shiny/examples/01_hello/", "~/ShinyApps/", recursive = TRUE)
If you are login as username ‘rstudio’, then visit http://192.168.99.100:3838/rstudio/01_hello you should be able to see the hello example.

Note: Generic shiny app can also be hosted http://<url>:3838/ or for particular app, http://<url>:3838/<app_dir> and inside the docker container, it’s hosted under /srv/shiny-server/
