local MapTint, super = Class(Object)

function MapTint:init(color, alpha)
    super.init(self, 0, 0)
    self.color = color or {0, 0, 0.6}
    self.alpha = alpha or 0.4
    self.debug_select = false -- keep it out of the world tool
end

function MapTint:draw()
    local map = Game.world.map
    local w = map.width  * map.tile_width
    local h = map.height * map.tile_height

    Draw.setColor(self.color[1], self.color[2], self.color[3], self.alpha)
    love.graphics.rectangle("fill", 0, 0, w, h)

    super.draw(self)
end

return MapTint