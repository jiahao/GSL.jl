#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
##################
# 7.17.4 Ei_3(x) #
##################
export gsl_sf_expint_3, gsl_sf_expint_3_e


# These routines compute the third-order exponential integral  Ei_3(x) =
# \int_0^xdt \exp(-t^3) for  x >= 0.
# 
#   Returns: Cdouble
function gsl_sf_expint_3(x::Real)
    ccall( (:gsl_sf_expint_3, :libgsl), Cdouble, (Cdouble, ), x )
end
@vectorize_1arg Number gsl_sf_expint_3


# These routines compute the third-order exponential integral  Ei_3(x) =
# \int_0^xdt \exp(-t^3) for  x >= 0.
# 
#   Returns: Cint
function gsl_sf_expint_3_e(x::Real)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_expint_3_e, :libgsl), Cint, (Cdouble,
        Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
@vectorize_1arg Number gsl_sf_expint_3_e
