ItemBox = Object:extend()

local rarity_colors = {
    { r = 63/255,  g = 47/255,  b = 34/255,  a = 1 }, -- brown: 63, 47, 34
    { r = 160/255, g = 135/255, b = 48/255,  a = 1 }, -- yellow: 160, 135, 48
    { r = 41/255,  g = 112/255, b = 38/255,  a = 1 }, -- green: 41, 112, 38
    { r = 100/255, g = 47/255,  b = 121/255, a = 1 }, -- purple: 100, 47, 121
    { r = 143/255, g = 8/255,   b = 48/255,  a = 1 }  -- red: 143, 8, 48
}

local contents = {
    {
        { '', 1, 2, { 2, 2, 2, 3, 3, 4 }, },
        { '', 1, 3, { 2, 2, 2, 3, 3, 4 }, },
        { '', 1, 1, { 2, 2, 2, 3, 3, 4 }, }
    },
    {
        { '', 0, 1, { 1, 1, 1, 1, 2, 2, 2, 3, 3, 4 }, },
        { '', 0, 2, { 3, 3, 3, 4, 4, 5 }, },
        { '', 0, 3, { 3, 3, 3, 4, 4, 5 }, }
    },
    {
        { '', 2, 1, { 2 }, },
        { '', 2, 2, { 2, 2, 3 }, },
        { '', 2, 3, { 1, 1, 1, 2, 2, 3 } }
    }
--[[
    perks = {
        saboteur = {
            text = '',
            border = 1,
            colors = { 2, 2, 2, 3, 3, 4 },
        },
        instinct = {
            text = '',
            border = 1,
            colors = { 2, 2, 2, 3, 3, 4 },
        },
        obsession = {
            text = '',
            border = 1,
            colors = { 2, 2, 2, 3, 3, 4 },
        }
    },
    addons = {
        rag = {
            text = '',
            border = 0,
            colors = { 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5 },
        },
        cord = {
            text = '',
            border = 0,
            colors = { 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5 },
        },
        token = {
            text = '',
            border = 0,
            colors = { 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5 },
        }
    },
    offerings = {
        cake = {
            text = '',
            border = 2,
            colors = { 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5 },
        },
        pouch = {
            text = '',
            border = 2,
            colors = { 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5 },
        },
        envelope = {
            text = '',
            border = 2,
            colors = { 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5 }
        }
    }
]]
}

function ItemBox:new(x, y)
    self.position = Vector(x, y)
    
    self.type = util.randomChoice(contents)
    self.item = util.randomChoice(self.type)
    
    self.image = love.graphics.newImage("assets/imgs/items.png")
    self.image:setFilter("nearest", "nearest")
    
    self.rarity = util.randomChoice(util.shuffle(self.item[4]))
    
    self.offset = Vector(16, 16)
    self.color = rarity_colors[self.rarity]
    self.background = love.graphics.newQuad(32 * self.item[2], 0, 32, 32, 96, 128)
    self.border = love.graphics.newQuad(32 * self.item[2], 32 * self.item[3], 32, 32, 96, 128)
end

function ItemBox:draw()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a)
    love.graphics.draw(self.image, self.background, self.position.x - self.offset.x, self.position.y - self.offset.y)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.image, self.border, self.position.x - self.offset.x, self.position.y - self.offset.y)
end