"""
    A camera trap survey

For now, a simple rootpath with a given image count.
"""
# TODO include survey structure with a set of dicts
struct Survey
    root::String
    images::Array{String}
    image_count::Int

    function Survey(root::String, pattern::String = ".jpg" ; absolute = true)
        if isdir(root) 
            images = read_dir(root, pattern ; absolute = absolute)
        else
            throw("Path $(root) is not a directory.")
        end
        image_count = length(images)
        new(root, images, image_count)
    end
end