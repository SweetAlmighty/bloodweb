Vector = require('library/brinevector')
local bloodweb = require('src/bloodweb')
local lovesize = require("library/lovesize")

local screen_width = 400;
local screen_height = 400;

function love.draw()
    lovesize.begin();
        web.Draw();
    lovesize.finish();
end

function love.load(args)
    math.randomseed(os.time() + tonumber(tostring({}):sub(8)));
    lovesize.set(screen_width, screen_height);
    web = bloodweb.new();
end

function love.mousepressed(x, y, button)
    if lovesize.inside(x, y) then
        local _x, _y = lovesize.pos(x, y)
        web.MouseDown(_x, _y);
    end
end

function love.update(dt) web.Update(dt); end

function love.mousemoved(x, y, dx, dy, istouch) end

function love.mousereleased(x, y, button) web.MouseUp(); end

function love.resize(width, height) lovesize.resize(width, height) end