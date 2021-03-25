require('src/node')
require('src/graph')
require('src/image')

Bloodweb = Graph:extend();

local stack = { }
function Bloodweb:new()
    Bloodweb.super:new()

    self.root = Bloodweb.super:add_node(200, 200)

    self.root.drawable = Image('center', self.root:get_position())
    self.root.drawable.update = function() end
    self.root.drawable.regress = function() end
    self.root.drawable.progress = function() end

    self.root:set_full(true)
    self.root.draw = function() self.root.drawable:draw() end

    stack[#stack+1] = self.root

    self:breadth_first_search()
end

function Bloodweb:breadth_first_search()
    while #stack ~= 0 do
        local node = stack[#stack]
        table.remove(stack, #stack)

        local direction = node:determine_direction()
        while direction ~= nil do
            local pos = node:get_position() + (direction * 46)
            local new_node = Bloodweb.super:add_node(pos.x, pos.y)

            local edge = Bloodweb.super:add_edge(node, new_node)

            new_node:add_connection(node, -direction, edge)

            stack[#stack+1] = new_node

            direction = node:determine_direction()
        end
    end
end

function Bloodweb:draw()
    for _, v in pairs(Bloodweb.super.edges) do v:draw() end
    for _, v in pairs(Bloodweb.super.nodes) do v:draw() end
end

function Bloodweb:update(dt)
    for _, v in pairs(Bloodweb.super.edges) do v:update(dt) end
    for _, v in pairs(Bloodweb.super.nodes) do v:update(dt) end
end

function Bloodweb:mouse_up()
    for _, v in pairs(Bloodweb.super.edges) do v:on_mouse_up() end
    for _, v in pairs(Bloodweb.super.nodes) do v:on_mouse_up() end
end

function Bloodweb:mouse_down(x, y)
    for _, v in pairs(Bloodweb.super.edges) do v:on_mouse_down(x, y) end
end