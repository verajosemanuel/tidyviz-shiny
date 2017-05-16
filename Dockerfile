FROM rocker/shiny:latest

LABEL maintainer "vera.josemanuel@gmail.com"

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libsqlite-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  libudunits2-dev \
  libgdal1-dev \
  libproj-dev \
  openjdk-7-jre \
  openjdk-7-jdk \
  libv8-3.14-dev \
  libgsl0-dev \
  && . /etc/environment
 
RUN install2.r addinslist \
Amelia \
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
diffobj \
DT \
errors \
filesstrings \
flexdashboard \
formatR \
formattable \
gbm \
GGally \
ggbeeswarm \
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
highcharter \
Hmisc \
htmlwidgets \
httpuv \
huxtable \
igraph \
janitor \
knitr \
leaflet \
leaps \
lmtest \
magrittr \
microbenchmark \
NMF \
pathological \
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
rmarkdown \
rmdformats \
rticles \
scatterplot3d \
shinyjs \
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
arules \
arulesViz \
BTYD \
BTYDplus \
choroplethr \
choroplethrMaps \
cranlogs \
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
RcppEigen \
RcppQuantuccia \
RCurl \
RDocumentation \
rgdal \
rms \
rpg \
sp \
timekit \
tmaptools \
tseries \
XML \
xts \
zoo  
RUN Rscript -e 'devtools::install_github(c("hadley/precis","rstats-db/RPostgres","smach/rmiscutils","yihui/printr","drsimonj/twidlr","dyerlab/popgraph","houstonusers/pipefittr","swarm-lab/editR","ropensci/tabulizerjars","ropensci/tabulizer","ThinkRstat/littleboxes","thomasp85/lime"))'
RUN echo "install.packages('rJava', repos='http://www.rforge.net/', configure.args='--disable-Xrs')" | R --no-save \
&& R CMD javareconf
RUN apt-get clean \
&& rm -rf /var/lib/apt/lists/ \
&& rm -rf /tmp/downloaded_packages/  /tmp/*.rds