Object = require('library/classic');
Vector = require('library/brinevector');
require('src/bloodweb');
local lovesize = require("library/lovesize");

local screen_width = 400;
local screen_height = 400;

function love.draw()
    lovesize.begin();
        web:draw();
    lovesize.finish();
end

function love.load(args)
    math.randomseed(os.time() + tonumber(tostring({}):sub(8)));
    lovesize.set(screen_width, screen_height);
    web = Bloodweb();
end

function love.mousepressed(x, y, button)
    if lovesize.inside(x, y) then
        local _x, _y = lovesize.pos(x, y)
        web:mouse_down(_x, _y);
    end
end

function love.update(dt) web:update(dt); end

function love.mousemoved(x, y, dx, dy, istouch) end

function love.mousereleased(x, y, button) web:mouse_up(); end

function love.resize(width, height) lovesize.resize(width, height) end