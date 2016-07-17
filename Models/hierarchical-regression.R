require(rjags)
require(rstan)
require(coda)
require(ggmcmc)

source("Functions.R")

data = read.table("Data/hierarchical-regression.csv", header = TRUE, sep = ";", quote = "\"", dec = ".")


modelFit <- fitModel('HierReg/reg.stan',
                     data = list("x"=data$x,
                                 "y"=data$y, "ResponsesCount"= length(data$y),
                                 "SubjectsCount" = max(data$subject),
                                 "SubjectIndex" = data$subject),
                     burnin = 500,
                     samples = 2500,
                     thinning = 1, chains = 4)


con <- file("output/reg.log")
sink(con, append=TRUE)
sink(con, append=TRUE, type="message")

modelFit

# Restore output to console
sink()
sink(type="message")

# And look at the log...
cat(readLines("test.log"), sep="\n")


generateDiagnosticPlots(modelFit, dir="Output", parameters="")
