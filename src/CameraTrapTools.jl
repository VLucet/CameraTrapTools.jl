module CameraTrapTools

    using ScanDir # Used for ScanDir.walkdir

    export read_dir
    export Survey

    include(joinpath(".", "utils.jl"))
    include(joinpath(".", "types.jl"))
    include(joinpath(".", "show.jl"))

end
