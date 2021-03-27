ItemBox = Object:extend()

-- brown: 63, 47, 34
-- yellow: 160, 135, 48
-- green: 41, 112, 38
-- purple: 100, 47, 121
-- red: 143, 8, 48

local rarity_colors = {
    { r = 63/255,  g = 47/255,  b = 34/255,  a = 1 },
    { r = 160/255, g = 135/255, b = 48/255,  a = 1 },
    { r = 41/255,  g = 112/255, b = 38/255,  a = 1 },
    { r = 100/255, g = 47/255,  b = 121/255, a = 1 },
    { r = 143/255, g = 8/255,   b = 48/255,  a = 1 }
}

function ItemBox:new(x, y)
    self.position = Vector(x, y)
    self.type = util.randomChoice({ 0, 1, 2 })
    self.image = love.graphics.newImage("assets/imgs/item_box.png")
    self.image:setFilter("nearest", "nearest")
    
    self.rarity = util.randomChoice(util.shuffle({ 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5 }))
    
    self.offset = Vector(16, 16)
    self.color = rarity_colors[self.rarity]
    self.border = love.graphics.newQuad(32 * self.type, 0, 32, 32, 96, 64)
    self.background = love.graphics.newQuad(32 * self.type, 32, 32, 32, 96, 64)
end

function ItemBox:draw()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a)
    love.graphics.draw(self.image, self.background, self.position.x - self.offset.x, self.position.y - self.offset.y)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.draw(self.image, self.border, self.position.x - self.offset.x, self.position.y - self.offset.y)
    love.graphics.setColor(1, 1, 1, 1)
end