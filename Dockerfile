FROM jvera/tidyviz:latest

LABEL maintainer "vera.josemanuel [AT] gmail dot com"

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  gdebi \
&& wget --no-verbose https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/VERSION -O "version.txt" && \
    VERSION=$(cat version.txt)  && \
    wget --no-verbose "https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/shiny-server-$VERSION-amd64.deb" -O shiny-server-latest.deb && \
    gdebi -n shiny-server-latest.deb && \
    rm -f version.txt shiny-server-latest.deb

RUN Rscript -e "install.packages(c('shiny', 'rmarkdown', 'rsconnect'), repos = 'https://cran.rstudio.com/')"

RUN cp -R /usr/local/lib/R/site-library/shiny/examples/* /srv/shiny-server/

RUN mkdir /home/rstudio/ShinyApps/

RUN cp -R /usr/local/lib/R/site-library/shiny/examples/* /home/rstudio/ShinyApps/

EXPOSE 3838 8787

# COPY src/shiny-server.sh /usr/bin/shiny-server.sh
# RUN wget --no-verbos https://raw.githubusercontent.com/sbg/sevenbridges-r/master/inst/docker/sevenbridges/src/shiny-server.conf -P /etc/shiny-server/
# RUN wget --no-verbos https://raw.githubusercontent.com/sbg/sevenbridges-r/master/inst/docker/sevenbridges/src/supervisord.conf    -P /etc/shiny-server/
COPY src/shiny-server.conf  /etc/shiny-server/shiny-server.conf
COPY src/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

## set directory to `~/ShinyApps`
# RUN yes | /opt/shiny-server/bin/deploy-example user-dirs
# RUN cp -R /usr/local/lib/R/site-library/shiny/examples/* ~/ShinyApps/

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
# CMD ["/init;/usr/bin/shiny-server.sh"]
# CMD ["sh", "-c", "/usr/bin/shiny-server.sh;/init"]

RUN apt-get clean \
&& rm -rf /var/lib/apt/lists/ \
&& rm -rf /tmp/downloaded_packages/  /tmp/*.rds
