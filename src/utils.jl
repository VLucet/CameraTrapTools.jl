"""
    Produce a regex pattern

For now, simple r"pattern" is generated.
"""
# TODO uppercase/lowercase + string multiple file extensions together
function make_pattern(pattern::String)

    return Regex(pattern)

end

"""
    Lookup filetype name based on make_pattern

Loads a dict and looks up a key.
"""
function get_type(pattern::String)

    pattern_dict = Dict(".jpg" => "JPEG",
                        ".JPG" => "JPEG",
                        ".jpeg" => "JPEG",
                        ".png" => "PNG")

    if haskey(pattern_dict, pattern)
        return pattern_dict[pattern]
    else
        @error "Incorrrect file pattern $(pattern)"
    end

end

"""
    Set leaf on a nested Dict recurvisely

Adapted from python 2 code from:
https://stackoverflow.com/questions/9618862/
"""
function set_leaf(tree, branches, leaf)

    if length(branches) == 1
        tree[branches[1]] = leaf
        return
    end

    if !(haskey(tree, branches[1]))
        tree[branches[1]] = Dict()
    end
    set_leaf(tree[branches[1]], branches[2:end], leaf)

end
