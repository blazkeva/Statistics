require(rjags)
require(rstan)
require(coda)
require(ggmcmc)

fitModel = function (model, data, burnin = 200, samples = 1000, thinning = 1, chains = 4) {
  warmup <- burnin * thinning
  iterations <- warmup + samples * thinning
  
  fit <- stan(file = model,
              data = data,
              warmup = warmup,
              iter = iterations,
              chains = chains,
              thin = thinning,
              open_progress = TRUE)
  
  return (fit);
}

data = read.table("Data/hierarchical-regression.csv", header = TRUE, sep = ";", quote = "\"", dec = ".")

dataStd = data

dataStd$X = (dataStd$X - mean(dataStd$X)) / sd(dataStd$X)
dataStd$Y = (dataStd$Y - mean(dataStd$Y)) / sd(dataStd$Y)

# model <- jags.model ("HierReg/Ymet-XmetSubj-MrobustHier.jags",
#                      data = list("x"=dataStd$X,
#                                  "y"=dataStd$Y, "ResponsesCount"= length(dataStd$Y),
#                                  "SubjectsCount" = max(dataStd$Subj),
#                                  "SubjectIndex" = dataStd$Subj),
#                      
#                      n.chains = 4,
#                      n.adapt = 1000)

# model <- jags.model ("HierReg/Ymet-XmetSubj-MrobustHier.jags",
#                      data = list("x"=data$X,
#                                  "y"=data$Y,
#                                  "Nsubj" = max(data$Subj),
#                                  "s" = data$Subj),
#                      
#                      n.chains = 4,
#                      n.adapt = 1000)
# 
# update(model, 1000)
# 
# samples <- coda.samples(model,
# #                        variable.names=c("a", "b", "sigma", "aMu", "bMu", "aSigma", "bSigma", "nu"),
#                     variable.names=c( "beta0" ,  "beta1" , "beta0mu" , "beta1mu" ,
#                   "zbeta0" , "zbeta1" ,  "zbeta0mu" , "zbeta1mu" ,
#                   "zsigma", "sigma", "nu" , "zbeta0sigma" , "zbeta1sigma" ),                       
# n.iter = 4000, thin = 2)


modelFit <- fitModel('HierReg/Ymet-XmetSubj-MrobustHier.stan',
                     data = list("x"=data$x,
                                 "y"=data$y, "ResponsesCount"= length(data$y),
                                 "SubjectsCount" = max(data$subject),
                                 "SubjectIndex" = data$subject),
                     burnin = 500,
                     samples = 2500,
                     thinning = 1, chains = 4)

# for ( j in 1:Nsubj ) {
#   beta1[j] <- zbeta1[j] * ysd / xsd  
#   beta0[j] <- zbeta0[j] * ysd  + ym - zbeta1[j] * xm * ysd / xsd 
# }
# beta1mu <- zbeta1mu * ysd / xsd  
# beta0mu <- zbeta0mu * ysd  + ym - zbeta1mu * xm * ysd / xsd 
# sigma <- zsigma * ysd
# }
# 
# summary (samples)
# ggmcmc(ggs(samples))

generateDiagnosticPlots(modelFit, dir="Output", parameters="")

generateDiagnosticPlots = function (fit, dir = "", parameters = NA) {
  require("ggmcmc")
  
  plot <- ggs(fit, family = parameters)
  
  ggmcmc(plot, file = paste(dir, "/plot_", modelFit@model_name, "_", parameters, "_density-caterpillar.pdf", 
                            sep = ""), plot = "density caterpillar")
  ggmcmc(plot, file = paste(dir, "/plot_", modelFit@model_name, "_", parameters, "_traceplot-running-compare-partial.pdf", 
                            sep = ""), plot = "traceplot running compare_partial")
  ggmcmc(plot, file = paste(dir, "/plot_", modelFit@model_name, "_", parameters, "_autocorrelation-crosscorrelation.pdf", 
                            sep = ""), plot = "autocorrelation crosscorrelation")
  ggmcmc(plot, file = paste(dir, "/plot_", modelFit@model_name, "_", parameters, "_rhat-geweke.pdf", 
                            sep = ""), plot = "Rhat geweke")
}

extractSamples <- function (fit, parameters = NULL) {
  samples <- list()
  
  if (!is.vector(parameters)) {
    parameters <- fit@model_pars;
  }
  
  for (i in 1:(length(parameters))) {
    parameter <- rstan::extract(fit, parameters[i])[[1]]
    
    if (length(dim(parameter)) > 1) {
      # parameter <- aperm(parameter, c(length(dim(parameter)), 1:(length(dim(parameter)) - 1)))
      parameter <- aperm(parameter, c(2:length(dim(parameter)), 1))
      
    }
    
    samples[[fit@model_pars[i]]] <- parameter;
  }
  
  return (samples)
}

summarizeSamples = function (samples, rope = NULL , credibleMass = 0.95) {
  samplesMean = mean(samples)
  samplesMedian = median(samples)
  samplesDensity = density(samples)
  samplesMode = samplesDensity$x[which.max(samplesDensity$y)]
  # mcmcEffSz = round( effectiveSize( samples ) , 1 )
  # names(mcmcEffSz) = NULL
  
  hdiLim = hdi(samples, credibleMass = credibleMass)
  #   hdiLim = c(0, 0)
  #   hdiLim[[1]] = quantile(samples, 0.025)
  #   hdiLim[[2]] = quantile(samples, 0.975)
  
  # if (!is.null(compVal)) {
  #   pcgtCompVal = 100 * sum(samples > compVal) / length(samples)
  # } else {
  #   compVal = NA
  #   pcgtCompVal = NA
  # }
  
  if (!is.null(rope)) {
    pcltRope = 100 * sum(samples < rope[1]) / length(samples)
    pcgtRope = 100 * sum(samples > rope[2]) / length(samples)
    pcinRope = 100 - (pcltRope + pcgtRope)
  } else { 
    rope = c(NA, NA)
    pcltRope = NA 
    pcgtRope = NA 
    pcinRope = NA 
  }
  
  return (c(mean = samplesMean,
            median = samplesMedian,
            mode = samplesMode, 
            #ESS=mcmcEffSz ,
            hdiMass = credibleMass,
            hdiLower=hdiLim[1],
            hdiUpper=hdiLim[2], 
            #CompVal=compVal , PcntGtCompVal=pcgtCompVal , 
            ropeLower = rope[1],
            ropeUpper = rope[2],
            belowROPE = pcltRope,
            inROPE = pcinRope,
            aboveROPE = pcgtRope))
}

hdi <- function(samples , credibleMass = 0.95) {
  # Computes highest density interval from a sample of representative values,
  #   estimated as shortest credible interval.
  # Arguments:
  #   sampleVec
  #     is a vector of representative values from a probability distribution.
  #   credMass
  #     is a scalar between 0 and 1, indicating the mass within the credible
  #     interval that is to be estimated.
  # Value:
  #   HDIlim is a vector containing the limits of the HDI
  
  sortedPts = sort(samples)
  ciIdxInc = ceiling(credibleMass * length(sortedPts))
  nCIs = length(sortedPts) - ciIdxInc
  ciWidth = rep(0 , nCIs)
  
  for (i in 1:nCIs) {
    ciWidth[i] = sortedPts[i + ciIdxInc] - sortedPts[i]
  }
  
  HDImin = sortedPts[which.min(ciWidth)]
  HDImax = sortedPts[which.min(ciWidth) + ciIdxInc]
  # HDIlim = c(HDImin, HDImax)
  
  return (c(HDImin, HDImax))
}

samples <- extractSamples(modelFit)
