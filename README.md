# mica

**Matrix Imputation with Correlation-Aware Diagnostics**

<!-- badges: start -->
<!-- badges: end -->

`mica` is an R package for completing partial meta-analytic correlation
matrices. It provides:

- A fast **deterministic** positive-definite fill (`engine = "deterministic"`, default)
- A **Bayesian Stan** engine (`engine = "stan"`) with posterior uncertainty intervals
- Per-cell diagnostics and triage labels for every missing cell

## Installation

Install the development version from GitHub:

```r
if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
remotes::install_github("anonymous-mica/mica-r")
```

> **Note:** The Stan engine compiles a C++ model on first install — this takes
> a few minutes. Subsequent loads are instant.

## Quick start

```r
library(mica)

toy <- matrix(c(
  1.00, 0.32,   NA, 0.21,
  0.32, 1.00, 0.28,   NA,
    NA, 0.28, 1.00, 0.41,
  0.21,   NA, 0.41, 1.00
), nrow = 4, byrow = TRUE)

# Deterministic fill (fast)
fit <- mica(toy)
fit
summary(fit)
as.matrix(fit)

# Bayesian fill (uncertainty quantification)
fit_bayes <- mica(toy, engine = "stan", chains = 2, iter = 500,
                  warmup = 250, refresh = 0)
fit_bayes$posterior_cells   # mean, sd, 2.5%, 97.5% per missing cell
```
