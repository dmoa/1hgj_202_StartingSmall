Drop = {}

Drop.new = function()
    local self = {}

    self.x = love.math.random(128, 512)
    self.y = love.math.random(100) * - 1
    self.yv = love.math.random(200, 400)

    self.draw = function()
        love.graphics.rectangle("fill", self.x, self.y, 5, 30)
    end

    self.update = function(dt)
        self.y = self.y + self.yv * dt
        if self.y > 256 then
            self.y = love.math.random(100) * - 1
            self.x = love.math.random(128, 512)
            self.yv = love.math.random(200, 400)
        end
    end

    self.mouseUpdate = function(x, y)
        if x > self.x and x < self.x + 5 and y > self.y and y < self.y + 30 then
            self.y = love.math.random(100) * - 1
            self.x = love.math.random(128, 512)
            growth = growth + 1
            if not sans then
                if growth == 27 then
                    music:stop()
                    sans = love.audio.newSource("oof.mp3", "static")
                    currentImg = currentImg + 1
                    sans:setLooping(true)
                    sans:play()
                elseif growth % 3 == 0 then
                    if currentImg < 10 then
                        currentImg = currentImg + 1
                    end
                end
            end

        end
    end

    return self
end
