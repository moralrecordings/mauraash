local vars = PTVars()

react_room = PTRoom("react", 480, 200)
PTAddRoom(react_room)

react_room_bg = PTBackground(PTImage("assets/react/room.png", 240, 174), 240, 174, -5)

react_barrels_bg = PTBackground(PTImage("assets/react/barrels.png", 44, 115), 391, 125, -2)
react_barrels_bg.collision = true
react_barrels_bg.name = "spare barrels of heavy water"
react_barrels_bg.hotspot_id = "spare barrels of heavy water"

react_filler_bg = PTBackground(PTImage("assets/react/filler.png", 34, 25), 128, 100, -3)
react_filler_bg.collision = true
react_filler_bg.name = "heavy water filler pipe"
react_filler_bg.hotspot_id = "heavy water filler pipe"
react_filler_bg.facing = 0

react_filter_bg = PTBackground(PTImage("assets/react/filter.png", 32, 29), 309, 99, -5)
react_filter_bg.collision = true
react_filter_bg.name = "air filter"
react_filter_bg.hotspot_id = "air filter"
react_filter_bg.facing = 0

react_filth_sprite = PTSprite({
    PTAnimation("default", {PTImage("assets/react/filth.png", 31, 26)}),
    PTAnimation("clean", {
        PTImage("assets/react/filth1.png", 31, 26),
        PTImage("assets/react/filth2.png", 31, 26),
        PTImage("assets/react/filth3.png", 31, 26),
        PTImage("assets/react/filth4.png", 31, 26),
        PTImage("assets/react/filth5.png", 31, 26),
        PTImage("assets/react/filth6.png", 31, 26),
        PTImage("assets/react/filth7.png", 31, 26)
    }, 2, 0, false, false, false)
}, 310, 97, -4)
PTSpriteSetAnimation(react_filth_sprite, "default")

react_grating_bg = PTBackground(PTImage("assets/react/grating.png", 33, 31), 310, 101, -3)
react_grating_bg.collision = true
react_grating_bg.name = "grating"
react_grating_bg.hotspot_id = "filter grating"
react_grating_bg.facing = 0

react_leak_bg = PTBackground(PTImage("assets/react/leak.png", 3, 16), 449, 92, -3)

react_pipeplas_bg = PTBackground(PTImage("assets/react/pipeplas.png", 5, 23), 449, 95, -2)
react_pipeplas_bg.visible = false
react_pipetape_bg = PTBackground(PTImage("assets/react/pipetape.png", -10, 26), 434, 97, -1)
react_pipetape_bg.visible = false
react_pipetape_bg.collision = true
react_pipetape_bg.name = "gaping hole in steam pipe"
react_pipetape_bg.hotspot_id = "steam pipe"
react_pipetape_bg.facing = 90


react_passage_bg = PTBackground(PTImage("assets/react/passage.png", 10, 98), 10, 125, -2)
react_passage_bg.collision = true
react_passage_bg.name = "bridge passage"
react_passage_bg.hotspot_id = "bridge passage"
react_passage_bg.facing = 270

react_reactor_bg = PTBackground(PTImage("assets/react/reactor.png", 30, 86), 192, 141, -4)
react_reactor_bg.collision = true
react_reactor_bg.name = "reactor"
react_reactor_bg.hotspot_id = "reactor"

react_sign_bg = PTBackground(PTImage("assets/react/sign.png", 16, 26), 64, 60, -2)
react_sign_bg.collision = true
react_sign_bg.name = "warning sign"
react_sign_bg.hotspot_id = "warning sign"

react_terminal_bg = PTBackground(PTImage("assets/react/terminal.png", 27, 49), 66, 113, -2)
react_terminal_bg.collision = true
react_terminal_bg.name = "control system"
react_terminal_bg.hotspot_id = "control system"
react_terminal_bg.facing = 0

react_weevils_group = PTGroup({
    PTBackground(img_weevil, 3, 5, 0),
    PTBackground(img_weevil, 5, 14, 0),
    PTBackground(img_weevil, 8, 4, 0),
    PTBackground(img_weevil, 7, 16, 0),
    PTBackground(img_weevil, 10, 6, 0),
    PTBackground(img_weevil, 11, 17, 0),
    PTBackground(img_weevil, 16, 5, 0),
    PTBackground(img_weevil, 17, 15, 0),
    PTBackground(img_weevil, 38, 5, 0),
    PTBackground(img_weevil, 40, 14, 0),
    PTBackground(img_weevil, 43, 4, 0),
    PTBackground(img_weevil, 42, 16, 0),
    PTBackground(img_weevil, 45, 6, 0),
    PTBackground(img_weevil, 46, 17, 0),
    PTBackground(img_weevil, 51, 5, 0),
    PTBackground(img_weevil, 52, 15, 0)
}, 280, 73, -3, 0, 0)
react_weevils_group.visible = false


PTRoomAddObject(react_room, react_room_bg)
PTRoomAddObject(react_room, react_barrels_bg)
PTRoomAddObject(react_room, react_filler_bg)
PTRoomAddObject(react_room, react_filter_bg)
PTRoomAddObject(react_room, react_filth_sprite)
PTRoomAddObject(react_room, react_grating_bg)
PTRoomAddObject(react_room, react_leak_bg)
PTRoomAddObject(react_room, react_passage_bg)
PTRoomAddObject(react_room, react_reactor_bg)
PTRoomAddObject(react_room, react_sign_bg)
PTRoomAddObject(react_room, react_terminal_bg)
PTRoomAddObject(react_room, react_pipeplas_bg)
PTRoomAddObject(react_room, react_pipetape_bg)
PTRoomAddObject(react_room, react_weevils_group)

PTRoomSetWalkBoxes(react_room, {
    PTWalkBox(PTPoint(8, 128), PTPoint(20, 117), PTPoint(20, 131), PTPoint(8, 131), 0),
    PTWalkBox(PTPoint(20, 117), PTPoint(110, 117), PTPoint(110, 131), PTPoint(20, 131), 0),
    PTWalkBox(PTPoint(110, 117), PTPoint(116, 127), PTPoint(116, 131), PTPoint(110, 131), 0),
    PTWalkBox(PTPoint(90, 131), PTPoint(116, 131), PTPoint(116, 151), PTPoint(103, 144), 0),
    PTWalkBox(PTPoint(116, 127), PTPoint(136, 140), PTPoint(136, 160), PTPoint(116, 151), 0),
    PTWalkBox(PTPoint(136, 140), PTPoint(164, 147), PTPoint(164, 165), PTPoint(136, 160), 0),
    PTWalkBox(PTPoint(164, 147), PTPoint(220, 147), PTPoint(220, 165), PTPoint(164, 165), 0),
    PTWalkBox(PTPoint(220, 147), PTPoint(248, 140), PTPoint(248, 160), PTPoint(220, 165), 0),
    PTWalkBox(PTPoint(248, 140), PTPoint(268, 127), PTPoint(268, 151), PTPoint(248, 160), 0),
    PTWalkBox(PTPoint(268, 127), PTPoint(274, 117), PTPoint(274, 131), PTPoint(268, 131), 0),
    PTWalkBox(PTPoint(268, 131), PTPoint(294, 131), PTPoint(280, 147), PTPoint(268, 151), 0),
    PTWalkBox(PTPoint(274, 112), PTPoint(344, 112), PTPoint(344, 131), PTPoint(274, 131), 0),
    PTWalkBox(PTPoint(344, 118), PTPoint(358, 125), PTPoint(358, 131), PTPoint(344, 131), 0),
    PTWalkBox(PTPoint(358, 125), PTPoint(442, 123), PTPoint(452, 131), PTPoint(358, 131), 0)
})

PTOnRoomEnter("react", function (first_time)
    react_room.camera_actor = ash
    react_room.x = ash.x
    react_room.y = ash.y
end)

PTOnRoomLoad("react", function ()
    print("react room load")
    if vars.steam_pipe_state == 1 then
        react_pipeplas_bg.visible = true
        react_pipetape_bg.name = "clingfilmed steam pipe"
    elseif vars.steam_pipe_state == 2 then
        react_pipetape_bg.name = "mummified steam pipe"
        react_pipetape_bg.visible = true
    end

    react_grating_bg.collision = not vars.opened_grating
    if vars.opened_grating then
        react_grating_bg.x = 310 + 64
        react_grating_bg.y = 101 + 8
    else
        react_grating_bg.x = 310
        react_grating_bg.y = 101
    end

    if not vars.cleaned_filter then
        react_filter_bg.name = "mass of caked hair"
    else
        react_filter_bg.name = "air filter"
    end
    react_filth_sprite.visible = not vars.cleaned_filter

    if vars.graphics_mode == 3 then
        SetGraphicsMode("cga", "react") 
    end
end)

LeaveReact = function ()
    PTActorSetRoom(ash, bridge_room, bridge_toreact_bg.x, bridge_toreact_bg.y)
    ash.facing = 0
    PTSwitchRoom("bridge")
end

PTOnVerb("use", "bridge passage", LeaveReact)
PTOnVerb2("use", "lucky wrench", "bridge passage", LeaveReact)
PTOnVerb2("use", "fabric tape", "bridge passage", LeaveReact)
PTOnVerb2("use", "roll of plastic", "bridge passage", LeaveReact)
PTOnVerb2("use", "stein", "bridge passage", LeaveReact)
PTOnVerb2("use", "cress", "bridge passage", LeaveReact)

------------------
-- reactor room --
------------------

vars.steam_pipe_state = 0;
vars.checked_reactor = false
vars.checked_barrels = false;
vars.reactor_filled = false;
vars.used_boring_water_on_reactor = false


-- reactor

PTOnVerb("look", "reactor", function ()
    PTActorTalk(ash, "Me and Maura scavenged this puppy from a corpo scoutship.")
    PTActorTalk(ash, "Worked great once we filled in all those claw marks.")
end)
PTOnVerb("use", "reactor", function ()
    PTActorTalk(ash, "There are no buttons or switches. It's all controlled remotely.")
end)
PTOnVerb2("use", "lucky wrench", "reactor", function ()
    PTActorTalk(ash, "It's one of those unibody cases that's glued shut.");
end)
PTOnVerb2("use", "fabric tape", "reactor", function ()
    PTActorTalk(ash, "Trust me, there's enough Bondo holding those panels in place.");
end)
PTOnVerb2("use", "roll of plastic", "reactor", function ()
    PTActorTalk(ash, "Pretty sure this stuff is useless against gamma radiation.")
end)
PTOnVerb2("use", "stein", "reactor", function ()
    PTActorTalk(ash, "My throwing arm isn't what it used to be.");
    PTActorTalk(ash, "Besides, that's what this ergonomic filler pipe is for.");
end)
PTOnVerb2("use", "cress", "reactor", function ()
    PTActorTalk(ash, "Pelting the reactor with cress will change nothing.")
end)



-- control system
PTOnVerb("look", "control system", function ()
    PTActorTalk(ash, "This little guy was salvaged from a chicken roasting plant.")
    PTActorTalk(ash, "Took a few board swaps, but now it monitors radiation of a different kind.");
end)
PTOnVerb("use", "control system", function ()
    if not vars.reactor_filled then
        PTActorTalk(ash, "The gauges say the reactor is out of heavy water.");
        PTActorTalk(ash, "Without that, we have no power or engines. So that's nice.");
        vars.checked_reactor = true
    else
        PTActorTalk(ash, "Incredible. Filling the reactor full of slop seems to have fixed it.");
    end
end)

PTOnVerb2("use", "lucky wrench", "control system", function ()
    PTActorTalk(ash, "The control system is doing a good job under difficult circumstances.")
end)
PTOnVerb2("use", "fabric tape", "control system", function ()
    PTActorTalk(ash, "This unit is minty fresh. No need for a taping just yet.");
end)
PTOnVerb2("use", "roll of plastic", "control system", function ()
    PTActorTalk(ash, "The unit doesn't smell that bad.")
    PTActorTalk(ash, "If anything it's one of the nicest smelling things on the ship.")
end)
PTOnVerb2("use", "stein", "control system", function ()
    if vars.stein_state == "water" or vars.stein_state == "coffee" or vars.stein_state == "sludge" then
        PTActorTalk(ash, "Would you believe, there's a better way of filling the reactor than dumping liquid on the keyboard.");
    elseif vars.stein_state == "weevils" then
        PTActorTalk(ash, "I really don't like our odds if the weevils start eating the control wires.");
    elseif vars.stein_state == "cress" then
        PTActorTalk(ash, "I am not a symbolist! Pouring cress onto the keyboard would be an empty gesture.")
    else
        PTActorTalk(ash, "The industrial designers didn't think of adding a cupholder. Those fools.")
    end
end)
PTOnVerb2("use", "cress", "control system", function ()
    PTActorTalk(ash, "My engineering instincts tell me that the control system doesn't need garnish.")
end)


vars.steam_pipe_state = 0
PTOnVerb("look", "steam pipe", function ()
    if vars.steam_pipe_state == 0 then
        PTActorTalk(ash, "A steam line for one of the ship's many heat exchangers.");
        PTActorTalk(ash, "The charred hole is new.");
    elseif vars.steam_pipe_state == 1 then
        PTActorTalk(ash, "The steam pipe is swathed in laboratory clingfilm.");
    elseif vars.steam_pipe_state == 2 then
        PTActorTalk(ash, "Trying not to think about how many kPa this repair would be rated for.");
    end
end)

PTOnVerb("use", "steam pipe", function ()
    if vars.steam_pipe_state == 0 then
        PTActorTalk(ash, "Oof. Yeah this will need to be patched up.");
    elseif vars.steam_pipe_state == 1 then
        PTActorTalk(ash, "This is a start, but it's too flimsy to hold pressure.");
    elseif vars.steam_pipe_state == 2 then
        PTActorTalk(ash, "It's perfect. Change nothing.");
    end
end)

PTOnVerb2("use", "lucky wrench", "steam pipe", function ()
    PTActorTalk(ash, "This is a welded pipe.")
end)
PTOnVerb2("use", "fabric tape", "steam pipe", function ()
    if vars.steam_pipe_state == 0 then
        PTActorTalk(ash, "Something tells me the climbing tape by itself would just melt.");
    elseif vars.steam_pipe_state == 1 then
        -- animation
        vars.steam_pipe_state = 2
        react_pipetape_bg.visible = true
        PTActorTalk(ash, "Practical -and- stylish.");
    elseif vars.steam_pipe_state == 2 then
        PTActorTalk(ash, "Don't worry! I wasn't stingy, it'll hold.");
    end
end)
PTOnVerb2("use", "roll of plastic", "steam pipe", function ()
    if vars.steam_pipe_state == 0 then
        react_pipeplas_bg.visible = true
        vars.steam_pipe_state = 1
        PTActorTalk(ash, "Sure, I guess this stuff can take the heat.")
    elseif vars.steam_pipe_state == 1 then 
        PTActorTalk(ash, "The plastic wrap won't hold pressure. Adding more doesn't fix that.") 
    else
        PTActorTalk(ash, "Adding more plastic wrap would look unprofessional.")
    end
end)
PTOnVerb2("use", "stein", "steam pipe", function()
    PTActorTalk(ash, "No, it's a *steam* pipe. Steam.")
end)
PTOnVerb2("use", "cress", "steam pipe", function ()
    PTActorTalk(ash, "I don't have time to make steamed cress right now.")
end)



-- heavy water filler pipe

PTOnVerb("look", "heavy water filler pipe", function ()
    PTActorTalk(ash, "A funnel I set up for filling the reactor from the catwalk.");
end)

PTOnVerb("use", "heavy water filler pipe", function()
    PTActorTalk(ash, "It's a funnel. Of the pouring variety.")
end)

PTOnVerb2("use", "lucky wrench", "heavy water filler pipe", function()
    PTActorTalk(ash, "The bolts are too far away.")
end)

PTOnVerb2("use", "fabric tape", "heavy water filler pipe", function()
    PTActorTalk(ash, "Why? It's not leaking anymore.")
end)

PTOnVerb2("use", "roll of plastic", "heavy water filler pipe", function()
    PTActorTalk(ash, "That'd be a fun prank, but I would be the one on the hook for decontaminating everything.")
end)

vars.used_boring_water_on_reactor = false
PTOnVerb2("use", "stein", "heavy water filler pipe", function ()
    if vars.reactor_filled then
        PTActorTalk(ash, "The reactor vessel is already full.")
    elseif vars.stein_state == "water" or vars.stein_state == "coffee" then
        PTPCSpeakerPlayData(PCSPK_POUR)
        PTActorSleep(ash, 2000)
        PTPCSpeakerStop()
        PTActorSetWalk(ash, react_terminal_bg.x, react_terminal_bg.y, 0)
        PTWaitForActor(ash)
        PTActorSleep(ash, 1000)
        if not vars.used_boring_water_on_reactor then
            PTActorTalk(ash, "Lousy safety cutoff.")
            PTActorTalk(ash, "Maybe I *want* to use boring water for a change.");
            vars.used_boring_water_on_reactor = true
        else
            PTActorTalk(ash, "Yeah, that didn't fool the density sensor.");
        end
        vars.stein_state = "empty"
        UpdateMouseOver()
    elseif vars.stein_state == "sludge" then
        vars.reactor_filled = true
        PTPCSpeakerPlayData(PCSPK_POUR)
        PTActorSleep(ash, 2000)
        PTPCSpeakerStop()
        PTActorSetWalk(ash, react_terminal_bg.x, react_terminal_bg.y, 0)
        PTWaitForActor(ash)
        PTActorSleep(ash, 1000)
        PTActorTalk(ash, "Hah. Looks like freezing to death is off the menu.")
        PTActorTalk(ash, "And they say nuclear engineering is hard.")
        vars.stein_state = "empty"
        UpdateMouseOver()
    elseif vars.stein_state == "cress" then
        PTActorTalk(ash, "Let's be realistic. It wouldn't make it through to the other end.")
    elseif vars.stein_state == "weevils" then
        PTActorTalk(ash, "Yeah. Sure.")
        PTActorTalk(ash, "Make the weevils radioactive.")
        PTActorTalk(ash, "Great idea.")
    elseif vars.stein_state == "empty" then
        PTActorSleep(ash, 1000)
        PTActorTalk(ash, "Okay. I poured all of the nothing into the reactor. No change.")
    end
end)

PTOnVerb2("use", "cress", "heavy water filler pipe", function()
    PTActorTalk(ash, "The radioactive super-cress project will have to wait until I'm not busy.")
end)



-- warning sign 

PTOnVerb("look", "warning sign", function ()
    ash.talk_colour = {0xff, 0x55, 0x55}
    PTActorTalk(ash, "DANGER: CLASS A NUCLEAR CONTAINMENT UNIT")
    PTActorTalk(ash, "RADIATION PPE TO BE WORN AT ALL TIMES")
    PTActorTalk(ash, "NO USER SERVICABLE PARTS INSIDE")
    ash.talk_colour = {0xff, 0xff, 0xff}
end)
PTOnVerb("use", "warning sign", function ()
    PTActorTalk(ash, "Marketing hype. You'd get more rads from a hairdryer.")
end)
PTOnVerb2("use", "lucky wrench", "warning sign", function ()
    PTActorTalk(ash, "It's a sticker. No bolts.")
end)
PTOnVerb2("use", "fabric tape", "warning sign", function ()
    PTActorTalk(ash, "No need, the sticker is well adhered.")
end)
PTOnVerb2("use", "roll of plastic", "warning sign", function ()
    PTActorTalk(ash, "A common misconception; the sign itself is perfectly safe.")
end)
PTOnVerb2("use", "stein", "warning sign", function ()
    if vars.stein_state == "coffee" or vars.stein_state == "sludge" then
        PTActorTalk(ash, "The sign exists for insurance assessors to read. A coffee stain could wreck our chance of a payout.");
    elseif vars.stein_state == "water" then
        PTActorTalk(ash, "Wouldn't the water run off the sign and wreck the control system, dooming us to a slow and agonising death?");
    elseif vars.stein_state == "weevils" then
        PTActorTalk(ash, "They'd eat the sign.");
    elseif vars.stein_state == "cress" then
        PTActorTalk(ash, "It'd be pretty hard for the cress to read the sign when the lid is closed.");
    else
        PTActorTalk(ash, "The stein can't read.")
    end
end)
PTOnVerb2("use", "cress", "warning sign", function ()
    PTActorTalk(ash, "The warning sign has plenty of pep already.")
end)

vars.checked_barrels = false
PTOnVerb("look", "spare barrels of heavy water", function ()
    if not vars.checked_reactor then
        PTActorTalk(ash, "Our reactor needs to be topped up with fresh D2O every now and then.")
        PTActorTalk(ash, "Luckily we have this big reserve of it for emergencies.")
    elseif not vars.checked_barrels then
        PTActorTalk(ash, "Huh. Maybe we're not doomed after all.");
    else
        PTActorTalk(ash, "Someone must have forgotten to refill all these.");
        PTActorTalk(ash, "Their identity... forever a mystery.");
    end
end)

PTOnVerb("use", "spare barrels of heavy water", function ()
    if not vars.checked_reactor then
        PTActorTalk(ash, "The heavy water stockpile is fine where it is.")
        return
    elseif not vars.checked_barrels then
        -- Move actor around to each barrel
        PTActorSetWalk(ash, 354, 120, 0)
        PTWaitForActor(ash)
        PTActorSleep(ash, 1000)
        PTActorSetWalk(ash, 392, 120, 0)
        PTWaitForActor(ash)
        PTActorSleep(ash, 1000)
        PTActorSetWalk(ash, 425, 120, 0)
        PTWaitForActor(ash)
        PTActorSleep(ash, 1000)
        PTActorSetAnimation(ash, "stand", 270)
        PTActorTalk(ash, "Right. Of course they'd all be empty.");
        vars.checked_barrels = true
    else
        PTActorTalk(ash, "Still empty.");
    end
    if not vars.reactor_filled then
        PTActorTalk(ash, "A shame too, we only need about a pint.");
    end
end)

PTOnVerb2("use", "lucky wrench", "spare barrels of heavy water", function()
    PTActorSetAnimation(ash, "wrench_out", 90)
    PTSleep(1300)
    PTActorSetAnimation(ash, "stand", 0)
    WrenchSmack(1000)
    PTActorSetAnimation(ash, "wrench_in", 90)
    PTSleep(2000)
    PTActorSetAnimation(ash, "stand", 90)
end)

PTOnVerb2("use", "fabric tape", "spare barrels of heavy water", function()
    PTActorTalk(ash, "It's okay, the octopus straps are doing a fine job.")
end)

PTOnVerb2("use", "roll of plastic", "spare barrels of heavy water", function()
    PTActorTalk(ash, "The heavy water is not radioactive. It's just heavy.")
end)

PTOnVerb2("use", "stein", "spare barrels of heavy water", function()
    if not vars.checked_reactor then
        PTActorTalk(ash, "Better not, I read somewhere that drinking this stuff can cause sterility.")
    elseif not vars.checked_barrels then
        PTDoVerb2("use", "spare barrels of heavy water")
    else 
        PTActorTalk(ash, "Much like my hopes and dreams of getting this fixed quickly, they're all empty.")
    end
end)

PTOnVerb2("use", "cress", "spare barrels of heavy water", function()
    PTActorTalk(ash, "There's more than enough deuterium in the cress already.")
end)



PTOnVerb("look", "filter grating", function () 
    PTActorTalk(ash, "Oh this? This hides the secrets of the ship's air purification system.")
end)
PTOnVerb("use", "filter grating", function () 
    PTActorSetAnimation(ash, "stand", 0)
    PTActorTalk(ash, "Nrgghhhhhhhhh")
    PTActorTalk(ash, "Nope. Not moving.")
end)

vars.opened_grating = false 
PTOnVerb2("use", "lucky wrench", "filter grating", function()
    if not vars.opened_grating then 
        PTActorSetAnimation(ash, "wrench_out")
        PTSleep(2000)
        PTActorSetAnimation(ash, "stand", 0)
        PTPCSpeakerPlayData(PCSPK_CLANG2)
        PTMoveObjectRelative(react_grating_bg, 0, 8, 250, "ease-in")
        PTWaitForMoveObject(react_grating_bg)
        PTSleep(500)

        PTPCSpeakerPlayData(PCSPK_MEGADRAG)
        PTMoveObjectRelative(react_grating_bg, 64, 0, 1500, "ease-in")
        PTWaitForMoveObject(react_grating_bg)
        PTPCSpeakerStop()
        
        PTActorSetAnimation(ash, "wrench_in")
        PTSleep(2000)
        vars.opened_grating = true
        react_grating_bg.collision = false
    end
end)

PTOnVerb2("use", "fabric tape", "filter grating", function()
    PTActorTalk(ash, "It's pretty stuck already.")
end)

PTOnVerb2("use", "roll of plastic", "filter grating", function()
    PTActorTalk(ash, "I can't cut off the air supply for the ship. It's already stopped.")
end)

PTOnVerb2("use", "stein", "filter grating", function()
    PTActorTalk(ash, "The grate is slatted, it's not like I can pour upwards.")
end)

PTOnVerb2("use", "cress", "filter grating", function()
    PTActorTalk(ash, "The grating is specifically for keeping larger debris out.")
end)


vars.seen_filter = false
vars.cleaned_filter = false
PTOnVerb("look", "air filter", function ()
    if vars.cleaned_filter then
        PTActorTalk(ash, "It's our sparkling clean only-slightly-weevily air purification unit.")
    else
        vars.seen_filter = true
        PTActorTalk(ash, "I think this used to be our main air filtration screen?")
    end
end)

PTOnVerb("use", "air filter", function ()
    if vars.cleaned_filter then 
        PTActorTalk(ash, "Future maintenance of the air filter is a concern for Future Ash.")
    else
        vars.seen_filter = true
        PTActorTalk(ash, "The hair is cemented to the mesh screen with filth.")
    end
end)

PTOnVerb2("use", "lucky wrench", "air filter", function ()
    if vars.cleaned_filter then
        PTActorTalk(ash, "Our air filter is real fragile. I don't want to punch holes in it deliberately.")
    else
        PTActorTalk(ash, "Our air filter is real fragile. I don't want to punch holes in it by accident.")
    end
end)

PTOnVerb2("use", "fabric tape", "air filter", function () 
    if vars.cleaned_filter then
        PTActorTalk(ash, "There's no mess left to strip off.")
    else
        PTActorTalk(ash, "Clever, but I don't think there's enough tape left to do a full wax.")
    end
end)

PTOnVerb2("use", "roll of plastic", "air filter", function()
    if vars.cleaned_filter then 
        PTActorTalk(ash, "Too late to shut that stable door now.")
    else
        PTActorTalk(ash, "It's just hair. I've touched much worse.")
    end
end)

PTOnVerb2("use", "stein", "air filter", function()
    if vars.cleaned_filter then
        PTActorTalk(ash, "Oh no. We are -done- adding contaminants to the life support system for today.")
    else 
        if vars.stein_state == "weevils" then
            react_filth_sprite.visible = true
            PTSpriteSetAnimation(react_filth_sprite, "default", 0)
            PTActorTalk(ash, "Okay deadbeats. I have a job for you.")
            react_weevils_group.visible = true
            PTSpriteSetAnimation(react_filth_sprite, "clean", 0)
            for _, v in ipairs(react_weevils_group.objects) do
                PTShakeObject(v, 3500, PTSimplexShake(4, 4, 1000, 1000))
            end
            PTActorSleep(ash, 3500)
            react_weevils_group.visible = false

            react_filth_sprite.visible = false
            react_filter_bg.name = "air filter"
            PTActorSleep(ash, 500)
            PTActorTalk(ash, "Huh. Maybe I -do- think better while sleep deprived.")
            
            vars.cleaned_filter = true
            vars.stein_state = "empty"
            UpdateMouseOver()
        elseif vars.stein_state == "water" then
            PTPCSpeakerPlayData(PCSPK_POUR)
            PTActorSleep(ash, 3000)
            PTPCSpeakerStop()
            PTActorTalk(ash, "Well the hairball has a nice sheen on it now, but no change on how stuck it is.");
            vars.stein_state = "empty"
            UpdateMouseOver()
        elseif vars.stein_state == "coffee" or vars.stein_state == "sludge" then
            PTPCSpeakerPlayData(PCSPK_POUR)
            PTActorSleep(ash, 3000)
            PTPCSpeakerStop()
            PTActorTalk(ash, "In hindsight, I don't know why I thought making it stickier would help?");
            vars.stein_state = "empty"
            UpdateMouseOver()
        elseif vars.stein_state == "cress" then
            PTActorTalk(ash, "The cress would bounce off and I'd lose it in the little gaps in the floor.");
        else
            PTActorTalk(ash, "There's nothing in the stein to pour on the filter.");
        end
    end
end)

PTOnVerb2("use", "cress", "air filter", function()
    PTActorTalk(ash, "I do like the concept of adding a pleasant cresslike scent to the ship's air.")
    PTActorTalk(ash, "Sadly parfum-de-cresson wouldn't make it past the contaminant scrubber.")
end)


