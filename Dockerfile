FROM rocker/shiny:latest

LABEL maintainer "vera.josemanuel@gmail.com"

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
  && . /etc/environment
 
RUN install2.r Amelia \
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
corrplot \
data.table \
desctable \
devtools \
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
ggraph \
ggrepel \
ggsci \
ggThemeAssist \
ggthemes \
ggvis \
glue \
gmodels \
gpclib \
gridExtra \
gtable \
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
rio \
riverplot \
rmdformats \
rticles \
scatterplot3d \
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
&& Rscript -e 'devtools::install_github(c("hadley/precis","rstats-db/RPostgres","smach/rmiscutils","yihui/printr","drsimonj/twidlr","dyerlab/popgraph","houstonusers/pipefittr","swarm-lab/editR","ropensci/tabulizerjars","ropensci/tabulizer","thomasp85/lime","thomasp85/tweenr","hrbrmstr/hrbrthemes","gabrielrvsc/HDeconometrics"))'
RUN echo "install.packages('rJava', repos='http://www.rforge.net/', configure.args='--disable-Xrs')" | R --no-save \
&& R CMD javareconf
RUN apt-get clean \
&& rm -rf /var/lib/apt/lists/ \
&& rm -rf /tmp/downloaded_packages/  /tmp/*.rds
