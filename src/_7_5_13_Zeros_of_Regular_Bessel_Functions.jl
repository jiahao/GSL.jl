#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
############################################
# 7.5.13 Zeros of Regular Bessel Functions #
############################################
export gsl_sf_bessel_zero_J0, gsl_sf_bessel_zero_J0_e, gsl_sf_bessel_zero_J1,
       gsl_sf_bessel_zero_J1_e, gsl_sf_bessel_zero_Jnu,
       gsl_sf_bessel_zero_Jnu_e


# These routines compute the location of the s-th positive zero of the Bessel
# function J_0(x).
# 
#   Returns: Cdouble
function gsl_sf_bessel_zero_J0(s::Integer)
    ccall( (:gsl_sf_bessel_zero_J0, :libgsl), Cdouble, (Cuint, ), s )
end
@vectorize_1arg Number gsl_sf_bessel_zero_J0


# These routines compute the location of the s-th positive zero of the Bessel
# function J_0(x).
# 
#   Returns: Cint
function gsl_sf_bessel_zero_J0_e(s::Integer)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_bessel_zero_J0_e, :libgsl), Cint, (Cuint,
        Ptr{gsl_sf_result}), s, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
@vectorize_1arg Number gsl_sf_bessel_zero_J0_e


# These routines compute the location of the s-th positive zero of the Bessel
# function J_1(x).
# 
#   Returns: Cdouble
function gsl_sf_bessel_zero_J1(s::Integer)
    ccall( (:gsl_sf_bessel_zero_J1, :libgsl), Cdouble, (Cuint, ), s )
end
@vectorize_1arg Number gsl_sf_bessel_zero_J1


# These routines compute the location of the s-th positive zero of the Bessel
# function J_1(x).
# 
#   Returns: Cint
function gsl_sf_bessel_zero_J1_e(s::Integer)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_bessel_zero_J1_e, :libgsl), Cint, (Cuint,
        Ptr{gsl_sf_result}), s, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
@vectorize_1arg Number gsl_sf_bessel_zero_J1_e


# These routines compute the location of the s-th positive zero of the Bessel
# function J_\nu(x).  The current implementation does not support negative
# values of nu.
# 
#   Returns: Cdouble
function gsl_sf_bessel_zero_Jnu(nu::Real, s::Integer)
    ccall( (:gsl_sf_bessel_zero_Jnu, :libgsl), Cdouble, (Cdouble, Cuint),
        nu, s )
end
@vectorize_2arg Number gsl_sf_bessel_zero_Jnu


# These routines compute the location of the s-th positive zero of the Bessel
# function J_\nu(x).  The current implementation does not support negative
# values of nu.
# 
#   Returns: Cint
function gsl_sf_bessel_zero_Jnu_e(nu::Real, s::Integer)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_bessel_zero_Jnu_e, :libgsl), Cint,
        (Cdouble, Cuint, Ptr{gsl_sf_result}), nu, s, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
@vectorize_2arg Number gsl_sf_bessel_zero_Jnu_e
