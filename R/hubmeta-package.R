#' @keywords internal
"_PACKAGE"

#' mica: Matrix Imputation with Correlation-Aware Diagnostics
#'
#' Tools for completing partial meta-analytic correlation matrices.
#' Provides a deterministic positive-definite fill and a Bayesian Stan
#' engine with per-cell diagnostics, triage labels, and posterior
#' uncertainty intervals for missing cells.
#'
#' @name mica-package
#' @aliases mica-package
#' @useDynLib mica, .registration = TRUE
#' @import methods
#' @import Rcpp
#' @importFrom rstan sampling
#' @importFrom rstantools rstan_config
#' @importFrom RcppParallel RcppParallelLibs
NULL
