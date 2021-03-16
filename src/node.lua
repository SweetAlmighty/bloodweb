Node = Object:extend();

require('src/edge');
require('src/animation');
local util = require('src/util');

--[[
local animDone = false;
local done = function(direction)
    animDone = true;
end
]]

function Node:new(x, y)
    self.edges = { };
    self.directions = { };
    self.mouseDown = false;
    self.position = Vector(x, y);
    self.circle = Animation('circle');
    self.dimension = self.circle:get_dimensions();
    self.maxEdges = util.randomChoice({ 0, 1, 2, 3, 4 });

    self._circle = {
        x = x,
        y = y,
        radius = 16
    }

    local to = Vector(x, 400)
    local from = Vector(200, 200)
    self.rot = util.lookAt(to, from, self.position);
end

function Node:add_node(dir)
    local pos = self.position + (dir * 33);
    local newNode = Node(pos.x, pos.y);
    local edge = Edge(newNode, self);
    newNode:add_edge(edge);
    return newNode, edge;
end

function Node:mouse_up()
    self.mouseDown = false;
    self.circle:regress();
end

function Node:get_position() return self.position; end

function Node:mouse_down(x, y)
    self.mouseDown = true;
    if util.pointInCircle(x, y, self._circle) then self.circle:progress(); end
end

function Node:add_edge(edge)
    self.edges[#self.edges+1] = edge;
end

function Node:update(dt)
    self.circle:update(dt);
end

function Node:draw()
    self.circle:draw(self.position.x, self.position.y, self.rot, 1, 1, self.dimension.x/2, self.dimension.y/2);
end