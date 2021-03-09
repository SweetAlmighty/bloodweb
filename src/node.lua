local util = require('src/util');
local edge = require('src/edge');
local animation = require('src/animation');

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
    local circle = animation.new('circle');
    local dimension = circle.Dimensions();
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
        circle.Regress();
    end

    _node.Position = function() return position; end

    _node.Update = function(dt) circle.Update(dt); end

    _node.AddEdge = function(edge) edges[#edges+1] = edge; end 

    _node.Draw = function() circle.Draw(position.x, position.y, rot, 1, 1, dimension.w/2, dimension.h/2); end

    _node.MouseDown = function(x, y)
        mouseDown = true;
        if util.pointInCircle(x, y, _circle) then
            circle.Progress();
        end
    end

    return _node;
end

return node;