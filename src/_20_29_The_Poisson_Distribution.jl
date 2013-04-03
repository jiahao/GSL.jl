#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
##################################
# 20.29 The Poisson Distribution #
##################################
export gsl_ran_poisson, gsl_ran_poisson_pdf, gsl_cdf_poisson_P,
       gsl_cdf_poisson_Q




# This function returns a random integer from the Poisson distribution with
# mean mu.  The probability distribution for Poisson variates is,
# p(k) = {\mu^k \over k!} \exp(-\mu)  for  k >= 0.
# 
#   Returns: Cuint
function gsl_ran_poisson(r::Ptr{gsl_rng}, mu::Real)
    ccall( (:gsl_ran_poisson, :libgsl), Cuint, (Ptr{gsl_rng}, Cdouble), r,
        mu )
end


# This function computes the probability p(k) of obtaining  k from a Poisson
# distribution with mean mu, using the formula given above.
# 
#   Returns: Cdouble
function gsl_ran_poisson_pdf(k::Integer, mu::Real)
    ccall( (:gsl_ran_poisson_pdf, :libgsl), Cdouble, (Cuint, Cdouble), k,
        mu )
end
@vectorize_2arg Number gsl_ran_poisson_pdf


# These functions compute the cumulative distribution functions P(k), Q(k) for
# the Poisson distribution with parameter mu.
# 
#   Returns: Cdouble
function gsl_cdf_poisson_P(k::Integer, mu::Real)
    ccall( (:gsl_cdf_poisson_P, :libgsl), Cdouble, (Cuint, Cdouble), k, mu
        )
end
@vectorize_2arg Number gsl_cdf_poisson_P


# These functions compute the cumulative distribution functions P(k), Q(k) for
# the Poisson distribution with parameter mu.
# 
#   Returns: Cdouble
function gsl_cdf_poisson_Q(k::Integer, mu::Real)
    ccall( (:gsl_cdf_poisson_Q, :libgsl), Cdouble, (Cuint, Cdouble), k, mu
        )
end
@vectorize_2arg Number gsl_cdf_poisson_Q
