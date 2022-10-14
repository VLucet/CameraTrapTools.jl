module CameraTrapTools

    using ScanDir # For ScanDir.walkdir
    using UUIDs   # For generating unique ids for images 

    export scan
    export Survey

    include(joinpath(".", "utils.jl"))
    include(joinpath(".", "types.jl"))
    include(joinpath(".", "filetree.jl"))
    include(joinpath(".", "show.jl"))

end
