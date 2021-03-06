% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DCML.R
\name{scaleM}
\alias{scaleM}
\alias{mscale}
\title{M-scale estimator}
\usage{
scaleM(u, delta = 0.5, tuning.chi = 1.547645, family = "bisquare",
  max.it = 100, tol = 1e-06)
}
\arguments{
\item{u}{vector of residuals}

\item{delta}{the right hand side of the M-scale equation}

\item{tuning.chi}{the tuning object for the rho function as returned
by \code{\link{lmrobdet.control}}, \link{bisquare}, \link{modified.optimal} or \link{optimal}. 
It should correspond to the family of rho functions specified in the argument \code{family}.}

\item{family}{string specifying the name of the family of loss function to be used (current valid
options are "bisquare", "optimal" and "modified.optimal").}

\item{max.it}{maximum number of iterations allowed}

\item{tol}{relative tolerance for convergence}
}
\value{
The scale estimate value at the last iteration or at convergence.
}
\description{
This function computes an M-scale, which is a robust
scale (spread) estimator.
M-estimators of scale are a robust alternative to
the sample standard deviation. Given a vector of
residuals \code{r}, the M-scale estimator \code{s}
solves the non-linear equation \code{mean(rho(r/s, cc))=b},
where \code{b} and \code{cc} are user-chosen tuning constants.
In this package the function \code{rho} is one of
Tukey's bisquare family.
The breakdown point of the estimator is \code{min(b, 1-b)},
so the optimal choice for \code{b} is 0.5. To obtain a
consistent estimator the constant
\code{cc} should be chosen such that E(rho(Z, cc)) = b, where
Z is a standard normal random variable.
}
\details{
The iterative algorithm starts from the scaled median of
the absolute values of the input vector, and then
cycles through the equation s^2 = s^2 * mean(rho(r/s, cc)) / b.
In this package the function \code{rho} is one of
Tukey's bisquare family.
}
\examples{
set.seed(123)
# 10\% of outliers, sd of good points is 1.5
r <- c(rnorm(45, sd=1.5), rnorm(5, mean=-5, sd=.5))
mscale(u=r, tol=1e-7, delta=.5, max.it=100, tuning.chi=1.5477)
sd(r)

}
\author{
Matias Salibian-Barrera, \email{matias@stat.ubc.ca}
}
