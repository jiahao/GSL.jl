#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
###################################
# 4.2 Infinities and Not-a-number #
###################################
#############
# Footnotes #
#############
export gsl_isnan, gsl_isinf, gsl_finite


# This function returns 1 if x is not-a-number.
# 
#   Returns: Cint
function gsl_isnan(x::Real)
    gsl_errno = ccall( (:gsl_isnan, :libgsl), Cint, (Cdouble, ), x )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
end
@vectorize_1arg Number gsl_isnan


# This function returns +1 if x is positive infinity, -1 if x is negative
# infinity and 0 otherwise.1
# 
#   Returns: Cint
function gsl_isinf(x::Real)
    gsl_errno = ccall( (:gsl_isinf, :libgsl), Cint, (Cdouble, ), x )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
end
@vectorize_1arg Number gsl_isinf


# This function returns 1 if x is a real number, and 0 if it is infinite or
# not-a-number.
# 
#   Returns: Cint
function gsl_finite(x::Real)
    gsl_errno = ccall( (:gsl_finite, :libgsl), Cint, (Cdouble, ), x )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
end
@vectorize_1arg Number gsl_finite
