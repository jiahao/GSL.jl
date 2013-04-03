#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
############################################
# 7.5.5 Regular Spherical Bessel Functions #
############################################
export gsl_sf_bessel_j0, gsl_sf_bessel_j0_e, gsl_sf_bessel_j1,
       gsl_sf_bessel_j1_e, gsl_sf_bessel_j2, gsl_sf_bessel_j2_e,
       gsl_sf_bessel_jl, gsl_sf_bessel_jl_e, gsl_sf_bessel_jl_array,
       gsl_sf_bessel_jl_steed_array


# These routines compute the regular spherical Bessel function of zeroth order,
# j_0(x) = \sin(x)/x.
# 
#   Returns: Cdouble
function gsl_sf_bessel_j0(x::Real)
    ccall( (:gsl_sf_bessel_j0, :libgsl), Cdouble, (Cdouble, ), x )
end
@vectorize_1arg Number gsl_sf_bessel_j0


# These routines compute the regular spherical Bessel function of zeroth order,
# j_0(x) = \sin(x)/x.
# 
#   Returns: Cint
function gsl_sf_bessel_j0_e(x::Real)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_bessel_j0_e, :libgsl), Cint, (Cdouble,
        Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
@vectorize_1arg Number gsl_sf_bessel_j0_e


# These routines compute the regular spherical Bessel function of first order,
# j_1(x) = (\sin(x)/x - \cos(x))/x.
# 
#   Returns: Cdouble
function gsl_sf_bessel_j1(x::Real)
    ccall( (:gsl_sf_bessel_j1, :libgsl), Cdouble, (Cdouble, ), x )
end
@vectorize_1arg Number gsl_sf_bessel_j1


# These routines compute the regular spherical Bessel function of first order,
# j_1(x) = (\sin(x)/x - \cos(x))/x.
# 
#   Returns: Cint
function gsl_sf_bessel_j1_e(x::Real)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_bessel_j1_e, :libgsl), Cint, (Cdouble,
        Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
@vectorize_1arg Number gsl_sf_bessel_j1_e


# These routines compute the regular spherical Bessel function of second order,
# j_2(x) = ((3/x^2 - 1)\sin(x) - 3\cos(x)/x)/x.
# 
#   Returns: Cdouble
function gsl_sf_bessel_j2(x::Real)
    ccall( (:gsl_sf_bessel_j2, :libgsl), Cdouble, (Cdouble, ), x )
end
@vectorize_1arg Number gsl_sf_bessel_j2


# These routines compute the regular spherical Bessel function of second order,
# j_2(x) = ((3/x^2 - 1)\sin(x) - 3\cos(x)/x)/x.
# 
#   Returns: Cint
function gsl_sf_bessel_j2_e(x::Real)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_bessel_j2_e, :libgsl), Cint, (Cdouble,
        Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
@vectorize_1arg Number gsl_sf_bessel_j2_e


# These routines compute the regular spherical Bessel function of order l,
# j_l(x), for  l >= 0 and  x >= 0.
# 
#   Returns: Cdouble
function gsl_sf_bessel_jl(l::Integer, x::Real)
    ccall( (:gsl_sf_bessel_jl, :libgsl), Cdouble, (Cint, Cdouble), l, x )
end
@vectorize_2arg Number gsl_sf_bessel_jl


# These routines compute the regular spherical Bessel function of order l,
# j_l(x), for  l >= 0 and  x >= 0.
# 
#   Returns: Cint
function gsl_sf_bessel_jl_e(l::Integer, x::Real)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_bessel_jl_e, :libgsl), Cint, (Cint,
        Cdouble, Ptr{gsl_sf_result}), l, x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
@vectorize_2arg Number gsl_sf_bessel_jl_e


# This routine computes the values of the regular spherical Bessel functions
# j_l(x) for l from 0 to lmax inclusive  for  lmax >= 0 and  x >= 0, storing
# the results in the array result_array.  The values are computed using
# recurrence relations for efficiency, and therefore may differ slightly from
# the exact values.
# 
#   Returns: Cint
function gsl_sf_bessel_jl_array(lmax::Integer, x::Real)
    result_array = convert(Cdouble, Array(Cdouble, 1))
    gsl_errno = ccall( (:gsl_sf_bessel_jl_array, :libgsl), Cint, (Cint,
        Cdouble, Cdouble), lmax, x, result_array )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result_array)[1]
end
@vectorize_2arg Number gsl_sf_bessel_jl_array


# This routine uses Steed's method to compute the values of the regular
# spherical Bessel functions j_l(x) for l from 0 to lmax inclusive for  lmax >=
# 0 and  x >= 0, storing the results in the array result_array.  The
# Steed/Barnett algorithm is described in Comp. Phys. Comm. 21, 297 (1981).
# Steed's method is more stable than the recurrence used in the other functions
# but is also slower.
# 
#   Returns: Cint
function gsl_sf_bessel_jl_steed_array(lmax::Integer, x::Real)
    result_array = convert(Ptr{Cdouble}, Array(Cdouble, 1))
    gsl_errno = ccall( (:gsl_sf_bessel_jl_steed_array, :libgsl), Cint,
        (Cint, Cdouble, Ptr{Cdouble}), lmax, x, result_array )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result_array)[1]
end
@vectorize_2arg Number gsl_sf_bessel_jl_steed_array
