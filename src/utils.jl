"""
    Read directory recursively

This function reads all files in a directory and returns an array of file paths.
"""
function read_dir(rootpath::String, pattern::String = ".jpg" ; 
                  absolute::Bool = true)

    pattern = make_pattern(pattern)

    file_list = String[]

    for (root, dirs, files) in walkdir(rootpath)

        if isempty(dirs) & !isempty(files)
            
            relative_root = replace(root, rootpath => "" )
            @info "Listing files in $(relative_root)"
            
            for file in files
                if occursin(pattern, file)
                    file_path = absolute ? joinpath(root, file) : joinpath(relative_root, file)
                    push!(file_list, file_path) 
                end
            end

        end
    end

    return file_list

end

"""
    Produces a regex pattern

For now, simple r"pattern" is generated.
"""
# TODO uppercase/lowercase + string multiple file extensions together
function make_pattern(pattern::String)

    return Regex(pattern)

end
