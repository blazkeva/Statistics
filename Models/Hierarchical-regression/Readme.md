HIERARCHICAL REGRESSION
===

## Models

 - [hierarchical-regression.R](./hierarchical-regression.R)
 - [hierarchical-regression.stan](./hierarchical-regression.stan)


### Data

- Náhodně vygenerovaná data
- Počet lidí: 200
- Počet pokusů: 10
- Směrodatná odchylka prediktorů: 100
- Průměr: 50
- Průměr interceptu: 20
- Směrodatná odchylka: 10
- Průměr koeficientu: 5
- Směrodatná odchylka: 5
- Směrodatná odchylka náhodné chyby: 10
- Intercepty a i b jsou náhodné proměnné

### Model

Parametery:
 - subject-specific intercept (a)
 - predictor (x)
 - subject specific coefficient (b)

```
y ~ student_t(nu, a + b * x, sigma)
```

Priory:
- aMu ~ normal(0, 10000);
- aSigma ~ gamma(aShape, aRate);
- a ~ normal(aMu, aSigma);
- bMu ~ normal(0, 10000);
- bSigma ~ gamma(bShape, bRate);
- b ~ normal(bMu, bSigma);
- shape ~ uniform (0, 100);
- rate ~ uniform (0,100);
- sigma ~ gamma(shape, rate);
- nu ~ exponential(0.0333);

MCMC nastavení:
 - Chains: 4
 - Burnin: 500
 - Iterations total: 2500
 - Thinning: 1

MCMC diagnostika:
 - [plot_reg__autocorrelation-crosscorrelation.pdf](../../Outputs/Hierarchical-regression/plot_reg__autocorrelation-crosscorrelation.pdf)
 - [plot_reg__density-caterpillar.pdf](../../Outputs/Hierarchical-regression/plot_reg__density-caterpillar.pdf)
 - [bplot_reg__rhat-geweke.pdf](../../Outputs/Hierarchical-regression/plot_reg__rhat-geweke.pdf)
 - [plot_reg__traceplot-running-compare-partial.pdf](../../Outputs/Hierarchical-regression/plot_reg__traceplot-running-compare-partial.pdf)
 -
### Výsledky

Hodnoty parametrů:

|` parameter                    `|` mean   `|` 95 % hdi        `|
|--------------------------------|---------:|------------------:|
|` aMu                          `|` 19.96  `|` 18.43 -  21.49  `|
|` aShape                       `|` 67.45  `|` 17.45 -  98.79  `|
|` aRate                        `|`  6.69  `|`  1.68 -  10.79  `|
|` aSigma                       `|` 10.27  `|`  9.18 -  11.47  `|
|` bMu                          `|`  4.51  `|`  3.89 -   5.13  `|
|` bShape                       `|` 66.60  `|` 15.59 -  98.72  `|
|` bRate                        `|` 14.93  `|`  3.48 -  24.28  `|
|` bSigma                       `|`  4.54  `|`  4.13 -   5.00  `|
|` shape                        `|` 66.75  `|` 14.07 -  98.72  `|
|` rate                         `|`  7.10  `|`  1.54 -  11.41  `|
|` sigma                        `|`  9.55  `|`  9.06 -   9.98  `|
|` nu                           `|` 39.99  `|` 13.82 - 108.41  `|
