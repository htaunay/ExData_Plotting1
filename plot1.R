setwd("~/rwd/")

# load data
data <- read.csv(
    file="household_power_consumption.txt",
    header=TRUE,
    na.strings="?",
    sep=";"
)

# filter by relevant dates
data <- subset(data, Date %in% c('1/2/2007','2/2/2007'))

# draw plot
png(filename='plot1.png',width=480,height=480,units='px')
hist(
     data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
)
dev.off()
