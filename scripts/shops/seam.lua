local SeamShop, super = Class(Shop, "seam_shop")

function SeamShop:init()
    super.init(self)

    self.background = "shops/bg_seam_shop"
    --self.shop_music = "shop1"
    -- self.pitched_shop_music = Music()
    -- self.pitched_shop_music:play("shop1", 1, 0.95)
    Game.music:play("shop1", 1, 0.95)

    self.shopkeeper:setActor("shopkeeperseam")

    self.menu_options = {
        {"Buy", "TRYBUY"},
        {"Sell", "TRYSELL"},
        {"Talk", "TALK"},
        {"Exit", "TRYEXIT"}
    }

    self.given_crystal = false

    self.currency_text = ""
    self.encounter_text = "[emote:talk]* Hee hee...[wait:15]\n* Welcome back, travellers."
    self.shop_text = "* (Seam stares at your pocket.)"
    self.leaving_text = "[emote:laugh]* See you soon."
end

function SeamShop:onStateChange(old, new)
    super.onStateChange(self, old, new)
    
    if new == "TALK" then
        if not self.given_crystal then
            self:startDialogue({
                "[emote:oh]* You recovered the final Shadow Crystal?!",
                "[emote:talk]* No,[wait:10] this was to be expected...[wait:15] after all, you three are the heroes of legend.",
                "[emote:talk]* I suppose you are wondering what must be done now...",
                "[emote:talk]* Well,[wait:15] with the power of the Shadow Crystals combined, a certain power can be drawn out...[wait:10] the same power that exists in each crystal.",
                "[emote:talk]* If what I think is true, Kris...[wait:20] you might just be able to overcome fate itself!",
                "[emote:laugh]* Ha ha ha...[wait:25] it's almost impossible for someone like me to believe!",
                "[emote:talk]* Give it here,[wait:10] Kris.[wait:15] Then,[wait:15] meet me in front of the castle."
            }, function()
                Assets.playSound("snd_item", 1.5)
            end)
            self.given_crystal = true
            self.shop_text = "* (You thought you saw something reflect off Seam's eye.)"
            self.menu_options[4] = {"Exit", "LEAVE"}
        else
            self:startDialogue("[emote:talk]* Kris,[wait:15] meet me in front of the castle.")
        end
    elseif new == "TRYBUY" or new == "TRYSELL" then
        self:startDialogue({
            "[emote:laugh]* Kris!\n[wait:25]* You know someone of your strength has no business at this old shop.",
            "[emote:impatient]* Unlike you three,[wait:15] I'll remain here until the end of the world."
        })
    elseif new == "TRYEXIT" then
        self:startDialogue("[emote:talk]* Going nowhere,[wait:10] Kris?")
    elseif new == "LEAVING" then
        Game.world:loadMap("castle_front")
        --self.pitched_shop_music:fade(0, 0.5)
    else        
        Kristal.Console:log(old .. " " .. new)
    end
end

return SeamShop