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
png(filename='plot3.png',width=480,height=480,units='px')
plot(
    data$dt,
    data$Sub_metering_1,
    type="l",
    xlab="",
    ylab="Energy sub metering"
)

lines(
    data$dt,
    data$Sub_metering_2,
    col="red"
)

lines(
    data$dt,
    data$Sub_metering_3,
    col="blue"
)

legend(
    'topright',
    lty='solid',
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col=c("black", "red", "blue")
)

dev.off()
