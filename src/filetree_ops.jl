"""
    Load a file tree as a nested directories

Loads the file tree 
"""
function load_filetree(top::String, pattern::String)

    tree = Dict()

    for (root, dirs, files) in
        ScanDir.walkdir(top; prune = e -> isfile(e) & !occursin(pattern, e.name))

        branches = [top]
        if root != top
            append!(branches, split(relpath(root, top), "/"))
        end

        set_leaf(
            tree,
            branches,
            merge(
                Dict([(d => Dict()) for d in dirs]),
                Dict([(f => Nothing) for f in files]),
            ),
        )
    end

    return tree

end

"""
    Read Survey directory recursively

This function reads all files in a Survey directory and returns an array of file 
paths.
"""
function scan(rootpath::String, pattern::String; absolute::Bool = true)

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

function scan(survey::Survey, pattern::String; absolute::Bool = true)

    rootpath = survey.root
    name = survey.name

    @info "Scanning survey '$(name)' at root folder $(rootpath)"

    survey.images = scan(rootpath, pattern; absolute = absolute)
    survey.image_count = length(survey.images)

    return (survey)
end
