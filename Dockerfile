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
  libv8-3.14-dev \
  libgsl0-dev \
  libssl-dev \
  nano \
  vim \
  openjdk-8-jdk \
  && R CMD javareconf \
  && sudo su - -c "R -e \"install.packages('devtools', repos='cran.rstudio.com/')\"" \
  && echo "install.packages('rJava', repos='http://www.rforge.net/', configure.args='--disable-Xrs')" | R --no-save \
  && R CMD javareconf \
  && . /etc/environment
    
RUN install2.r tidyverse \
Amelia \
animation \
anytime \
assertive \
car \
caret \
colorspace \
corrplot \
data.table \
desctable \
DT \
filesstrings \
flexdashboard \
formattable \
gbm \
geosphere \
gganimate \
GGally \
ggbeeswarm \
ggforce \
ggfortify \
ggiraph \
ggmap \
ggraph \
ggrepel \
ggsci \
glmnet \
gsubfn \
ggThemeAssist \
ggthemes \
ggvis \
glue \
gmodels \
gpclib \
gridExtra \
gtable \
heatmaply \
hexbin \
highcharter \
Hmisc \
htmlwidgets \
httpuv \
huxtable \
igraph \
janitor \
leaflet \
leaps \
magrittr \
pathological \
plotly \
plotrr \
prettydoc \
psych \
R.utils \
RColorBrewer \
revealjs \
RgoogleMaps \
rio \
riverplot \
rmdformats \
rticles \
sas7bdat \
lessR \
scatterplot3d \
sjmisc \
sjPlot \
stringdist \
summarytools \
tufte \
viridis \
wordcloud \
choroplethr \
choroplethrMaps \
DiagrammeR \
gap \
maptools \
MASS \
nloptr \
party \
progress \
rgdal \
rms \
rpg \
sp \
tmaptools \
&& Rscript -e 'devtools::install_github(c("drsimonj/twidlr","dyerlab/popgraph","houstonusers/pipefittr","swarm-lab/editR","ropensci/tabulizerjars","ropensci/tabulizer","ThinkRstat/littleboxes","thomasp85/lime","gabrielrvsc/HDeconometrics","RhoInc/CRANsearcher","hadley/precis","ropenscilabs/skimr","rstats-db/RPostgres","smach/rmiscutils","yihui/printr","hrbrmstr/hrbrthemes","thomasp85/tweenr","hafen/geofacet"))' \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/ \
&& rm -rf /tmp/downloaded_packages/  /tmp/*.rds
