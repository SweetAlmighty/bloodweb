function love.conf(t)
    t.version = "11.3"                  -- The LÖVE version this game was made for (string)
    t.console = false                   -- Attach a console (boolean, Windows only)
    t.window.title = "Bloodweb"         -- The window title (string)
    t.window.width = 640                -- The window width (number)
    t.window.height = 360               -- The window height (number)
    t.window.resizable = false
    t.modules.touch = false
    t.modules.video = false
    t.modules.mouse = false
    t.modules.thread = false
    t.modules.physics = false
    t.modules.joystick = false
    t.accelerometerjoystick = false
end