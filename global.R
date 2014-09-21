library(WDI)
library(dplyr)

indnams <- c("fertility.rate", "life.expectancy", 
             "population", "GDP.per.capita.Current.USD", 
             "15.to.25.yr.female.literacy")
inds <- c('SP.DYN.TFRT.IN','SP.DYN.LE00.IN', 
          'SP.POP.TOTL','NY.GDP.PCAP.CD', 
          'SE.ADT.1524.LT.FE.ZS')
wdiData <- WDI(country="all", indicator=inds,
               start=1960, end=format(Sys.Date(), "%Y"), 
               extra=TRUE)
colnum <- match(inds, names(wdiData))

names(wdiData)[colnum] <- indnams

WorldBank <- droplevels(subset(wdiData, 
                               !region %in% "Aggregates"))


ye <- data.frame(table(WorldBank$year))
y <- as.vector(ye$Var1)

reg <- data.frame(table(WorldBank$region))
r <- as.vector(reg$Var1)




