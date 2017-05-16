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
