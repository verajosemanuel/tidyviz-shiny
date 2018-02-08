FROM rocker/shiny:latest

LABEL maintainer "vera.josemanuel [AT] gmail dot com"

RUN R -e "install.packages('ggplot2', repos='https://cran.rstudio.com/')"
