"""
    Base.show(io::IO, survey::Survey)

Print a Survey to the given IO.
"""
function Base.show(io::IO, survey::Survey)

    type = collect(values(survey.type))[1]
    root = survey.root

    obj_print = """

                📷 [Camera Trap Survey] 
                ↳  Root      : $(root) 
                ↳  Image Type: $(type) """

    print(io, obj_print)
end
