"""
    Camera trap Survey

TBC
"""
# TODO include survey structure with a set of dicts
struct Survey
    name::String
    root::String
    filetree::Dict
    image_filetype::Dict

    function Survey(name::String, root::String, pattern::String)

        if isdir(root)

            filetype = Dict(pattern => get_filetype(pattern))
            filetree = load_filetree(root, pattern)

            return new(name, root, filetree, filetype)

        else
            throw("Path $(root) is not a directory.")
        end

    end
end