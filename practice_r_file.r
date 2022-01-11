set.seed(2022)
x1 <- rnorm(1000)
y1 <- x1 + rnorm(1000)

jpeg(file="saving_plot1.jpeg")
plot(x1, y1)
dev.off()
