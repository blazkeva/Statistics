FAKTOROVÁ ANALÝZA
==

## FA

 - [factor-analysis.R](./factor-analysis.R)
 - [factor-analysis.stan](./factor-analysis.stan)


### Data

- Náhodně generovaná data podle níže uvedeného modelu
- Počet faktorů: 2
- Intercepty: 20x0
- Factor Loadings jsou k nalezení v závěrečné srovnávací tabulce

Factor Score
~ N(0, 1)

Random Error
~ N(0, 1)

### Model

```
responseMean[personIndex, indicatorIndex] <- intercept[indicatorIndex] + factorLoading[indicatorIndex, 1] * factorScore[personIndex, 1] + ... + factorLoading[indicatorIndex, factorCount] * factorScore[personIndex, factorCount]
response[personIndex, indicatorIndex] ~ normal(responseMean[personIndex, indicatorIndex], errorVariance[indicatorIndex])
```

Priory:
 - factorScore ~ cauchy(0, 1)
 - factorLoading ~ cauchy(0, 1) (truncated to only allow non-negative numbers)
 - intercept ~ cauchy(0, 1)
 - errorVariance ~ cauchy(0, 5) (truncated to only allow non-negative numbers)

MCMC nastavení:
 - Chains: 1 (model is not fully identified; factors are interchangeable)
 - Burnin: 500
 - Samples: 2000
 - Thinning: 1

MCMC diagnostika:
 - [plot_efa_errorVariance_autocorrelation-crosscorrelation.pdf](../../Outputs/Factor-analysis/plot_efa_errorVariance_autocorrelation-crosscorrelation.pdf)
 - [plot_efa_errorVariance_density-caterpillar.pdf](../../Outputs/Factor-analysis/plot_efa_errorVariance_density-caterpillar.pdf)
 - [plot_efa_errorVariance_rhat-geweke.pdf](../../Outputs/Factor-analysis/plot_efa_errorVariance_rhat-geweke.pdf)
 - [plot_efa_errorVariance_traceplot-running-compare-partial.pdf](../../Outputs/Factor-analysis/plot_efa_errorVariance_traceplot-running-compare-partial.pdf)
 - [plot_efa_factorLoading_autocorrelation-crosscorrelation.pdf](../../Outputs/Factor-analysis/plot_efa_factorLoading_autocorrelation-crosscorrelation.pdf)
 - [plot_efa_factorLoading_density-caterpillar.pdf](../../Outputs/Factor-analysis/plot_efa_factorLoading_density-caterpillar.pdf)
 - [plot_efa_factorLoading_rhat-geweke.pdf](../../Outputs/Factor-analysis/plot_efa_factorLoading_rhat-geweke.pdf)
 - [plot_efa_factorLoading_traceplot-running-compare-partial.pdf](../../Outputs/Factor-analysis/plot_efa_factorLoading_traceplot-running-compare-partial.pdf)
 - [plot_efa_factorScore_autocorrelation-crosscorrelation.pdf](../../Outputs/Factor-analysis/plot_efa_factorScore_autocorrelation-crosscorrelation.pdf)
 - [plot_efa_factorScore_density-caterpillar.pdf](../../Outputs/Factor-analysis/plot_efa_factorScore_density-caterpillar.pdf)
 - [plot_efa_factorScore_rhat-geweke.pdf](../../Outputs/Factor-analysis/plot_efa_factorScore_rhat-geweke.pdf)
 - [plot_efa_factorScore_traceplot-running-compare-partial.pdf](../../Outputs/Factor-analysis/plot_efa_factorScore_traceplot-running-compare-partial.pdf)
 - [plot_efa_intercept_autocorrelation-crosscorrelation.pdf](../../Outputs/Factor-analysis/plot_efa_intercept_autocorrelation-crosscorrelation.pdf)
 - [plot_efa_intercept_density-caterpillar.pdf](../../Outputs/Factor-analysis/plot_efa_intercept_density-caterpillar.pdf)
 - [plot_efa_intercept_rhat-geweke.pdf](../../Outputs/Factor-analysis/plot_efa_intercept_rhat-geweke.pdf)
 - [plot_efa_intercept_traceplot-running-compare-partial.pdf](../../Outputs/Factor-analysis/plot_efa_intercept_traceplot-running-compare-partial.pdf)


### Výsledky

Hodnoty parametrů:

|` parameter          `|` mean (factor 1) `|` 95% hdi (factor 1)  `|` mean (factor 2) `|` 95% hdi (factor 2)  `|
|----------------------|------------------:|----------------------:|------------------:|----------------------:|
|` factorLoading[1,]  `|` 1.01            `|` 0.90 - 1.12         `|` 0.10            `|` 0.02 - 0.21         `|
|` factorLoading[2,]  `|` 0.88            `|` 0.78 - 1.00         `|` 0.18            `|` 0.07 - 0.29         `|
|` factorLoading[3,]  `|` 0.86            `|` 0.75 - 0.97         `|` 0.12            `|` 0.03 - 0.23         `|
|` factorLoading[4,]  `|` 0.90            `|` 0.79 - 1.02         `|` 0.04            `|` 0.00 - 0.12         `|
|` factorLoading[5,]  `|` 0.91            `|` 0.80 - 1.01         `|` 0.05            `|` 0.00 - 0.13         `|
|` factorLoading[6,]  `|` 0.65            `|` 0.54 - 0.76         `|` 0.35            `|` 0.25 - 0.46         `|
|` factorLoading[7,]  `|` 0.69            `|` 0.58 - 0.80         `|` 0.34            `|` 0.24 - 0.45         `|
|` factorLoading[8,]  `|` 0.64            `|` 0.53 - 0.76         `|` 0.35            `|` 0.24 - 0.46         `|
|` factorLoading[9,]  `|` 0.67            `|` 0.56 - 0.78         `|` 0.35            `|` 0.25 - 0.46         `|
|` factorLoading[10,] `|` 0.61            `|` 0.51 - 0.71         `|` 0.31            `|` 0.22 - 0.41         `|
|` factorLoading[11,] `|` 0.50            `|` 0.38 - 0.61         `|` 0.66            `|` 0.55 - 0.77         `|
|` factorLoading[12,] `|` 0.40            `|` 0.29 - 0.51         `|` 0.69            `|` 0.59 - 0.80         `|
|` factorLoading[13,] `|` 0.40            `|` 0.28 - 0.51         `|` 0.59            `|` 0.49 - 0.70         `|
|` factorLoading[14,] `|` 0.37            `|` 0.26 - 0.48         `|` 0.69            `|` 0.58 - 0.81         `|
|` factorLoading[15,] `|` 0.44            `|` 0.33 - 0.56         `|` 0.69            `|` 0.58 - 0.80         `|
|` factorLoading[16,] `|` 0.12            `|` 0.03 - 0.24         `|` 0.92            `|` 0.81 - 1.04         `|
|` factorLoading[17,] `|` 0.11            `|` 0.01 - 0.22         `|` 0.84            `|` 0.73 - 0.95         `|
|` factorLoading[18,] `|` 0.09            `|` 0.01 - 0.20         `|` 0.91            `|` 0.80 - 1.02         `|
|` factorLoading[19,] `|` 0.04            `|` 0.00 - 0.12         `|` 0.93            `|` 0.82 - 1.04         `|
|` factorLoading[20,] `|` 0.07            `|` 0.00 - 0.18         `|` 0.94            `|` 0.84 - 1.05         `|



### Srovnání s klasickou faktorovou analýzou

Rotated Factor Matrix:

|` Item `|` Factor 1 `|` Factor 2 `|
|--------|-----------:|-----------:|
|` 01   `|`  0,746   `|`  0,050   `|
|` 02   `|`  0,662   `|`  0,117   `|
|` 03   `|`  0,665   `|`  0,068   `|
|` 04   `|`  0,679   `|` -0,026   `|
|` 05   `|`  0,697   `|` -0,007   `|
|` 06   `|`  0,542   `|`  0,278   `|
|` 07   `|`  0,533   `|`  0,249   `|
|` 08   `|`  0,522   `|`  0,271   `|
|` 09   `|`  0,530   `|`  0,265   `|
|` 10   `|`  0,528   `|`  0,257   `|
|` 11   `|`  0,379   `|`  0,497   `|
|` 12   `|`  0,318   `|`  0,552   `|
|` 13   `|`  0,309   `|`  0,463   `|
|` 14   `|`  0,279   `|`  0,519   `|
|` 15   `|`  0,334   `|`  0,523   `|
|` 16   `|`  0,078   `|`  0,663   `|
|` 17   `|`  0,072   `|`  0,636   `|
|` 18   `|`  0,053   `|`  0,680   `|
|` 19   `|` -0,015   `|`  0,693   `|
|` 20   `|`  0,035   `|`  0,709   `|


Srovnání:

|` Item `|` Factor 1 `|` Factor 2 `|` Factor 1 (bayes) `|` Factor 2 (bayes) `|` Factor 1 (true) `|` Factor 2 (true) `|
|--------|-----------:|-----------:|-------------------:|-------------------:|------------------:|------------------:|
|` 01   `|`  0,746   `|`  0,050   `|`  1.01            `|` 0.10             `|` 0,9             `|` 0,1             `|
|` 02   `|`  0,662   `|`  0,117   `|`  0.88            `|` 0.18             `|` 0,9             `|` 0,1             `|
|` 03   `|`  0,665   `|`  0,068   `|`  0.86            `|` 0.12             `|` 0,9             `|` 0,1             `|
|` 04   `|`  0,679   `|` -0,026   `|`  0.90            `|` 0.04             `|` 0,9             `|` 0,1             `|
|` 05   `|`  0,697   `|` -0,007   `|`  0.91            `|` 0.05             `|` 0,9             `|` 0,1             `|
|` 06   `|`  0,542   `|`  0,278   `|`  0.65            `|` 0.35             `|` 0,7             `|` 0,4             `|
|` 07   `|`  0,533   `|`  0,249   `|`  0.69            `|` 0.34             `|` 0,7             `|` 0,4             `|
|` 08   `|`  0,522   `|`  0,271   `|` -0.64            `|` 0.35             `|` 0,7             `|` 0,4             `|
|` 09   `|`  0,530   `|`  0,265   `|`  0.67            `|` 0.35             `|` 0,7             `|` 0,4             `|
|` 10   `|`  0,528   `|`  0,257   `|`  0.61            `|` 0.31             `|` 0,7             `|` 0,4             `|
|` 11   `|`  0,379   `|`  0,497   `|`  0.50            `|` 0.66             `|` 0,4             `|` 0,7             `|
|` 12   `|`  0,318   `|`  0,552   `|`  0.40            `|` 0.69             `|` 0,4             `|` 0,7             `|
|` 13   `|`  0,309   `|`  0,463   `|`  0.40            `|` 0.59             `|` 0,4             `|` 0,7             `|
|` 14   `|`  0,279   `|`  0,519   `|`  0.37            `|` 0.69             `|` 0,4             `|` 0,7             `|
|` 15   `|`  0,334   `|`  0,523   `|`  0.44            `|` 0.69             `|` 0,4             `|` 0,7             `|
|` 16   `|`  0,078   `|`  0,663   `|`  0.12            `|` 0.92             `|` 0,1             `|` 0,9             `|
|` 17   `|`  0,072   `|`  0,636   `|`  0.11            `|` 0.84             `|` 0,1             `|` 0,9             `|
|` 18   `|`  0,053   `|`  0,680   `|`  0.09            `|` 0.91             `|` 0,1             `|` 0,9             `|
|` 19   `|` -0,015   `|`  0,693   `|`  0.04            `|` 0.93             `|` 0,1             `|` 0,9             `|
|` 20   `|`  0,035   `|`  0,709   `|`  0.07            `|` 0.94             `|` 0,1             `|` 0,9             `|
