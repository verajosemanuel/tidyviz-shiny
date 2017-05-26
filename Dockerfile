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
assertr \
assertthat \
car \
caret \
chunked \
cluster \
colorspace \
confinterpret \
corrplot \
data.table \
desctable \
diffobj \
DT \
filesstrings \
flexdashboard \
formatR \
formattable \
gbm \
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
gsubfn \
ggThemeAssist \
ggthemes \
ggvis \
glue \
gmodels \
gpclib \
gridExtra \
gtable \
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
lmtest \
magrittr \
microbenchmark \
NMF \
pathological \
pdftools \
plotly \
plotrr \
prettydoc \
profvis \
psych \
R.utils \
RColorBrewer \
Rcpp \
revealjs \
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
tester \
textclean \
tidytext \
tidyxl \
tm \
topicmodels \
tufte \
udunits2 \
validate \
viridis \
VIM \
wordcloud \
choroplethr \
choroplethrMaps \
DiagrammeR \
dummies \
e1071 \
effects \
FFTrees \
gap \
kernlab \
listviewer \
maptools \
MASS \
Matrix \
mi \
mice \
missForest \
nloptr \
party \
progress \
randomForest \
RcppQuantuccia \
RCurl \
rgdal \
rms \
rpg \
sp \
timekit \
tmaptools \
tseries \
XML \
xts \
zoo \
&& Rscript -e 'devtools::install_github(c("drsimonj/twidlr","dyerlab/popgraph","houstonusers/pipefittr","swarm-lab/editR","ropensci/tabulizerjars","ropensci/tabulizer","ThinkRstat/littleboxes","thomasp85/lime","gabrielrvsc/HDeconometrics","RhoInc/CRANsearcher","hadley/precis","rstats-db/RPostgres","smach/rmiscutils","yihui/printr","hrbrmstr/hrbrthemes","thomasp85/tweenr","hafen/geofacet"))' \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/ \
&& rm -rf /tmp/downloaded_packages/  /tmp/*.rds
