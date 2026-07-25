return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    soul_change = function(cutscene, battler, enemy)
        --local seam = cutscene:getCharacter("seam")
        
        cutscene:battlerText("seam", "Do you have the patience to wait your turn?")
    end
}