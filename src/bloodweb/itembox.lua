ItemBox = Object:extend()

local border = {
    square = 0,
    diamond = 2,
    hexagon = 3
}

local rarity = {
    common = 1,
    uncommon = 2,
    rare = 3,
    very_rare = 4,
    ultra_rare = 5
}

local rarity_colors = {
    { r = 63/255,  g = 47/255,  b = 34/255,  a = 1 }, -- brown: 63, 47, 34
    { r = 160/255, g = 135/255, b = 48/255,  a = 1 }, -- yellow: 160, 135, 48
    { r = 41/255,  g = 112/255, b = 38/255,  a = 1 }, -- green: 41, 112, 38
    { r = 100/255, g = 47/255,  b = 121/255, a = 1 }, -- purple: 100, 47, 121
    { r = 143/255, g = 8/255,   b = 48/255,  a = 1 }  -- red: 143, 8, 48
}

local contents = {
    { -- Items
        { border.square, 0, 2, { rarity.common, rarity.uncommon, rarity.rare, rarity.very_rare }, },
        { border.square, 0, 3, { rarity.rare, rarity.very_rare, rarity.ultra_rare }, },
        { border.square, 0, 4, { rarity.very_rare, rarity.ultra_rare }, },
        { border.square, 0, 5, { rarity.common, rarity.uncommon, rarity.rare, rarity.very_rare }, }
    },
    { -- Add-ons
        { border.square, 1, 2, { rarity.uncommon }, },
        { border.square, 1, 3, { rarity.uncommon }, },
        { border.square, 1, 4, { rarity.common }, },
        { border.square, 1, 5, { rarity.common }, }
    },
    { -- Perks
        { border.diamond, 2, 2, { rarity.uncommon, rarity.rare, rarity.very_rare }, },
        { border.diamond, 3, 3, { rarity.uncommon, rarity.rare, rarity.very_rare }, },
        { border.diamond, 2, 4, { rarity.uncommon, rarity.rare, rarity.very_rare }, },
        { border.diamond, 2, 5, { rarity.uncommon, rarity.rare, rarity.very_rare }, }
    },
    { -- Offerings
        { border.hexagon, 3, 2, { rarity.uncommon }, },
        { border.hexagon, 3, 3, { rarity.uncommon }, },
        { border.hexagon, 3, 4, { rarity.uncommon, rarity.rare }, },
        { border.hexagon, 3, 5, { rarity.common, rarity.uncommon, rarity.rare }, }
    }
}

function ItemBox:new(x, y)
    self.position = Vector(x, y)

    self.type = util.randomChoice(contents)
    self.item = util.randomChoice(self.type)

    self.image = love.graphics.newImage("assets/imgs/items.png")
    self.image:setFilter("nearest", "nearest")

    self.rarity = util.randomChoice(util.shuffle(self.item[4]))

    local width, height = self.image:getWidth(), self.image:getHeight()

    self.offset = Vector(16, 16)
    self.color = rarity_colors[self.rarity]
    self.border = love.graphics.newQuad(32 * self.item[1], 32, 32, 32, width, height)
    self.background = love.graphics.newQuad(32 * self.item[1], 0, 32, 32, width, height)
    self.icon = love.graphics.newQuad(32 * self.item[2], 32 * self.item[3], 32, 32, width, height)
end

function ItemBox:draw()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a)
    love.graphics.draw(self.image, self.background, self.position.x - self.offset.x, self.position.y - self.offset.y)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.image, self.border, self.position.x - self.offset.x, self.position.y - self.offset.y)
    love.graphics.draw(self.image, self.icon, self.position.x - self.offset.x, self.position.y - self.offset.y)
end