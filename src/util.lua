local _randomChoice = function(t) return t[math.random(#t)] end
local _dist = function(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end
local _angle = function(a, b) return math.acos(a * b / (a.length * b.length)) end
local _pointInCircle = function(x, y, circle) return _dist(x,y, circle.x, circle.y) <= circle.radius end
local _determineDirection = function() return Vector(_randomChoice({ 1, -1 }), _randomChoice({ 1, -1 })) end
local _lookAt = function(to, from, center)
    local _to = (center - to).normalized;
    local _down = (center - from).normalized;

    local angle = _angle(_to, _down);
    
    -- Reverse if center is higher than center
    if center.x < from.x then
        angle = math.rad(360) - angle;
    end

    return angle;
end
return {
    dist = _dist,
    angle = _angle,
    lookAt = _lookAt,
    randomChoice = _randomChoice,
    pointInCircle =_pointInCircle,
    determineDirection = _determineDirection
}