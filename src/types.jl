"""
    Camera trap Survey

TBC
"""
# TODO include survey structure with a set of dicts
struct Survey
    name::String
    root::String
    images::Array{String}
    image_count::Int

    function Survey(name::String, root::String)
        if isdir(root)
            new(name, root)
        else
            throw("Path $(root) is not a directory.")
        end
    end
end

"""
    Read Survey directory recursively

This function reads all files in a Survey directory and returns an array of file 
paths.
"""
function scan(rootpath::String, pattern::String = ".jpg"; absolute::Bool = true)

    pattern = make_pattern(pattern)

    file_list = String[]

    for (root, dirs, files) in ScanDir.walkdir(rootpath)

        if isempty(dirs) & !isempty(files)

            relative_root = replace(root, rootpath => "")
            @info "Listing files in $(relative_root)"

            # TODO potential speedup: list comprehension, maybe using Glob.jl?
            for file in files
                if occursin(pattern, file)
                    file_path =
                        absolute ? joinpath(root, file) : joinpath(relative_root, file)
                    push!(file_list, file_path)
                end
            end

        end
    end

    return file_list

end

function scan(survey::Survey, pattern::String = ".jpg"; absolute::Bool = true)

    rootpath = survey.root
    name = survey.name

    @info "Scanning survey '$(name)' at root folder $(rootpath)"

    images = scan(rootpat, pattern; absolute = absolute)
    image_count = length(images)

    return ((images, image_count))
end
