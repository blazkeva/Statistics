data{
    
    int<lower = 1> ResponsesCount;
    int<lower = 1> SubjectsCount;
    int<lower = 1> SubjectIndex[ResponsesCount];
    real x[ResponsesCount];
    real y[ResponsesCount];
}

parameters{
    real a[SubjectsCount];
    real aMu;
    real<lower = 0,upper = 100> aShape;
    real<lower = 0,upper = 100> aRate;
    real<lower = 0> aSigma;
    real b[SubjectsCount];
    real bMu;
    real<lower = 0,upper = 100> bShape;
    real<lower = 0,upper = 100> bRate;
    real<lower = 0> bSigma;
    real<lower = 0,upper = 100> shape;
    real<lower = 0,upper = 100> rate;
    real<lower = 0> sigma;
    real nu;
}

model {
  aMu ~ normal(0, 10000);
//  aShape ~ uniform (0, 100);
//  aRate ~ uniform (0,100);
  aSigma ~ gamma(aShape, aRate);
  for (j in 1:SubjectsCount) {
    a[j] ~ normal(aMu, aSigma);
  }
  
  bMu ~ normal(0, 10000);
//  bShape ~ uniform (0, 100);
//  bRate ~ uniform (0,100);
  bSigma ~ gamma(bShape, bRate);
  for (j in 1:SubjectsCount) {
    b[j] ~ normal(bMu, bSigma);
  }

//  shape ~ uniform (0, 100);
//  rate ~ uniform (0,100);
  sigma ~ gamma(shape, rate);
  nu ~ exponential(0.0333);
  
  for (i in 1:ResponsesCount) {
    y[i] ~ student_t(nu, a[SubjectIndex[i]] + b[SubjectIndex[i]] * x[i], sigma);
  }
}
