---@class AquaSoul : Soul
local AquaSoul, super = Class(Soul)

function AquaSoul:init(x, y, color)
    super.init(self, x, y, color)

    self.color = { 0, 1, 1 }

    self.graze_sprite.texture = Assets.getTexture("player/graze_flipped")
    self.sprite.texture = Assets.getTexture("player/heart_dodge_flipped")
end


return AquaSoul