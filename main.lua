util = require('src/util')
Object = require('lib/classic/classic')
Vector = require('lib/brinevector/brinevector')
local lovesize = require("lib/lovesize/lovesize")

require('src/bloodweb')
require('src/background')

screen_width = 640
screen_height = 360

function love.draw()
    love.graphics.clear(0.5, 0.5, 0.5, 1)
    lovesize.begin()
        bloodweb:draw()
        background:draw()
    lovesize.finish()
end

function love.load(args)
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    math.randomseed(os.time() + tonumber(tostring({}):sub(8)))
    lovesize.set(screen_width, screen_height)
    bloodweb = Bloodweb()
    background = Background()
end

function love.mousepressed(x, y, button)
    if lovesize.inside(x, y) then
        x, y = lovesize.pos(x, y)
        bloodweb:mouse_down(x, y)
    end
end

function love.update(dt)
    bloodweb:update(dt)
    background:update(dt)
end

-- x, y, dx, dy, istouch
function love.mousemoved() end

-- x, y, button
function love.mousereleased(_, _, button) bloodweb:mouse_up() end

function love.resize(width, height) lovesize.resize(width, height) end