# https://usgs-r.github.io/dataRetrieval/
# ^ Link to information

library(dataRetrieval);

vignette("dataRetrieval",package = "dataRetrieval");

siteNo <- "09171100"
pCode <- "00060"
start.date <- "2014-01-01"
end.date <- "2022-02-14"

doloresBedrock <- readNWISuv(siteNumbers = siteNo,
                             parameterCd = pCode,
                             startDate = start.date,
                             endDate = end.date)

names(doloresBedrock)

doloresBedrock <- renameNWISColumns(doloresBedrock)
names(doloresBedrock)

head(doloresBedrock)

summary(doloresBedrock)

names(attributes(doloresBedrock))

url <- attr(doloresBedrock, "url")
url

library(ggplot2)
ts <- ggplot(data = doloresBedrock,
             aes(dateTime, Flow_Inst)) +
  geom_line()
ts

parameterInfo <- attr(doloresBedrock, "variableInfo")
siteInfo <- attr(doloresBedrock, "siteInfo")

ts <- ts +
  xlab("") +
  ylab("Discharge, CFS") +
  ggtitle(siteInfo$station_nm)
ts
