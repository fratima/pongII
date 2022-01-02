
local rakets = {}

rakets.listOfRakets = {} -- have to do this otherwise there is a mix of functions and ball-elements in balls

function rakets.create(xPos,yPos,width, height,color)
  raket = {}
  raket.xPos = xPos
  raket.yPos = yPos
  raket.width = width
  raket.height = height
  raket.color = color
  --raket.orientation = 

  table.insert(rakets.listOfRakets,raket)
end

function rakets.draw()
    for _,raket in pairs(rakets.listOfRakets) do
        love.graphics.setColor(raket.color) --set the drawing color to red for the ball
        love.graphics.rectangle("fill", raket.xPos, raket.yPos,raket.width,raket.height)
    end
end


function rakets.update(dt)
  rakets.kybControl()
end

function rakets.kybControl()
  for _,raket in pairs(rakets.listOfRakets) do
    if love.keyboard.isDown("up")     then raket.yPos = raket.yPos -5 end
    if love.keyboard.isDown("down")   then raket.yPos = raket.yPos +5 end
  end
end

return rakets