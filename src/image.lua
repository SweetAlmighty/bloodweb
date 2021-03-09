return {
    new = function(name)
        local position = Vector(200, 200);
        local image = love.graphics.newImage("assets/imgs/"..name..".png");
        
        local offset = {
            x = image:getWidth()/2,
            y = image:getHeight()/2
        }

        return {
            Draw = function()
                love.graphics.draw(image, position.x - offset.x, position.y - offset.y)
            end,

            SetPosition = function(x, y)
                position = Vector(x, y)
            end
        }
    end
}