conn <- file("household_power_consumption.txt")
dataset <- read.csv(conn, sep=";", header=TRUE, stringsAsFactors=FALSE)
dataset$Date <- strptime(as.character(dataset$Date),"%d/%m/%Y")
dataset$Date <- format(dataset$Date,"%Y-%m-%d")
myfunc <- function(x,y){dataset[dataset$Date >= x & dataset$Date <= y,]}
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
Test_data <- myfunc(DATE1,DATE2)  

Test_data$DateTime <-format(seq.Date(as.Date("2007-02-01"), by = 'day', len = 3), "%a")
Test_data$WeekDay <- as.POSIXct(paste(Test_data$Date, Test_data$Time), format="%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(Test_data$WeekDay, Test_data$Global_active_power, type ="l", xlab ="Datetime", ylab ="Global Active Power (KiloWatts)")
dev.off()