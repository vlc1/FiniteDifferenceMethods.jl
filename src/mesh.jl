"""

    spacing([T]; start, stop)

Computes spacing of a uniform mesh.


"""
spacing(stop, ::Type{T}=Float64; start=1) where {T} =
    convert(T, inv(stop-start))

"""

    collocated(n, T; start=1, stop=n)

Creates a range (1-based) representing the coordinates of a uniform mesh of the unit segment.

!!! note

    If `start ≥ 1` and/or `stop ≤ n`, then `iszero(x[start])` and `isone(x[stop])`.


"""
function collocated(n::Int, ::Type{T}=Float64; start=1, stop=n) where {T}
    h = spacing(stop, T; start)
    range((1-start) * h, length=n, step=h)
end
