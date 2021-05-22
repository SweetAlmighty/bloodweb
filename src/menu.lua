local icon_type = {
    survivors = 1,
    loadout = 2,
    bloodweb = 3,
    customize = 4,
    killer = 5,
    store = 6
}

Menu = Object:extend();

function Menu:new()
    self.icons = { }
    self.offset = Vector(16, 16)
    self.background = Image('menu_background', Vector(130, 160))
    self.image = love.graphics.newImage("assets/imgs/menu_icons.png")
    local width, height = self.image:getWidth(), self.image:getHeight()
    
    local j, k = 0, 0
    for i=0, 5, 1 do
        j = i > 2 and 32 or 0
        k = i > 2 and i - 3 or i
        self.icons[#self.icons+1] = love.graphics.newQuad((32*k), j, 32, 32, width, height)
    end
end

function Menu:draw()
    love.graphics.setColor(1, 1, 1, 1)
    
    self.background:draw()
    
    local iter = 0
    for _, v in pairs(self.icons) do
        iter = iter + 1
        love.graphics.draw(self.image, v, 30 - self.offset.x, (iter * 32) - self.offset.y)
    end
end