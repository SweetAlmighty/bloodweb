Bloodweb = Object:extend();

require('src/image');

local util = require('src/util');
local node = require('src/node');

function Bloodweb:new()
    self.nodes = { }
    self.edges = { }
    self.bloodweb = { }
    self.directions = { };
    self.position = Vector(200, 200);
    self.center = Image('center', self.position);
    self.maxEdges = util.randomChoice({ 0, 1, 2, 3, 4 });
    self.centerNode = node.new(self.position.x, self.position.y);

    for i=1, self.maxEdges do
        local dir = self:determine_direction();
        if dir ~= nil then
            local n, e = self.centerNode.AddNode(dir);
            self.nodes[#self.nodes+1] = n;
            self.edges[#self.edges+1] = e;
            i = i + 1;
        end
    end
end

function Bloodweb:determine_direction()
    if #self.edges == self.maxEdges then return nil; end

    local direction = util.determineDirection();

    for k, v in pairs(self.directions) do
        if v == direction then
            return nil;
        end
    end

    self.directions[#self.directions+1] = direction;
    
    return self.directions[#self.directions];
end

function Bloodweb:draw()
    for k, v in pairs(self.edges) do v.Draw(); end
    for k, v in pairs(self.nodes) do v.Draw(); end
    self.center:draw();
end

function Bloodweb:update(dt)
    for k, v in pairs(self.nodes) do v.Update(dt); end
    for k, v in pairs(self.edges) do v.Update(dt); end
end

function Bloodweb:mouse_up()
    for k, v in pairs(self.nodes) do
        v.MouseUp();
    end
end

function Bloodweb:mouse_down(x, y)
    for k, v in pairs(self.nodes) do
        v.MouseDown(x, y);
    end
end