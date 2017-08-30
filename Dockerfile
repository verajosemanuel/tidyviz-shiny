FROM rocker/shiny:latest

LABEL maintainer "vera.josemanuel [AT] gmail dot com"

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libsqlite-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  libudunits2-dev \
  libproj-dev \
  libgsl0-dev \
  nano \
  vim \
  imagemagick \
  libmagick++-dev \
  libgdal-dev \
  libgeos-dev \
  libgeos++-dev \
  libspatialite-dev \
  libv8-3.14-dev \
  libgtk2.0-dev \
  xfonts-base \
  libnlopt-dev \
  libgomp1 \
  libssl-dev \
  libpango1.0-dev \
  libpng-dev \
  libtiff5-dev \
  libjpeg62-turbo-dev \
  r-cran-rgtk2 \
  openjdk-8-jre \
  openjdk-8-jdk \
  && R CMD javareconf \
  && sudo su - -c "R -e \"install.packages('devtools', repos='cran.rstudio.com/')\"" \
  && echo "install.packages('rJava', repos='http://www.rforge.net/', configure.args='--disable-Xrs')" | R --no-save \
  && R CMD javareconf \
  && . /etc/environment \
&& install2.r tidyverse \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/ \
&& rm -rf /tmp/downloaded_packages/  /tmp/*.rds
