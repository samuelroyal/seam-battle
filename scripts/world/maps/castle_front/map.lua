local map, super = Class(Map)

function map:onEnter()
    local kris = Game.world:getCharacter("kris")
    local susie = Game.world:getCharacter("susie")
    local ralsei = Game.world:getCharacter("ralsei")

    Kristal.Console:log("Entered castle_front")

    Kristal.Console:log(kris.x .. " " .. kris.y)

    Game.world:startCutscene("castle_front.seam_begin")

    -- local tint = MapTint({0, 230/255, 0}, 0.5)
    -- tint.layer = self.depths["tint"]
    -- self.world:addChild(tint)
    local layer = self:getImageLayer("background2")
    if layer then
        layer.visible = false
    end
    
    for i,v in pairs(self.layers) do
        Kristal.Console:log(i)
        Kristal.Console:log(v)
    end
end

return map