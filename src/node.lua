local util = require('src/util');
local edge = require('src/edge');
require('src/animation');

local node = { }

--[[
local animDone = false;
local done = function(direction)
    animDone = true;
end
]]

local mouseDown = false;

node.new = function(x, y)
    local _node = { }
    local edges = { };
    local directions = { };
    local position = Vector(x, y);
    local circle = Animation('circle');
    local dimension = circle:get_dimensions();
    local maxEdges = util.randomChoice({ 0, 1, 2, 3, 4 });

    local _circle = {
        x = x,
        y = y,
        radius = 16
    }

    local to = Vector(x, 400)
    local from = Vector(200, 200)
    local rot = util.lookAt(to, from, position);

    _node.AddNode = function(dir)
        local pos = position + (dir * 33);
        local newNode = node.new(pos.x, pos.y);
        local edge = edge.new(newNode, _node);
        newNode.AddEdge(edge);
        return newNode, edge;
    end

    _node.MouseUp = function()
        mouseDown = false;
        circle:regress();
    end

    _node.Position = function() return position; end

    _node.Update = function(dt) circle:update(dt); end

    _node.AddEdge = function(edge) edges[#edges+1] = edge; end 

    _node.Draw = function() circle:draw(position.x, position.y, rot, 1, 1, dimension.x/2, dimension.y/2); end

    _node.MouseDown = function(x, y)
        mouseDown = true;
        if util.pointInCircle(x, y, _circle) then
            circle:progress();
        end
    end

    return _node;
end

return node;