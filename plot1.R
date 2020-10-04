
conn <- file("household_power_consumption.txt")
dataset <- read.csv(conn, sep=";", header=TRUE, stringsAsFactors=FALSE)
dataset$Date <- strptime(as.character(dataset$Date),"%d/%m/%Y")
dataset$Date <- format(dataset$Date,"%Y-%m-%d")
myfunc <- function(x,y){dataset[dataset$Date >= x & dataset$Date <= y,]}
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
Test_data <- myfunc(DATE1,DATE2)  

Test_data$DateTime <-format(seq.Date(as.Date("2007-02-01"), by = 'day', len = 3), "%a")
png("plot1.png", width = 480, height = 480)
# 2. Create the plot
hist(as.numeric(Test_data$Global_active_power),xlab="Global Active Power (KiloWatts)", ylab="Frequency", col="red",main = 'Global Active Power')
dev.off()