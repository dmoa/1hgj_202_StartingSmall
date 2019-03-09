function love.load()
    require("Drop")
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    growthimgs = {}
    for i = 1, 10 do
        table.insert(growthimgs, love.graphics.newImage(i..".png"))
    end
    currentImg = 1

    imgtext = {"seed", "grass", "greenery", "plants!", "splits", "branches", "?", "!", "?!!?!?", "sans"}

    rain = {}

    for i = 1, 20 do
        table.insert(rain, Drop.new())
    end
    growth = 0

    music = love.audio.newSource("music.mp3", "stream")
    music:setLooping(true)
    music:play()
end

function love.draw()
    love.graphics.draw(growthimgs[currentImg], 0, 0, 0, 4, 4)
    love.graphics.printf(imgtext[currentImg], 128, 128, 100)
    for k, drop in ipairs(rain) do
        drop.draw()
    end
end

function love.update(dt)
    for k, drop in ipairs(rain) do
        drop.update(dt)
    end
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
end

function love.mousepressed(x, y)
    for k, drop in ipairs(rain) do
        drop.mouseUpdate(x, y)
    end
end
