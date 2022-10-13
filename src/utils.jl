"""
    Produce a regex pattern

For now, simple r"pattern" is generated.
"""
# TODO uppercase/lowercase + string multiple file extensions together
function make_pattern(pattern::String)

    return Regex(pattern)

end
