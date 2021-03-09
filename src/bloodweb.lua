local util = require('src/util')
local node = require('src/node');
local image = require('src/image');

local maxEdges = util.randomChoice({ 0, 1, 2, 3, 4 });

local nodes = { }
local edges = { }
local bloodweb = { }
local directions = { };
local position = Vector(200, 200);
local center = image.new('center');
local centerNode = node.new(position.x, position.y);
local determineDirection = function()
    if #edges == maxEdges then return nil; end

    local direction = util.determineDirection();

    for k, v in pairs(directions) do
        if v == direction then
            return nil;
        end
    end

    directions[#directions+1] = direction;
    
    return directions[#directions]
end

bloodweb.new = function()
    local _web = { }

    _web.Init = function()
        for i=1, maxEdges do
            local dir = determineDirection();
            if dir ~= nil then
                local n, e = centerNode.AddNode(dir);
                nodes[#nodes+1] = n;
                edges[#edges+1] = e;
                i = i + 1;
            end
        end
    end
    
    _web.Draw = function()
        for k, v in pairs(edges) do v.Draw(); end
        for k, v in pairs(nodes) do v.Draw(); end
        center.Draw();
    end

    _web.Update = function(dt)
        for k, v in pairs(nodes) do v.Update(dt); end
        for k, v in pairs(edges) do v.Update(dt); end
    end

    _web.MouseUp = function()
        for k, v in pairs(nodes) do
            v.MouseUp();
        end
    end

    _web.MouseDown = function(x, y)
        for k, v in pairs(nodes) do
            v.MouseDown(x, y);
        end
    end

    _web.Init();

    return _web
end

return bloodweb