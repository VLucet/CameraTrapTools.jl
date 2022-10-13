module CameraTrapTools

    using ScanDir # Used for ScanDir.walkdir

    export scan
    export Survey

    include(joinpath(".", "utils.jl"))
    include(joinpath(".", "survey.jl"))
    include(joinpath(".", "show.jl"))

end
