function love.conf(t)
    t.version = "11.3"
    t.console = false

    t.window.title = "Bloodweb"
    t.window.width = 640 
    t.window.height = 360
    t.window.resizable = false
    t.window.icon = "assets/imgs/icon.png"

    t.modules.touch = false
    t.modules.video = false
    t.modules.mouse = false
    t.modules.thread = false
    t.modules.physics = false
    t.modules.joystick = false
    t.accelerometerjoystick = false
end	