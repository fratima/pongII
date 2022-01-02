-- the most simple pong game

balls = require "balls"
rakets = require "rakets"

function love.load()
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    GameOverPic = love.graphics.newImage("GameOver.png")
     
    love.graphics.setBackgroundColor( 0, 0, 0)
    
   rakets.create(10,50,20,100,{1,1,1})
   rakets.create(750,50,20,100,{1,1,1})
    
    ballColor = {1, 1, 1}
    balls.create(200, 100, 10, ballColor)
end   


function love.update(dt)
    balls.update(dt, rakets)
    rakets.update(dt)
end


function love.draw()
   balls.draw()
   rakets.draw()
end

function love.keypressed(key)
    if key == "escape" then os.exit() end
end