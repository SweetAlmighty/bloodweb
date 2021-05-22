require('src/graph/node')

Root = Node:extend()

function Root:new(x, y)
    Root.super:new(x, y)

    self.node_full = true
    self.drawable = Image('center', self:get_position())
    self.drawable.update = function() end
    self.drawable.regress = function() end
    self.drawable.progress = function() end
    self.draw = function() self.drawable:draw() end
end