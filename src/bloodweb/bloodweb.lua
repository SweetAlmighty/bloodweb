require('src/graph/node')
require('src/graph/graph')
require('src/tools/image')
require('src/bloodweb/root')

Bloodweb = Graph:extend();

function Bloodweb:new()
    Bloodweb.super:new()
    self:add_node(screen_width/4, screen_height/2, true)
    self:breadth_first_search()
end

function Bloodweb:add_node(x, y, full)
    local node = nil
    if full then
        node = Root(x, y)
        self.nodes[#self.nodes+1] = node
    else node = Bloodweb.super:add_node(x, y) end
    return node
end

function Bloodweb:breadth_first_search()
    local stack = { }
    stack[#stack+1] = self.nodes[1]

    while #stack ~= 0 do
        local node = stack[#stack]
        table.remove(stack, #stack)

        local direction = node:determine_direction()

        while direction ~= nil do
            local continue = true
            local new_pos = node:get_position() + (direction * 58)

            for k, v in pairs(self.nodes) do
                if v:is_in_circle(new_pos.x, new_pos.y) then
                    continue = false
                    break
                end
            end

            if continue then
                local pos = node:get_position() + (direction * 64)
                local new_node = self:add_node(pos.x, pos.y, false)
                local edge = Bloodweb.super:add_edge(node, new_node)

                new_node:add_connection(node, -direction, edge)

                stack[#stack+1] = new_node
            end

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