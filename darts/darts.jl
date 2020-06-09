function throw_dart()
    ## Center point
    x = 0
    y = 0
    ## Side of square
    a = 2
    ## Random final landing position
    position_x = x+a/2*(-1+2*rand())
    position_y = y+a/2*(-1+2*rand())
    return [position_x, position_y]
end

function is_within_circle(vector)
    ## Side of square
    a = 2
    x = vector[1]
    y = vector[2]
    distance_from_center = sqrt((x^2)+(y^2))
    if distance_from_center < (a/2)
        return 1
    else
        return 0
    end
end

function compute_pi(n_throws)
    n_throws = n_throws
    count_inside_circle = 0
    for i in 1:n_throws
        r = throw_dart()
        if is_within_circle(r) == 1
            count_inside_circle = count_inside_circle+1
        end
    end
    result = 4*(count_inside_circle/n_throws)
    return result
end
