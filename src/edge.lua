Edge = Object:extend()

local edge_full = false
function Edge:new(from, to)
    self.connections = { from, to }

    self.drawable = Animation('stem',
        function(forward)
            edge_full = forward
            if forward then
                self.connections[2]:on_mouse_down()
            end
        end
    )

    self.position = to:get_position()
    self.dimension = self.drawable:get_dimensions()

    local from_pos = from:get_position()
    self.rotation = util.lookAt(Vector(self.position.x, 400), from_pos, self.position)

    -- Push back into center
    local direction = (self.position - from_pos).normalized
    self.position = self.position + (16 * -direction)
end

function Edge:draw()
    self.drawable:draw(self.position.x, self.position.y, self.rotation, 1, 1, self.dimension.x/2, 0)
end

function Edge:update(dt)
    self.drawable:update(dt)
end

function Edge:on_mouse_down(x, y)
    if self.connections[2]:selected(x, y) then
        self.drawable:progress()
    end
end

local sh = false
function Edge:set_shit(shit)
    sh = shit
end

function Edge:on_mouse_up()
    if sh or not edge_full then
        sh = false
        self.drawable:regress()
    end
end