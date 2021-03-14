local util = require('src/util')
require('src/animation')

--[[
local animDone = false;
local done = function(direction)
    animDone = true;
end
]]

return {
    new = function(to, from)
        local nodes = { to, from }
        local stem = Animation('stem');

        local toPos = to.Position();
        local fromPos = from.Position();
        local dimension = stem:get_dimensions();
        local _to = (toPos - fromPos).normalized;

        local angle = util.lookAt(Vector(toPos.x, 400), fromPos, toPos);

        -- Push back into center
        toPos = toPos + (15 * -_to)
        
        return {
            Update = function(dt) stem:update(dt); end,
            GetNode = function(index) return nodes[index]; end,
            Draw = function()
                stem:draw(toPos.x, toPos.y, angle, 1, 1, dimension.x/2, 0);
            end,
        }
    end
}