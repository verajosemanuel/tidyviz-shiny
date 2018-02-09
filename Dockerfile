FROM rocker/shiny:latest

LABEL maintainer "vera.josemanuel [AT] gmail dot com"

RUN install2.r --error \
    assertthat \
    covr \
    DBI \
    dendextend \
    dplyr \
    dtplyr \
    drat \
    dygraphs \
    DiagrammeR \
    extrafont \
    feather \
    forcats \
    forecast \
    fst \
    ggplot2 \
    ggthemes \
    ggrepel \
    ggpubr \
    infuser \
    jsonlite \
    knitr \
    leaflet \
    lubridate \
    mailR \
    openxlsx \
    pander \
    PerformanceAnalytics \
    PKI \
    R6 \
    packrat \
    RcppArmadillo \
    RColorBrewer \
    RJDBC \
    RJSONIO \
    pkgconfig \
    RPostgreSQL \
    RcppArmadillo \
    purrr \
    progress \
    rmarkdown \
    rlang \
    rvest \
    shinythemes \
    shinydashboard \
    showtext \
    stringr \
    testthat \
    tibble \
    tidyverse \
    treemap \
    V8 \
    viridisLite \
    whoami \
    writexl \
    xml2 \
    xtable \
    xts \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Github version packages
RUN R -e " \
devtools::install_github('rstudio/bookdown'); \
devtools::install_github('rstudio/d3heatmap'); \
devtools::install_github('Rdatatable/data.table'); \
devtools::install_github('gluc/data.tree', ref = 'dev'); \
devtools::install_github('rstudio/DT'); \
devtools::install_github('rstudio/pool'); \
devtools::install_github('rstudio/flexdashboard'); \
devtools::install_github('renkun-ken/formattable'); \
devtools::install_github('jrnold/ggthemes'); \
devtools::install_github('Ather-Energy/ggTimeSeries'); \
devtools::install_github('ricardo-bion/ggradar'); \
devtools::install_github('jbkunst/highcharter'); \
devtools::install_github('ramnathv/htmlwidgets'); \
devtools::install_github('hadley/httr'); \
devtools::install_github('hrbrmstr/metricsgraphics'); \
devtools::install_github('hadley/readr'); \
devtools::install_github('rstudio/rmarkdown'); \
devtools::install_github('imanuelcostigan/RSQLServer'); \
devtools::install_github('rstudio/shiny'); \
devtools::install_github('ebailey78/shinyBS', ref = 'shinyBS3'); \
devtools::install_github('daattali/shinyjs'); \
devtools::install_github('trestletech/shinyStore'); \
devtools::install_github('hrbrmstr/streamgraph'); \
devtools::install_github('hadley/svglite'); \
devtools::install_github('wilkox/treemapify'); \
devtools::install_github('joshuaulrich/xts'); \
devtools::install_github('trestletech/shinyStore'); \
"

# Make semi ENTRYPOINT
# COPY rstudio-server.sh /usr/bin/rstudio-server.sh

EXPOSE 3838

COPY shiny-server.sh /usr/bin/shiny-server.sh

CMD ["/usr/bin/shiny-server.sh"]
