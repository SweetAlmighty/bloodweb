return {
    new = function()
        local edges = { }
        local circle = animation.new('circle');

        local _circle = {
            x = 0,
            y = 0,
            radius = 32
        }

        return {
            AddEdge = function(edge)
                edges[#edges+1] = edge;
            end,
            Draw = function(x, y)
                circle.Draw(x, y);
                _circle.x = x;
                _circle.y = y;
            end,
            Update = function(dt)
                circle.Update(dt);
            end,
            MouseDown = function(x, y)
                if util.pointInCircle(x, y, _circle) then
                    circle.Progress();
                end
            end,
            MouseUp = function()
                circle.Regress();
            end
        }
    end
}