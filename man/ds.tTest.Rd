\name{ds.tTest}
\alias{ds.tTest}
\title{Runs a student's t-test}
\usage{
ds.tTest(x = NULL, y = NULL, type = "combine",
  alternative = "two.sided", mu = 0, paired = FALSE, var.equal = FALSE,
  conf.level = 0.95, datasources = NULL)
}
\arguments{
  \item{x}{a character, the name of a (non-empty) numeric
  vector of data values or a formula of the form 'a~b'
  where 'a' is the name of a continuous variable and 'b'
  that of a factor variable.}

  \item{y}{a character, the name of an optional (non-empty)
  numeric vector of data values.}

  \item{type}{a character which tells if the test is ran
  for the pooled data or not. By default \code{type} is set
  to 'combine' and a t.test of the pooled data is carried
  out. If \code{type} is set to 'split', a t.test is ran
  for each study separately.}

  \item{alternative}{a character specifying the alternative
  hypothesis, must be one of "two.sided" (default),
  "greater" or "less". You can specify just the initial
  letter.}

  \item{mu}{a number indicating the true value of the mean
  (or difference in means if you are performing a two
  sample test).}

  \item{paired}{a logical indicating whether you want a
  paired t-test.}

  \item{var.equal}{a logical variable indicating whether to
  treat the two variances as being equal. If TRUE then the
  pooled variance is used to estimate the variance
  otherwise the Welch. (or Satterthwaite) approximation to
  the degrees of freedom is used.}

  \item{conf.level}{confidence level of the interval.}

  \item{datasources}{a list of opal object(s) obtained
  after login in to opal servers; these objects hold also
  the data assign to R, as \code{dataframe}, from opal
  datasources.}
}
\value{
a list containing the following elements: \code{statistic}
the value of the t-statistic. \code{parameter} the degrees
of freedom for the t-statistic. \code{p.value} p.value the
p-value for the test. \code{conf.int} a confidence interval
for the mean appropriate to the specified alternative
hypothesis. \code{estimate} the estimated mean or
difference in means depending on whether it was a
one-sample test or a two-sample test. \code{null.value} the
specified hypothesized value of the mean or mean difference
depending on whether it was a one-sample test or a
two-sample test. \code{alternative} a character string
describing the alternative hypothesis \code{method} a
character string indicating what type of t-test was
performed

an object of type 'htest' if both x and y are continuous
and a list otherwise.
}
\description{
Performs one and two sample t-tests on vectors of data.
}
\details{


Summary statistics are obtained from each of the data sets
that are located on the distinct computers/servers. And
then grand means and variances are calculated. Those are
used for performing t-test. The funtion allows for the
calculation of t-test between two continuous variables or
between a continuous and a factor variable; the latter
option requires a formula (see parameter \code{dataframe}).
If a formula is provided all other but 'conf.level=0.95'
are ignored.
}
\examples{
{

  # load that contains the login details
  data(logindata)

  # login and assign all the variables
  opals <- datashield.login(logins=logindata,assign=TRUE)

  # Example 1: Run a t.test of the pooled data for the variables 'LAB_HDL' and 'LAB_TSC' - default
  ds.tTest(x='D$LAB_HDL', y='D$LAB_TSC')

  # Example 2: Run a test to compare the mean of a continuous variable across the two categories of a categorical variable
  s <- ds.tTest(x='D$PM_BMI_CONTINUOUS~D$GENDER')

  # Example 3: Run a t.test for each study separately for the same variables as above
  ds.tTest(x='D$LAB_HDL', y='D$LAB_TSC', type='split')

  # Example 4: Run a paired t.test of the pooled data
  ds.tTest(x='D$LAB_HDL', y='D$LAB_TSC', paired=TRUE)

  # Example 5: Run a paired t.test for each study separately
  ds.tTest(x='D$LAB_HDL', y='D$LAB_TSC', paired=TRUE, type='split')

  # Example 6: Run a t.test of the pooled data with different alternatives
  ds.tTest(x='D$LAB_HDL', y='D$LAB_TSC', alternative='greater')
  ds.tTest(x='D$LAB_HDL', y='D$LAB_TSC', alternative='less')

  # Example 7: Run a t.test of the pooled data with mu different from zero
  ds.tTest(x='D$LAB_HDL', y='D$LAB_TSC', mu=-4)

  # Example 8: Run a t.test of the pooled data assuming that variances of variables are equal
  ds.tTest(x='D$LAB_HDL', y='D$LAB_TSC', var.equal=TRUE)

  # Example 9: Run a t.test of the pooled data with 90\% confidence interval
  ds.tTest(x='D$LAB_HDL', y='D$LAB_TSC', conf.level=0.90)

  # Example 10: Run a one-sample t.test of the pooled data
  ds.tTest(x='D$LAB_HDL')
  # the below example should not work, paired t.test is not possible if the 'y' variable is missing
  # ds.tTest(x='D$LAB_HDL', paired=TRUE)

  # clear the Datashield R sessions and logout
  datashield.logout(opals)

}
}
\author{
Isaeva, J.; Gaye, A.
}

