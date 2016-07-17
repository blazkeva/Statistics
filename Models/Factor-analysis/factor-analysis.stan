data{
	int personCount;
	int indicatorCount;
	int factorCount;
	matrix[personCount, indicatorCount] response;
}

parameters {
	vector[indicatorCount] intercept;
  matrix<lower = 0>[indicatorCount, factorCount] factorLoading;
  matrix[personCount, factorCount] factorScore;
  vector<lower = 0>[indicatorCount] errorVariance;
}

transformed parameters {
  matrix[personCount, indicatorCount] responseMean;
  
  for (personIndex in 1:personCount) {
    for (indicatorIndex in 1:indicatorCount) {
      responseMean[personIndex, indicatorIndex] <- intercept[indicatorIndex];
      
      for (factorIndex in 1:factorCount) {
        responseMean[personIndex, indicatorIndex] <- responseMean[personIndex, indicatorIndex] + factorLoading[indicatorIndex, factorIndex] * factorScore[personIndex, factorIndex];
      }
    }
  }
}

model {
  vector[factorCount] factorsMean;
  matrix[factorCount, factorCount] factorsVariance;
  
  
  for (i in 1:factorCount) {
    factorsMean[i] <- 0;
    
    for (j in 1:factorCount) {
      if (i == j) {
        factorsVariance[i, j] <- 1;
      } else {
        factorsVariance[i, j] <- 0;
      }
    }
  }
  
	// priors on loadings
	for(i in 1:indicatorCount) {
	  for (j in 1:factorCount) {
		  factorLoading[i, j] ~ cauchy(0, 1);
		}
	}

	// priors on intercepts
	intercept ~ cauchy(0, 1);
	
	// prior on errors
	errorVariance ~ cauchy(0, 5);
		
	for (personIndex in 1:personCount) {
    factorScore[personIndex] ~ multi_normal(factorsMean, factorsVariance);
		
		for (indicatorIndex in 1:indicatorCount) {
		 response[personIndex, indicatorIndex] ~ normal(responseMean[personIndex, indicatorIndex], errorVariance[indicatorIndex]);
    }
	}
}

generated quantities {
  /*matrix[personCount, indicatorCount] predictedResponse;
  
  for(personIndex in 1:personCount) {
		for (indicatorIndex in 1:indicatorCount) {
      predictedResponse[personIndex, indicatorIndex] <- normal_rng(responseMean[personIndex, indicatorIndex], errorVariance[indicatorIndex]);
    }
	}*/
}
