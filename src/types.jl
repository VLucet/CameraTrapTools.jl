"""
    A camera trap survey

For now, a simple rootpath with a given image count.
"""
struct Survey
    root::String
    image_count::Int

    function Survey(root::String, image_count::Int)
        new(root, image_count)
    end
end