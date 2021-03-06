\name{logical2int}
\alias{logical2int}
\title{turns a logical operator into an integer}
\usage{
logical2int(obj = NULL)
}
\arguments{
  \item{obj}{a character, the logical parameter to turn
  into an integer}
}
\value{
an integer
}
\description{
This is an internal function.
}
\details{


This function is called to turn a logical oprator given as
a character into an integer: '>' is turned into 1, '>='
into 2, '<' into 3, '<=' into 4, '==' into 5 and '!=' into
6.
}
\keyword{internal}

