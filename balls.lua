

local balls = {}
balls.listOfBalls = {} -- have to do this otherwise there is a mix of functions and ball-elements in balls

function balls.create(xPos,yPos,radius,color)
  ball = {}
  ball.xPos = xPos
  ball.yPos = yPos
  ball.radius = radius
  ball.color = color
  ball.xSpeed = love.math.random(-300,300)
  ball.ySpeed = love.math.random(-100,100)

  table.insert(balls.listOfBalls,ball)
end

function balls.update(dt, rakets)
  for _,ball in pairs(balls.listOfBalls) do
    ball.xPos = ball.xPos + ball.xSpeed * dt
    ball.yPos = ball.yPos + ball.ySpeed * dt
    balls.hitAnything(ball, rakets)

    if ball.xPos < 0 or ball.xPos > love.graphics.getWidth() then
      return false
    end
  end
  return true
end

function balls.hitAnything(ball, rakets)
  balls.hitWalls(ball)
  balls.hitRaket(ball, rakets)
end


function balls.hitWalls(ball)
  if (ball.yPos-ball.radius) < 0 then
    ball.yPos = ball.yPos + 3
    ball.ySpeed = ball.ySpeed * -1
  end 
  if (ball.yPos+ball.radius) > love.graphics.getHeight( ) then
    ball.yPos = ball.yPos - 3
    ball.ySpeed = ball.ySpeed * -1
  end
end

function balls.hitRaket(ball, rakets)
  for _,raket in pairs(rakets.listOfRakets) do
    if  (ball.xPos-ball.radius <= raket.xPos+raket.width and ball.xPos+ball.radius >= raket.xPos) 
        and 
        (ball.yPos+ball.radius >= raket.yPos and ball.yPos-ball.radius <= raket.yPos + raket.height) then
      ball.xSpeed = ball.xSpeed * -1  
      ball.ySpeed = ( ball.yPos - raket.height ) 
    end
  end
end

function balls.draw()
    for _,ball in pairs(balls.listOfBalls) do
        love.graphics.setColor(ball.color) --set the drawing color to red for the ball
        love.graphics.circle("fill", ball.xPos, ball.yPos, ball.radius)
    end
end

return balls