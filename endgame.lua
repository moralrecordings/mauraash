-- Goes without saying, but this file is nothing but spoilers for the game.

local vars = PTVars()

life_stand_img = PTImageSequence("assets/endgame/life%d.png", 1, 4, 46, 93)
life_stand_cycle = {1, 3, 2, 4, 3, 2, 3, 1, 3, 4, 1, 3, 1, 3, 2, 1, 3, 2, 1, 2}
life_stand_seq = {}
for k, v in ipairs(life_stand_cycle) do
    table.insert(life_stand_seq, life_stand_img[v])
end
life_stand = PTSprite({PTAnimation("default", life_stand_seq, 2)}, 460, 150, -1)
life_stand.hotspot_id = "lifeform"
life_stand.name = "lifeform"
life_stand.facing = 90
PTSpriteSetAnimation(life_stand, "default")

spit_img = PTImage("assets/endgame/spit.png", 0, 0)
spithole_bg = PTBackground(PTImage("assets/endgame/spithole.png", 40, 4), 460, 150, -3)
spithole_bg.name = "sizzling holes in the deck"
spithole_bg.hotspot_id = "sizzling holes in the deck"
spithole_bg.collision = false
spithole_bg.visible = false
spithole_bg.facing = 90

puddle_bg = PTBackground(PTImage("assets/endgame/puddle.png", 30, 4), 460, 150, -2) 
puddle_bg.name = "incriminating puddles of heavy water"
puddle_bg.hotspot_id = "incriminating puddles of heavy water"
puddle_bg.collision = false
puddle_bg.visible = false
puddle_bg.facing = 90

PTRoomAddObject(bridge_room, life_stand)
PTRoomAddObject(bridge_room, spithole_bg)
PTRoomAddObject(bridge_room, puddle_bg)

GenerateSpit = function ()
    while true do
        local spit = PTBackground(spit_img, life_stand.x - 33, life_stand.y - 60, -1)
        PTRoomAddObject(bridge_room, spit)
        PTMoveObjectRelative(spit, 0, 60, 400, "ease-in")
        PTWaitForMoveObject(spit)
        PTRoomRemoveObject(bridge_room, spit)
        PTSleep(math.random(3000, 5000))
    end
end

UpdateEndgameBlock = function ()
    -- during endgame, disable certain hotspots
    bridge_coffee_bg.collision = not vars.lifeform_enabled
    bridge_sink_bg.collision = not vars.lifeform_enabled
    bridge_kdoorc_bg.collision = not vars.lifeform_enabled
    bridge_tocabin_bg.collision = not vars.lifeform_enabled
    bridge_toreact_bg.collision = not vars.lifeform_enabled
    if vars.lifeform_enabled then
        PTRoomSetWalkBoxes(bridge_room, wb_bridge)
    end
    life_stand.visible = vars.lifeform_enabled
    life_stand.collision = vars.lifeform_enabled
    spithole_bg.collision = vars.lifeform_enabled
    spithole_bg.visible = vars.lifeform_enabled
    puddle_bg.collision = vars.lifeform_enabled
    puddle_bg.visible = vars.lifeform_enabled
    if vars.lifeform_enabled then
        PTStartThread("GenerateSpit", GenerateSpit)
    end
end



vars.lifeform_enabled = false
penultimate_scene = function ()
    vars.music = "assets/intro.rad"
    PTRadLoad("assets/intro.rad")
    PTRadSetPosition(12, 0)
    PTRadPlay()
    local room = PTCurrentRoom()
    PTShakeObject(room, 500, PTSimplexShake(0, 1, 1000, 1000))
    PTSleep(500)
    PTActorSetWalk(ash, 154, 142, 270)
    PTShakeObject(room, 1000, PTSimplexShake(0, 3, 1000, 1000))
    PTSleep(1000)
    PTShakeObject(room, 1000, PTSimplexShake(1, 4, 1000, 1000))
    PTSleep(1000)
    vars.lifeform_enabled = true
    vars.ship_powered_up = true
    UpdateEndgameBlock()
    UpdateBridgePower()
    PTShakeObject(room, 1000, PTSimplexShake(2, 4, 1000, 1000))
    PTSleep(1000)
    PTShakeObject(room, 1000, PTSimplexShake(1, 4, 1000, 1000))
    PTSleep(1000)
    PTShakeObject(room, 1000, PTSimplexShake(0, 3, 1000, 1000))
    PTSleep(1000)
    PTShakeObject(room, 1000, PTSimplexShake(0, 1, 1000, 1000))
    PTSleep(1000)
    -- shake screen
    -- play engine start noise
    -- walk to controls, light them up, stop shaking
    PTActorSleep(ash, 1000)
    PTActorTalk(ash, "Finally. We're done.")
    PTActorSleep(ash, 1000)
    PTActorSetWalk(ash, 240, 144, 90)
    PTWaitForActor(ash)
    PTSetActorWaitAfterTalk(false)
    PTActorTalk(ash, "Oh ffffffffffffff", nil, nil, 5000)
    PTSleep(1000)
    room.camera_actor = nil
    local old_x, old_y = room.x, room.y
    PTMoveObjectRelative(room, 120, 0, 5000, "linear", false)
    PTSleep(1000)
    PTPCSpeakerPlayData(PCSPK_ROAR)
    PTWaitForMoveObject(room)
    PTSleep(2000)
    PTMoveObjectRelative(room, -120, 0, 3000, "linear", false)
    PTWaitForMoveObject(room)
    room.camera_actor = ash
    PTSetActorWaitAfterTalk(true)
    PTPCSpeakerStop()
end

PTOnVerb("look", "lifeform", function ()
    PTActorTalk(ash, "Oh look. Something else I don't need.")
end)


vars.lifeform_count = 0
PTOnVerb("use", "lifeform", function ()
    if vars.lifeform_count == 0 then 
        vars.lifeform_count = 1
        PTActorTalk(ash, "Right.")
        PTActorTalk(ash, "I'm tired, so I'll cut you some slack.")
        PTActorTalk(ash, "Leave.")
        PTActorTalk(ash, "Now.")
        PTSleep(2000)
        PTActorTalk(ash, "Slow learner.")
    elseif vars.lifeform_count == 1 then
        vars.lifeform_count = 2
        PTActorTalk(ash, "Last chance to walk out of here with all your teeth.")
        PTSleep(2000)
        PTActorTalk(ash, "Noted.")
    else
        PTActorTalk(ash, "Yeah we're done with diplomacy.")
    end
end)

PTOnVerb2("use", "lucky wrench", "lifeform", function()
    PTActorSetAnimation(ash, "wrench_out", 90)
    PTSleep(1300) 
    end_scene()
end)


PTOnVerb2("use", "fabric tape", "lifeform", function()
    PTActorTalk(ash, "What am I, a kidnapper now?")
    PTActorTalk(ash, "This is clearly the wrong kind of tape. A child could break it!")
end)

PTOnVerb2("use", "roll of plastic", "lifeform", function()
    PTActorTalk(ash, "That would take far too long.")
end)

PTOnVerb2("use", "stein", "lifeform", function()
    PTActorTalk(ash, "Maybe if it was something heavy that I wasn't sentimental about.")
end)

PTOnVerb2("use", "cress", "lifeform", function()
    -- Shouldn't have this
end)



PTOnVerb("look", "incriminating puddles of heavy water", function ()
    PTActorTalk(ash, "I knew it! Not my fault!!!")
end)

PTOnVerb("use", "incriminating puddles of heavy water", function ()
    PTActorTalk(ash, "It'll evaporate. Not important right now.")
end)

PTOnVerb2("use", "lucky wrench", "incriminating puddles of heavy water", function()
    PTActorTalk(ash, "The chrome might get pitted.")
end)

PTOnVerb2("use", "fabric tape", "incriminating puddles of heavy water", function()
    PTActorTalk(ash, "I don't need soggy tape. Nobody does.")
end)

PTOnVerb2("use", "roll of plastic", "incriminating puddles of heavy water", function()
    PTActorTalk(ash, "It's clean, it's from the barrels.")
end)

PTOnVerb2("use", "stein", "incriminating puddles of heavy water", function()
    PTActorTalk(ash, "Too shallow. Don't care.")
end)

PTOnVerb2("use", "cress", "incriminating puddles of heavy water", function()
    -- Shouldn't have this
end)


PTOnVerb("look", "sizzling holes in the deck", function ()
    PTActorTalk(ash, "Wonderful. I get to spend my weekend patching spit holes.")
end)

PTOnVerb("use", "sizzling holes in the deck", function ()
    PTActorTalk(ash, "Oh I'll be cleaning something else off the deck in a minute.")
end)

PTOnVerb2("use", "lucky wrench", "sizzling holes in the deck", function()
    PTActorTalk(ash, "Right tool, wrong focus.")
end)

PTOnVerb2("use", "fabric tape", "sizzling holes in the deck", function()
    PTActorTalk(ash, "Why? I'd have to pick it off tomorrow.")
end)

PTOnVerb2("use", "roll of plastic", "sizzling holes in the deck", function()
    PTActorTalk(ash, "How about I don't touch it for now.")
end)

PTOnVerb2("use", "stein", "sizzling holes in the deck", function()
    PTActorTalk(ash, "The spit might eat away the fine glaze.")
end)

PTOnVerb2("use", "cress", "sizzling holes in the deck", function()
    -- Shouldn't have this
end)





