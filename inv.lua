vars = PTVars()

PTOnVerb("look", "lucky wrench", function ()
    PTActorTalk(ash, "It's my lucky Schloss aviation torque wrench.");
    PTActorTalk(ash, "Perfect for scrapping.");
end)
PTOnVerb("use", "lucky wrench", function()
    SetCurrentInv("lucky wrench")
end)

PTOnVerb("look", "fabric tape", function ()
    PTActorTalk(ash, "A roll of Maura's \"Climb With Pride\" sports tape.");
end)
PTOnVerb("use", "fabric tape", function()
    SetCurrentInv("fabric tape")
end)

PTOnVerb("look", "roll of plastic", function ()
    PTActorTalk(ash, "It's for lab work, but we use it for heating things in the microwave.");
end)
PTOnVerb("use", "roll of plastic", function()
    SetCurrentInv("roll of plastic")
end)


PTOnVerb("look", "stein", function ()
    if vars.stein_state == "water" then
        PTActorTalk(ash, "A mysterious clear fluid. Allegedly drinkable.");
    elseif vars.stein_state == "coffee" then
        PTActorTalk(ash, "The lifeblood of a working ship.")
    elseif vars.stein_state == "sludge" then
        PTActorTalk(ash, "It's full of Moccona-flavoured asphalt.")
    elseif vars.stein_state == "cress" then
        PTActorTalk(ash, "I think you're supposed to blend it first, but whatever.")
    elseif vars.stein_state == "weevils" then
        PTActorTalk(ash, "They're having a big ol' cress party in there. Those fools.")
    else
        PTActorTalk(ash, "It has a flip lid to stop things falling in your beverage.");
    end
end)
PTOnVerb("use", "stein", function()
    SetCurrentInv("stein")
end)

PTOnVerb("look", "cress", function ()
    PTActorTalk(ash, "The leaves taste pretty damn good after weeks of instant food.")
end)
PTOnVerb("use", "cress", function()
    SetCurrentInv("cress")
end)



PTOnVerb2("use", "lucky wrench", "fabric tape", function ()
    PTActorTalk(ash, "The grip is still good. Francesca doesn't need tape.")
end)

PTOnVerb2("use", "lucky wrench", "roll of plastic", function ()
    PTActorTalk(ash, "Adding plastic would make it harder to wrench things.")
end)

PTOnVerb2("use", "lucky wrench", "stein", function ()
    PTActorTalk(ash, "Donk.");
end)

PTOnVerb2("use", "lucky wrench", "cress", function ()
    PTActorTalk(ash, "The cress did nothing wrong.")
end)


PTOnVerb2("use", "fabric tape", "roll of plastic", function ()
    PTActorTalk(ash, "I would never get them unstuck.");
end)

PTOnVerb2("use", "fabric tape", "stein", function ()
    PTActorTalk(ash, "Maura would make my life hell with \"getting plastered\" jokes.");
end)

PTOnVerb2("use", "fabric tape", "cress", function ()
    PTActorTalk(ash, "This is just grasping. C'mon.")
end)


PTOnVerb2("use", "roll of plastic", "stein", function ()
    PTActorTalk(ash, "Why cover the stein when it has a perfectly good lid?");
end)

PTOnVerb2("use", "roll of plastic", "cress", function ()
    PTActorTalk(ash, "I intend to use the cress before it goes off.");
end)

CressInStein = function ()
    PTActorTalk(ash, "There. Now the cress is safe from my enemies.");
    vars.stein_state = "cress"
    SetCurrentInv(nil)
    RemoveInv("cress")
    UpdateInvView()
end

PTOnVerb2("use", "stein", "cress", function ()
    if vars.stein_state == "empty" then
        CressInStein()
    elseif vars.stein_state == "water" or vars.stein_state == "coffee" or vars.stein_state == "sludge" then 
        PTActorTalk(ash, "I would, but there's all this damn liquid in here taking up space.")
    end
end)


