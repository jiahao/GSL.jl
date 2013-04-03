#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
#####################
# 7.8.2 6-j Symbols #
#####################
export gsl_sf_coupling_6j, gsl_sf_coupling_6j_e




# These routines compute the Wigner 6-j coefficient,                 {ja jb jc
# jd je jf}  where the arguments are given in half-integer units, ja =
# two_ja/2, ma = two_ma/2, etc.
# 
#   Returns: Cdouble
function gsl_sf_coupling_6j(two_ja::Integer, two_jb::Integer, two_jc::Integer, two_jd::Integer, two_je::Integer, two_jf::Integer)
    ccall( (:gsl_sf_coupling_6j, :libgsl), Cdouble, (Cint, Cint, Cint,
        Cint, Cint, Cint), two_ja, two_jb, two_jc, two_jd, two_je, two_jf )
end
#TODO This vectorization macro is not implemented
#@vectorize_6arg Number gsl_sf_coupling_6j


# These routines compute the Wigner 6-j coefficient,                 {ja jb jc
# jd je jf}  where the arguments are given in half-integer units, ja =
# two_ja/2, ma = two_ma/2, etc.
# 
#   Returns: Cint
function gsl_sf_coupling_6j_e(two_ja::Integer, two_jb::Integer, two_jc::Integer, two_jd::Integer, two_je::Integer, two_jf::Integer)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_coupling_6j_e, :libgsl), Cint, (Cint, Cint,
        Cint, Cint, Cint, Cint, Ptr{gsl_sf_result}), two_ja, two_jb, two_jc,
        two_jd, two_je, two_jf, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)[1]
end
#TODO This vectorization macro is not implemented
#@vectorize_6arg Number gsl_sf_coupling_6j_e
