"""
    Read directory recursively

This function reads all files in a directory and returns an array of file paths.
"""
# TODO implement returning relative paths to the rootpath
function read_dir(rootpath::String, pattern::String = ".jpg" ; 
                  absolute::Bool = true)

    pattern = make_pattern(pattern)

    file_list = String[]

    for (root, dirs, files) in walkdir(rootpath)
        for file in files
            if occursin(pattern, file) 
                if absolute
                    file_path = joinpath(root, file)
                else
                    throw("Relative paths not yet supported")
                end
                push!(file_list, file_path) 
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
