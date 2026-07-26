local Seam, super = Class(Encounter)

function Seam:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* It was inverted."

    -- Battle music ("battle" is rude buster)
    self.music = "the_path"
    -- Enables the purple grid battle background
    self.background = false

    -- Add the Seam enemy to the encounter
    self:addEnemy("seam", 500, 200)
end

function Seam:createSoul(x, y, color)
    return AquaSoul()
end

return Seam
