% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calibrate.bergm.R
\name{calibrate.bergm}
\alias{calibrate.bergm}
\title{Calibrating misspecified ERGMs for Bayesian parameter inference}
\usage{
calibrate.bergm(ergm.formula, iters = 500, a = 0.001, alpha = 0,
  aux.iters = 5000, noisy.nsim = 400, noisy.thin = 50,
  prior.mean = NULL, prior.sigma = NULL, thin = 1, mcmc = 40000,
  burnin = 10000, tunePL = 1)
}
\arguments{
\item{ergm.formula}{formula; an \code{R} formula object,
of the form  <network> ~ <model terms>
where <network> is a \code{\link{network}} object
and <model terms> are \code{\link{ergm-terms}}.}

\item{iters}{count; Iterations for the Robbins-Monro stochastic approximation algorithm.}

\item{a}{scalar; Constant for sequence alpha_n (Robbins-Monro).}

\item{alpha}{scalar; Noise added to gradient (Robbins-Monro).}

\item{aux.iters}{count; Number of proposals before any MCMC sampling is done (Robbins-Monro). See \code{\link[ergm]{control.simulate.formula}}.}

\item{noisy.nsim}{count; Number of TNT draws (Robbins-Monro). See \code{\link[ergm]{control.simulate.formula}}.}

\item{noisy.thin}{count; Number of proposals between sampled statistics (Robbins-Monro). See \code{\link[ergm]{control.simulate.formula}}.}

\item{prior.mean}{vector; Prior means.}

\item{prior.sigma}{matrix; Prior covariance matrix.}

\item{thin}{count; Thinning interval used in the simulation for the pseudo-posterior estimation. The number of MCMC iterations must be divisible by this value.}

\item{mcmc}{count; Number of MCMC iterations after burn-in for the pseudo-posterior estimation.}

\item{burnin}{count; Number of burn-in iterations at the beginning of an MCMC run for the pseudo-posterior estimation.}

\item{tunePL}{count; Tuning parameter for the Metropolis sampling for the pseudo-posterior estimation.}
}
\description{
Function to transform a sample from the pseudo-posterior 
to one that is approximately sampled from the intractable 
posterior distribution.
}
\examples{
\dontrun{
# Load the florentine marriage network
data(florentine)
                                 
# Calibrated pseudo-posterior:

cpp.flo <- calibrate.bergm(flomarriage ~ edges + kstar(2),
                           aux.iters = 3000,
                           mcmc = 10000,  
                           burnin = 500,
                           tunePL = 2)
                                                   
# MCMC diagnostics and posterior summaries:

bergm.output(cpp.flo)

# Bayesian goodness-of-fit test:

bgof(cpp.flo,
     aux.iters = 500,
     sample.size = 50,
     n.deg = 10,
     n.dist = 9,
     n.esp = 6)
}

}
\references{
Bouranis, L., Friel, N., and Maire, F. (2015). Bayesian inference for misspecified exponential
random graph models. \url{https://arxiv.org/abs/1510.00934}
}
