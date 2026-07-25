return {
    seam_begin = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        local ralsei = cutscene:getCharacter("ralsei")
        local seam = cutscene:spawnNPC("seam", 520, 350)

        cutscene:detachFollowers()

        kris:moveTo(520, 920)
        kris:setFacing("up")
        susie:moveTo(572, 980)
        susie:setFacing("up")
        ralsei:moveTo(468, 980)
        ralsei:setFacing("up")

        cutscene:walkTo("kris", 520, 630, 5, "up")
        cutscene:walkTo("susie", 572, 690, 5, "up")
        cutscene:wait(cutscene:walkTo("ralsei", 468, 690, 5, "up"))

        cutscene:wait(1.5)
        cutscene:detachCamera()
        --cutscene:walkTo("seam", 520, 430, 2.5)
        --cutscene:wait(cutscene:panTo(520, 500, 3))


        cutscene:wait(1)
        cutscene:setSpeaker("seam")
        cutscene:wait(cutscene:text("[style:dark]* The tale foretold by the prophecy.", nil, nil, {["top"] = false}))
        cutscene:wait(cutscene:text("[style:dark][speed:0.2]* DELTARUNE.", nil, nil, {["top"] = false}))
        cutscene:wait(cutscene:text("[style:dark]* What makes you think you can stand against it...?", nil, nil, {["top"] = false}))
        cutscene:wait(cutscene:text("[style:dark]* Is it blind hope?[wait:15] Is it your dream...?", nil, nil, {["top"] = false}))
        cutscene:wait(cutscene:text("[style:dark]* Ha ha ha...[wait:30] does it matter?", nil, nil, {["top"] = false}))
        
        -- local battle_music = Music()
        -- battle_music:play("the_path", 0)
        -- battle_music:fade(1, 20)
        Game.music:fade(0, 10)

        --cutscene:panTo(520, 500, 3)
        
        cutscene:wait(2)
        cutscene:wait(cutscene:text("[style:dark][noskip]* No...[wait:30] once the path is chosen,[wait:30] there will be no retreat for you three.", nil, nil, {["top"] = false}))
        cutscene:wait(cutscene:text("[style:dark][noskip]* Kris.[wait:30]\n* Ralsei.[wait:30]\n* Susie.", nil, nil, {["top"] = false}))

        --cutscene:wait(cutscene:fadeOut(0.5))
        --cutscene:wait(cutscene:text("[noskip]* Seam equipped the [speed:0.25][sound:snd_item]PureCrystal."))
        
        cutscene:wait(1)
        cutscene:wait(cutscene:fadeOut(1))
         -- this is where he turns the arena all cool
        
        cutscene:wait(0.5)

        Assets.playSound("snd_item")
        cutscene:wait(cutscene:text("[instant]* Seam equipped the PureCrystal."))
        cutscene:wait(0.5)
        
        --cutscene:walkTo("seam", 520, 430)
        seam:moveTo(520, 430)
        Game.world.camera:setPosition(520, 300)

        cutscene:wait(cutscene:fadeIn(0.5))
        
        
        --cutscene:wait(cutscene:panTo(520, 300, 2))
        cutscene:wait(cutscene:text("[style:dark][noskip]* The time to meet your fate...", nil, nil, {["auto"] = true}))

        cutscene:wait(cutscene:fadeOut(0.25, {color = COLORS.white}))
        for _, layer in ipairs(Game.world.map.tile_layers) do
            layer:setColor(1, 153/255, 0)
        end
        local layer = Game.world.map:getImageLayer("background2")
        layer.visible = true
        Assets.playSound("snd_ghostappear")
        cutscene:wait(cutscene:fadeIn(0.25))

        cutscene:wait(cutscene:panTo(520, 500, 3))
        cutscene:wait(cutscene:text("[noskip]* ... is fast approaching.", nil, nil, {["top"] = false}))
        cutscene:wait(cutscene:text("[noskip]* Now, come take this crystal!", nil, nil, {["top"] = false}))
        cutscene:startEncounter("seam", true, seam)
    end
}