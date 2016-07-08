
import(file = file.choose(), file.type = "csv", sep = ",",
  header.at = 1, data.at = 2, date = "date",
  date.format = "%d/%m/%Y %H:%M", time = NULL, time.format = NULL,
  tzone = "GMT", na.strings = c("", "NA"), quote = "\"", ws = NULL,
  wd = NULL, correct.time = NULL, ...)



head(import(file = file.choose(), file.type = "csv", sep = ",",
  header.at = 1, data.at = 2, date = "Date",
  date.format = "%d/%m/%Y %H:%M", time = NULL, time.format = NULL,
  tzone = "GMT", na.strings = c("", "NA"), quote = "\"", ws = NULL,
  wd = NULL, correct.time = NULL))


paleta<-brewer.pal(8, "RdYlBu")

calendarPlot(chicagoMVT, year=2012,
             pollutant = "Mean_TemperatureC", 
             main="Tempuratura media, 2015",
             cols = rev(paleta))



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# load openair data if not loaded already

# aqStats Calculate summary statistics for air pollution data by year
aqStats(mydata, pollutant = "no2", data.thresh = 75, percentile = c(95,
99), transpose = FALSE, ...)

#calculo percentiles
calcPercentile(mydata, pollutant = "o3", avg.time = "month",
percentile = 50, data.thresh = 0, start = NA)


#This function will plot one year of data by month laid out in a conventional calendar format. The
#main purpose is to help rapidly visualise potentially complex data in a familiar way. Users can also
#choose to show daily mean wind vectors if wind speed and direction are available.

#calendarPlot
calendarPlot(mydata, pollutant = "nox", year = 2003, month = 1:12,
type = "default", annotate = "date", statistic = "mean",
cols = "heat", limits = c(0, 100), lim = NULL, col.lim = c("grey30",
"black"), font.lim = c(1, 2), cex.lim = c(0.6, 1), digits = 0,
data.thresh = 0, labels = NA, breaks = NA, w.shift = 0,
main = paste(pollutant, "in", year), key.header = "", key.footer = "",
key.position = "right", key = TRUE, auto.text = TRUE, ...)


# load example data from package
data(mydata)
# basic plot
calendarPlot(mydata, pollutant = "o3", year = 2003)
# show wind vectors
calendarPlot(mydata, pollutant = "o3", year = 2003, annotate = "wd")
## Not run:
# show wind vectors scaled by wind speed and different colours
calendarPlot(mydata, pollutant = "o3", year = 2003, annotate = "ws",
cols = "heat")
# show only specific months with selectByDate
calendarPlot(selectByDate(mydata, month = c(3,6,10), year = 2003),
pollutant = "o3", year = 2003, annotate = "ws", cols = "heat")
# categorical scale example
calendarPlot(mydata, pollutant = "no2", breaks = c(0, 50, 100, 150, 1000),
labels = c("Very low", "Low", "High", "Very High"),
cols = c("lightblue", "green", "yellow", "red"), statistic = "max")


## basic corrgram plot
corPlot(mydata)
## plot by season ... and so on
corPlot(mydata, type = "season")
## recover dendogram when cluster = TRUE and plot it
res <-corPlot(mydata)
plot(res$clust)
## Not run:
## a more interesting are hydrocarbon measurements
hc <- importAURN(site = "my1", year = 2005, hc = TRUE)
## now it is possible to see the hydrocarbons that behave most
## similarly to one another
corPlot(hc)


# delito por estaciones del año

cutData(x, type = "default", hemisphere = "northern", n.levels = 4,
start.day = 1, is.axis = FALSE, local.tz = NULL, latitude = 51,
longitude = -0.5, ...)



# seleccionar por año

## select all of 1999
data.1999 <- selectByDate(mydata, start = "1/1/1999", end = "31/12/1999")
head(data.1999)
tail(data.1999)

# or...
data.1999 <- selectByDate(mydata, start = "1999-01-01", end = "1999-12-31")
# easier way
data.1999 <- selectByDate(mydata, year = 1999)


smoothTrend(mydata, pollutant = "nox", deseason = FALSE, type = "default",
statistic = "mean", avg.time = "month", percentile = NA,
data.thresh = 0, simulate = FALSE, n = 200, autocor = FALSE,
cols = "brewer1", shade = "grey95", xlab = "year",
y.relation = "same", ref.x = NULL, ref.y = NULL,
key.columns = length(percentile), name.pol = pollutant, ci = TRUE,
alpha = 0.2, date.breaks = 7, auto.text = TRUE, k = NULL, ...)

splitByDate(mydata, dates = "1/1/2003", labels = c("before", "after"),
name = "split.by")



## split data up into "before" and "after"
mydata <- splitByDate(mydata, dates = "1/04/2000",
labels = c("before", "after"))
## split data into 3 partitions:
summaryPlot 125
mydata <- splitByDate(mydata, dates = c("1/1/2000", "1/3/2003"),
labels = c("before", "during", "after"))



summaryPlot(mydata, na.len = 24, clip = TRUE, percentile = 0.99,
type = "histogram", pollutant = "nox", period = "years",
breaks = NULL, col.trend = "darkgoldenrod2", col.data = "lightblue",
col.mis = rgb(0.65, 0.04, 0.07), col.hist = "forestgreen", cols = NULL,
date.breaks = 7, auto.text = TRUE, ...)




# load example data from package
data(mydata)
# do not clip density plot data
## Not run: summaryPlot(mydata, clip = FALSE)
# exclude highest 5 % of data etc.
## Not run: summaryPlot(mydata, percentile = 0.95)
# show missing data where there are at least 96 contiguous missing
# values (4 days)
## Not run: summaryPlot(mydata, na.len = 96)
# show data in green
## Not run: summaryPlot(mydata, col.data = "green")
# show missing data in yellow
## Not run: summaryPlot(mydata, col.mis = "yellow")
# show density plot line in black
## Not run: summaryPlot(mydata, col.dens = "black")


# load example data from package
data(mydata)
# trend plot for nox
TheilSen(mydata, pollutant = "nox")
# trend plot for ozone with p=0.01 i.e. uncertainty in slope shown at
# 99 % confidence interval
## Not run: TheilSen(mydata, pollutant = "o3", ylab = "o3 (ppb)", alpha = 0.01)
# trend plot by each of 8 wind sectors
## Not run: TheilSen(mydata, pollutant = "o3", type = "wd", ylab = "o3 (ppb)")
# and for a subset of data (from year 2000 onwards)
## Not run: TheilSen(selectByDate(mydata, year = 2000:2005), pollutant = "o3", ylab = "o3 (ppb)")



timeAverage(mydata, avg.time = "day", data.thresh = 0, statistic = "mean",
type = "default", percentile = NA, start.date = NA, end.date = NA,
interval = NA, vector.ws = FALSE, fill = FALSE, ...)


timeAverage(mydata, avg.time = "day", data.thresh = 0, statistic = "mean",
type = "default", percentile = NA, start.date = NA, end.date = NA,
interval = NA, vector.ws = FALSE, fill = FALSE, ...)



## daily average values
daily <- timeAverage(mydata, avg.time = "day")
## daily average values ensuring at least 75 % data capture
## i.e. at least 18 valid hours
## Not run: daily <- timeAverage(mydata, avg.time = "day", data.thresh = 75)
## 2-weekly averages
## Not run: fortnight <- timeAverage(mydata, avg.time = "2 week")
## make a 15-minute time series from an hourly one
## Not run:
min15 <- timeAverage(mydata, avg.time = "15 min", fill = TRUE)
## End(Not run)
# average by grouping variable
## Not run:
dat <- importAURN(c("kc1", "my1"), year = 2011:2013)
timeAverage(dat, avg.time = "year", type = "site")
# can also retain site code
timeAverage(dat, avg.time = "year", type = c("site", "code"))
# or just average all the data, dropping site/code
timeAverage(dat, avg.time = "year")
## End(Not run)


timePlot(mydata, pollutant = "nox", group = FALSE, stack = FALSE,
normalise = NULL, avg.time = "default", data.thresh = 0,
statistic = "mean", percentile = NA, date.pad = FALSE,
type = "default", cols = "brewer1", plot.type = "l", key = TRUE,
log = FALSE, windflow = NULL, smooth = FALSE, ci = TRUE,
y.relation = "same", ref.x = NULL, ref.y = NULL, key.columns = 1,
name.pol = pollutant, date.breaks = 7, date.format = NULL,
auto.text = TRUE, ...)





# basic use, single pollutant
timePlot(mydata, pollutant = "nox")
# two pollutants in separate panels
## Not run: timePlot(mydata, pollutant = c("nox", "no2"))
# two pollutants in the same panel with the same scale
## Not run: timePlot(mydata, pollutant = c("nox", "no2"), group = TRUE)
# alternative by normalising concentrations and plotting on the same
scale
## Not run:
timePlot(mydata, pollutant = c("nox", "co", "pm10", "so2"), group = TRUE, avg.time =
"year", normalise = "1/1/1998", lwd = 3, lty = 1)
## End(Not run)
# examples of selecting by date
# plot for nox in 1999
## Not run: timePlot(selectByDate(mydata, year = 1999), pollutant = "nox")
# select specific date range for two pollutants
## Not run:
timePlot(selectByDate(mydata, start = "6/8/2003", end = "13/8/2003"),
pollutant = c("no2", "o3"))
## End(Not run)
# choose different line styles etc
## Not run: timePlot(mydata, pollutant = c("nox", "no2"), lty = 1)
# choose different line styles etc
## Not run:
timePlot(selectByDate(mydata, year = 2004, month = 6), pollutant =
c("nox", "no2"), lwd = c(1, 2), col = "black")
## End(Not run)
# different averaging times
#daily mean O3
## Not run: timePlot(mydata, pollutant = "o3", avg.time = "day")
# daily mean O3 ensuring each day has data capture of at least 75%
## Not run: timePlot(mydata, pollutant = "o3", avg.time = "day", data.thresh = 75)
# 2-week average of O3 concentrations
## Not run: timePlot(mydata, pollutant = "o3", avg.time = "2 week")


timeProp(mydata, pollutant = "nox", proportion = "cluster",
avg.time = "day", type = "default", statistic = "mean",
normalise = FALSE, cols = "Set1", date.breaks = 7, date.format = NULL,
key.columns = 1, key.position = "right", key.title = proportion,
auto.text = TRUE, ...)


## monthly plot of SO2 showing the contribution by wind sector
timeProp(mydata, pollutant = "so2", avg.time = "month", proportion = "wd")

timeVariation(mydata, pollutant = "nox", local.tz = NULL,
normalise = FALSE, xlab = c("hour", "hour", "month", "weekday"),
name.pol = pollutant, type = "default", group = NULL,
difference = FALSE, statistic = "mean", conf.int = 0.95, B = 100,
ci = TRUE, cols = "hue", ref.y = NULL, key = NULL, key.columns = 1,
start.day = 1, auto.text = TRUE, alpha = 0.4, ...)


timeVariation(mydata, pollutant = "nox", local.tz = NULL,
normalise = FALSE, xlab = c("hour", "hour", "month", "weekday"),
name.pol = pollutant, type = "default", group = NULL,
difference = FALSE, statistic = "mean", conf.int = 0.95, B = 100,
ci = TRUE, cols = "hue", ref.y = NULL, key = NULL, key.columns = 1,
start.day = 1, auto.text = TRUE, alpha = 0.4, ...)



# basic use
timeVariation(mydata, pollutant = "nox")
# for a subset of conditions
## Not run:
timeVariation(subset(mydata, ws > 3 & wd > 100 & wd < 270),
pollutant = "pm10", ylab = "pm10 (ug/m3)")
## End(Not run)
# multiple pollutants with concentrations normalised
## Not run: timeVariation(mydata, pollutant = c("nox", "co"), normalise = TRUE)
# show BST/GMT variation (see ?cutData for more details)
timeVariation 151
# the NOx plot shows the profiles are very similar when expressed in
# local time, showing that the profile is dominated by a local source
# that varies by local time and not by GMT i.e. road vehicle emissions
## Not run: timeVariation(mydata, pollutant = "nox", type = "dst", local.tz = "Europe/London")
## In this case it is better to group the results for clarity:
## Not run: timeVariation(mydata, pollutant = "nox", group = "dst", local.tz = "Europe/London")
# By contrast, a variable such as wind speed shows a clear shift when
# expressed in local time. These two plots can help show whether the
# variation is dominated by man-made influences or natural processes
## Not run: timeVariation(mydata, pollutant = "ws", group = "dst", local.tz = "Europe/London")
## It is also possible to plot several variables and set type. For
## example, consider the NOx and NO2 split by levels of O3:
## Not run: timeVariation(mydata, pollutant = c("nox", "no2"), type = "o3", normalise = TRUE)
## difference in concentrations
## Not run: timeVariation(mydata, poll= c("pm25", "pm10"), difference = TRUE)
# It is also useful to consider how concentrations vary by
# considering two different periods e.g. in intervention
# analysis. In the following plot NO2 has clearly increased but much
# less so at weekends - perhaps suggesting vehicles other than cars
# are important because flows of cars are approximately invariant by
# day of the week
## Not run:
mydata <- splitByDate(mydata, dates= "1/1/2003", labels = c("before Jan. 2003", "After Jan. 2003"))
timeVariation(mydata, pollutant = "no2", group = "split.by", difference = TRUE)
## End(Not run)
## sub plots can be extracted from the openair object
## Not run:
myplot <- timeVariation(mydata, pollutant = "no2")
plot(myplot, subset = "day.hour") # top weekday and plot
## End(Not run)
## individual plots
## plot(myplot, subset="day.hour") for the weekday and hours subplot (top)
## plot(myplot, subset="hour") for the diurnal plot
## plot(myplot, subset="day") for the weekday plot
## plot(myplot, subset="month") for the monthly plot
## numerical results (mean, lower/upper uncertainties)
## results(myplot, subset = "day.hour") # the weekday and hour data set
## summary(myplot, subset = "hour") #summary of hour data set
## head(myplot, subset = "day") #head/top of day data set
## tail(myplot, subset = "month") #tail/top of month data set
## plot quantiles and median
## Not run:
timeVariation(mydata, stati="median", poll="pm10", col = "firebrick")
## with different intervals
timeVariation(mydata, stati="median", poll="pm10", conf.int = c(0.75, 0.99),
col = "firebrick")
## End(Not run)




trajCluster Calculate clusters for back tracectories
Description
This function carries out cluster analysis of HYSPLIT back trajectories. The function is specifically
designed to work with the trajectories imported using the openair importTraj function, which
provides pre-calculated back trajectories at specific receptor locations.
Usage
trajCluster(traj, method = "Euclid", n.cluster = 5, plot = TRUE,
type = "default", cols = "Set1", split.after = FALSE, map.fill = TRUE,
map.cols = "grey40", map.alpha = 0.4, projection = "lambert",
parameters = c(51, 51), orientation = c(90, 0, 0), by.type = FALSE,
origin = TRUE, ...)


## Not run:
## import trajectories
traj <- importTraj(site = "london", year = 2009)
## calculate clusters
clust <- trajCluster(traj, n.clusters = 5)
head(clust$data) ## note new variable 'cluster'
## use different distance matrix calculation, and calculate by season
traj <- trajCluster(traj, method = "Angle", type = "season", n.clusters = 4)
## End(Not run)







