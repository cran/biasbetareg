\name{bias}
\alias{bias}
\title{Bias correction of the parameter estimates of the beta regression model}
\description{Bias correction of second order of the maximum likelihood estimators of the parameters of the beta regression model.}
\usage{
bias(fit)
}
\arguments{
  \item{fit}{Fit beta regression models for rates and proportions via maximum likelihood using a parametrization with mean (depending through a link function on the covariates) and precision parameter (called phi).}
}
\details{
The parameters of the beta regression model are estimated by the maximum likelihood method (see Ferrari and Cribari-Neto, 2004). These estimators are generally biased in models that use link function. This bias is not a serious problem when the sample size is large, however, when the sample is small, this bias can be large compared with the standard-error estimator.

Simas et al (2010) defines formulas general for second-order biases of the beta regression model with constant or variable-precision accuracy.
}
\value{
bias() returns a matrix with corrected coefficients. 
}
\references{
	Ferrari, S.L.P., and Cribari-Neto, F. (2004). Beta Regression for Modeling Rates and Proportions.
	Journal of Applied Statistics, 31(7), 799-815.

	Simas, A.B., Barreto-Souza, W., and Rocha, A.V. (2010). Improved Estimators for a General Class
	of Beta Regression Models. Computational Statistics and Data Analysis, 54(2), 348-366.
}

\seealso{
betareg
}
\examples{
require(betareg)
## Section 4 from Ferrari and Cribari-Neto (2004)
	data("GasolineYield", package = "betareg")
	bbt <- betareg(yield ~ batch + temp, data = GasolineYield)
	bias(bbt)

	## Section 3 from online supplements to Simas et al. (2010)
	## mean model as in gy above
	## precision model with regressor temp
	bbt2 <- betareg(yield ~ batch + temp | temp, data = GasolineYield)
	bias(bbt2)
}
