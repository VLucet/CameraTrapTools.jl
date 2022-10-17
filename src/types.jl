"""
    Camera trap Survey

TBC
"""
# TODO include survey structure with a set of dicts
struct Survey
    name::String
    root::String
    filetree::Dict
    pattern::String
    filetype::String

    function Survey(name::String, root::String, pattern::String)

        if isdir(root)

            filetype = get_type(pattern)
            filetree = load_filetree(root, pattern)

            return new(name, root, filetree, pattern, filetype)

        else
            throw("Path $(root) is not a directory.")
        end

    end
end