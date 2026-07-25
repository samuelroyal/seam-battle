local ShopkeeperSeam, super = Class(Actor, "shopkeeperseam")

function ShopkeeperSeam:init()
    super.init(self)

    -- The name of the actor
    self.name = "shopkeeperseam"

    self.width = 145
    self.height = 109

    self.path = "shopkeepers/seam"
    self.default = "talk"

    self.animations = {
        ["idle"] = {"idle", function(sprite, wait)
            while true do
                sprite:setFrame(1)
                wait(2)
                sprite:setFrame(2)
                wait(3/30)
                sprite:setFrame(3)
                wait(3/30)
                sprite:setFrame(2)
                wait(3/30)
            end
        end}
    }

    self.talk_sprites = {
        ["talk"] = 0.25,
        ["laugh"] = 0.25,
        ["impatient"] = 0.25,
    }
end

function ShopkeeperSeam:onTalkStart(text, sprite)
    --Kristal.Console:log("Start " .. sprite.sprite)
    if sprite.sprite ~= "talk" then
        sprite:setAnimation("talk")
    end
end

function ShopkeeperSeam:onTalkEnd(text, sprite)
    --Kristal.Console:log("End " .. sprite.sprite)
    if self.talk_sprites[sprite.sprite] then
        sprite:setAnimation("idle")
    else
        sprite:setSprite(sprite.sprite)
    end
end

return ShopkeeperSeam