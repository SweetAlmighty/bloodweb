local util = require('src/util')
local animation = require('src/animation')

--[[
local animDone = false;
local done = function(direction)
    animDone = true;
end
]]

return {
    new = function(to, from)
        local nodes = { to, from }
        local stem = animation.new('stem');

        local toPos = to.Position();
        local fromPos = from.Position();
        local dimension = stem.Dimensions();
        local _to = (toPos - fromPos).normalized;

        local angle = util.lookAt(Vector(toPos.x, 400), fromPos, toPos);

        -- Push back into center
        toPos = toPos + (15 * -_to)
        
        return {
            Update = function(dt) stem.Update(dt); end,
            GetNode = function(index) return nodes[index]; end,
            Draw = function()
                stem.Draw(toPos.x, toPos.y, angle, 1, 1, dimension.w/2, 0);
            end,
        }
    end
}