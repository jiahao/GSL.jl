#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
#############################
# 7.20 Gegenbauer Functions #
#############################
export gsl_sf_gegenpoly_1, gsl_sf_gegenpoly_2, gsl_sf_gegenpoly_3,
       gsl_sf_gegenpoly_1_e, gsl_sf_gegenpoly_2_e, gsl_sf_gegenpoly_3_e,
       gsl_sf_gegenpoly_n, gsl_sf_gegenpoly_n_e, gsl_sf_gegenpoly_array


# These functions evaluate the Gegenbauer polynomials  C^{(\lambda)}_n(x) using
# explicit representations for n =1, 2, 3.
# 
#   Returns: Cdouble
function gsl_sf_gegenpoly_1(lambda::Real, x::Real)
    ccall( (:gsl_sf_gegenpoly_1, :libgsl), Cdouble, (Cdouble, Cdouble),
        lambda, x )
end
@vectorize_2arg Number gsl_sf_gegenpoly_1


# These functions evaluate the Gegenbauer polynomials  C^{(\lambda)}_n(x) using
# explicit representations for n =1, 2, 3.
# 
#   Returns: Cdouble
function gsl_sf_gegenpoly_2(lambda::Real, x::Real)
    ccall( (:gsl_sf_gegenpoly_2, :libgsl), Cdouble, (Cdouble, Cdouble),
        lambda, x )
end
@vectorize_2arg Number gsl_sf_gegenpoly_2


# These functions evaluate the Gegenbauer polynomials  C^{(\lambda)}_n(x) using
# explicit representations for n =1, 2, 3.
# 
#   Returns: Cdouble
function gsl_sf_gegenpoly_3(lambda::Real, x::Real)
    ccall( (:gsl_sf_gegenpoly_3, :libgsl), Cdouble, (Cdouble, Cdouble),
        lambda, x )
end
@vectorize_2arg Number gsl_sf_gegenpoly_3


# These functions evaluate the Gegenbauer polynomials  C^{(\lambda)}_n(x) using
# explicit representations for n =1, 2, 3.
# 
#   Returns: Cint
function gsl_sf_gegenpoly_1_e(lambda::Real, x::Real)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_gegenpoly_1_e, :libgsl), Cint, (Cdouble,
        Cdouble, Ptr{gsl_sf_result}), lambda, x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
@vectorize_2arg Number gsl_sf_gegenpoly_1_e


# These functions evaluate the Gegenbauer polynomials  C^{(\lambda)}_n(x) using
# explicit representations for n =1, 2, 3.
# 
#   Returns: Cint
function gsl_sf_gegenpoly_2_e(lambda::Real, x::Real)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_gegenpoly_2_e, :libgsl), Cint, (Cdouble,
        Cdouble, Ptr{gsl_sf_result}), lambda, x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
@vectorize_2arg Number gsl_sf_gegenpoly_2_e


# These functions evaluate the Gegenbauer polynomials  C^{(\lambda)}_n(x) using
# explicit representations for n =1, 2, 3.
# 
#   Returns: Cint
function gsl_sf_gegenpoly_3_e(lambda::Real, x::Real)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_gegenpoly_3_e, :libgsl), Cint, (Cdouble,
        Cdouble, Ptr{gsl_sf_result}), lambda, x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
@vectorize_2arg Number gsl_sf_gegenpoly_3_e


# These functions evaluate the Gegenbauer polynomial  C^{(\lambda)}_n(x) for a
# specific value of n, lambda, x subject to \lambda > -1/2,  n >= 0.
# 
#   Returns: Cdouble
function gsl_sf_gegenpoly_n(n::Integer, lambda::Real, x::Real)
    ccall( (:gsl_sf_gegenpoly_n, :libgsl), Cdouble, (Cint, Cdouble,
        Cdouble), n, lambda, x )
end
#TODO This vectorization macro is not implemented
#@vectorize_3arg Number gsl_sf_gegenpoly_n


# These functions evaluate the Gegenbauer polynomial  C^{(\lambda)}_n(x) for a
# specific value of n, lambda, x subject to \lambda > -1/2,  n >= 0.
# 
#   Returns: Cint
function gsl_sf_gegenpoly_n_e(n::Integer, lambda::Real, x::Real)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_gegenpoly_n_e, :libgsl), Cint, (Cint,
        Cdouble, Cdouble, Ptr{gsl_sf_result}), n, lambda, x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
#TODO This vectorization macro is not implemented
#@vectorize_3arg Number gsl_sf_gegenpoly_n_e


# This function computes an array of Gegenbauer polynomials  C^{(\lambda)}_n(x)
# for n = 0, 1, 2, \dots, nmax, subject to \lambda > -1/2,  nmax >= 0.
# 
#   Returns: Cint
function gsl_sf_gegenpoly_array(nmax::Integer, lambda::Real, x::Real)
    result_array = convert(Cdouble, Array(Cdouble, 1))
    gsl_errno = ccall( (:gsl_sf_gegenpoly_array, :libgsl), Cint, (Cint,
        Cdouble, Cdouble, Cdouble), nmax, lambda, x, result_array )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result_array)[1]
end
#TODO This vectorization macro is not implemented
#@vectorize_3arg Number gsl_sf_gegenpoly_array
