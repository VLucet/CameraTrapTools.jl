"""
    Base.show(io::IO, survey::Survey)

Print a Survey to the given IO.
"""
function Base.show(io::IO, survey::Survey)
    obj_print = """

                ✔ [Camera Trap Survey] 
                ↳ [Root: $(survey.root)] """
    print(io, obj_print)
end
