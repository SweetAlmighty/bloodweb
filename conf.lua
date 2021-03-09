function love.conf(t)
    t.version = "11.3"                  -- The LÖVE version this game was made for (string)
    t.console = false                   -- Attach a console (boolean, Windows only)

    t.window.title = "Bloodweb"         -- The window title (string)
    t.window.width = 400                -- The window width (number)
    t.window.height = 400               -- The window height (number)
    t.window.resizable = true

    t.modules.audio = false              -- Enable the audio module (boolean)
    t.modules.joystick = false           -- Enable the joystick module (boolean)
    t.modules.physics = false            -- Enable the physics module (boolean)
    t.modules.sound = false              -- Enable the sound module (boolean)
    t.modules.thread = false             -- Enable the thread module (boolean)
    t.modules.touch = false              -- Enable the touch module (boolean)
    t.modules.video = false              -- Enable the video module (boolean)
end