local peachy = require("library/peachy/peachy")

return {
    new = function(name, done)
        local isUpdating = false;
        local peachyAnim = peachy.new(
            "assets/json/"..name..".json",
            love.graphics.newImage("assets/imgs/"..name..".png"),
            "Tag"
        );

        local dimensions = {
            w = peachyAnim:getWidth(),
            h = peachyAnim:getHeight()
        }

        peachyAnim:onLoop(
            function()
                local direction = peachyAnim.direction == 'forward';
                local frame = direction and 33 or 1;
                peachyAnim:setFrame(frame);
                isUpdating = false;
                if done ~= nil then done(direction); end
            end
        );

        return {
            Draw = function(x, y, rot, sx, sy, ox, oy)
                peachyAnim:draw(x, y, rot, sx, sy, ox, oy);
            end,

            Update = function(dt)
                if isUpdating then
                    peachyAnim:update(dt);
                end
            end,

            Progress = function()
                isUpdating = true;
                peachyAnim.direction = 'forward';
            end,

            Regress = function()
                peachyAnim.direction = 'reverse';
            end,

            Dimensions = function()
                return dimensions;
            end,

            Updating = function()
                return isUpdating
            end,
        }
    end
}