function Mod:init()
    print("Loaded " .. self.info.name .. "!")
end

function Mod:postInit()
    Game:enterShop("seam_shop")
end

function Mod:draw()
    local p = Game.world and Game.world.player
    if p then
        love.graphics.print(("%d, %d"):format(p.x, p.y), 4, 4)
    end
end