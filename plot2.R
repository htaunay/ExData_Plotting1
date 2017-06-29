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

# add datetime column
data$dt <- with(data, as.POSIXct(paste(as.Date(Date, format="%d/%m/%Y"), Time)))

# draw plot
png(filename='plot2.png',width=480,height=480,units='px')
plot(
    data$dt,
    data$Global_active_power,
    type="l",
    xlab="",
    ylab="Global Active Power (kilowatts)"
)
dev.off()
