module CameraTrapTools

    using ScanDir # Used for ScanDir.walkdir

    export scan
    export Survey

    include(joinpath(".", "utils.jl"))
    include(joinpath(".", "types.jl"))
    include(joinpath(".", "filetree.jl"))
    include(joinpath(".", "show.jl"))

end
