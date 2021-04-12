util = require('src/util')
Object = require('library/classic')
Vector = require('library/brinevector')
local lovesize = require("library/lovesize")

require('src/menu')
require('src/bloodweb')

local screen_width = 640
local screen_height = 360

function love.draw()
    love.graphics.clear(0.5, 0.5, 0.5, 1)
    lovesize.begin()
        bloodweb:draw()
        menu:draw()
    lovesize.finish()
end

function love.load(args)
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    math.randomseed(os.time() + tonumber(tostring({}):sub(8)))
    lovesize.set(screen_width, screen_height)
    bloodweb = Bloodweb()
    menu = Menu()
end

function love.mousepressed(x, y, button)
    if lovesize.inside(x, y) then
        x, y = lovesize.pos(x, y)
        bloodweb:mouse_down(x, y)
    end
end

function love.update(dt) bloodweb:update(dt) end

-- x, y, dx, dy, istouch
function love.mousemoved() end

-- x, y, button
function love.mousereleased(_, _, button) bloodweb:mouse_up() end

function love.resize(width, height) lovesize.resize(width, height) end