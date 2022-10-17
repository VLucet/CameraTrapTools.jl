"""
    Camera trap Survey

TBC
"""
# TODO include survey structure with a set of dicts
struct Survey
    name::String
    root::String
    filetree::Dict
    type::Dict

    function Survey(name::String, root::String, pattern::String)

        if isdir(root)

            type = Dict(pattern => get_type(pattern))
            filetree = load_filetree(root, pattern)

            return new(name, root, filetree, type)

        else
            throw("Path $(root) is not a directory.")
        end

    end
end