-- Goes without saying, but this file is nothing but spoilers for the game.

local vars = PTVars()

cabin_room = PTRoom("cabin", 320, 200)
PTAddRoom(cabin_room)
cabin_porthole_bg = PTBackground(PTImage("assets/cabin/porthole.png", 57, 61), 111, 85, -6)
cabin_room_bg = PTBackground(PTImage("assets/cabin/room.png", 160, 135), 160, 159, -4)
cabin_drawers_bg = PTBackground(PTImage("assets/cabin/drawers.png", 24, 29), 186, 111, -3)
cabin_drawers_bg.collision = true
cabin_drawers_bg.name = "drawers"
cabin_drawers_bg.hotspot_id = "drawers"
cabin_drawers_bg.facing = 0

cabin_cress_bg = PTBackground(PTImage("assets/cabin/cress.png", 11, 16), 185, 89, -1)
cabin_cress_bg.collision = true
cabin_cress_bg.name = "cress terrarium"
cabin_cress_bg.hotspot_id = "cress terrarium"
cabin_cress_bg.facing = 0

-- offset -20, -8
cabin_dooro_bg = PTBackground(PTImage("assets/cabin/dooro.png", -10, 74), 265, 124, -6)
cabin_dooro_bg.collision = true
cabin_dooro_bg.name = "cabin door"
cabin_dooro_bg.hotspot_id = "cabin door"
cabin_dooro_bg.facing = 90

cabin_door_bg = PTBackground(PTImage("assets/cabin/door.png", 8, 82), 284, 132, -5)
cabin_doorf_bg = PTBackground(PTImage("assets/cabin/doorf.png", 12, 94), 282, 137, -1)


cabin_panel_bg = PTBackground(PTImage("assets/cabin/panel_c.png", -3, 64), 296, 153, -1)
cabin_panelo_bg = PTBackground(PTImage("assets/cabin/panel_o.png", 4, 64), 303, 153, -2)
cabin_panelo_bg.collision = true
cabin_panelo_bg.name = "panel"
cabin_panelo_bg.hotspot_id = "cabin door panel"
cabin_panelo_bg.facing = 0

cabin_locker_bg = PTBackground(PTImage("assets/cabin/locker.png", 29, 72), 233, 110, -2)

cabin_lockerl_bg = PTBackground(PTImage("assets/cabin/lockerl.png", 14, 75), 227, 119, -1)
cabin_lockerl_bg.collision = true
cabin_lockerl_bg.name = "left locker"
cabin_lockerl_bg.hotspot_id = "left locker"
cabin_lockerl_bg.facing = 0

cabin_lockerr_bg = PTBackground(PTImage("assets/cabin/lockerr.png", 14, 75), 252, 119, -1)
cabin_lockerr_bg.collision = true
cabin_lockerr_bg.name = "right locker"
cabin_lockerr_bg.hotspot_id = "right locker"
cabin_lockerr_bg.facing = 0

cabin_lockerlo_bg = PTBackground(PTImage("assets/cabin/lockerlo.png", 4, 77), 217, 121, -1)
cabin_lockerlo_bg.visible = false
cabin_lockerro_bg = PTBackground(PTImage("assets/cabin/lockerro.png", 4, 77), 242, 121, -1)
cabin_lockerro_bg.visible = false

cabin_rug_bg = PTBackground(PTImage("assets/cabin/rug.png", 54, 13), 192, 128, -3)
cabin_rug_bg.name = "rug"
cabin_rug_bg.hotspot_id = "rug"
cabin_rug_bg.collision = true

cabin_covers_img = PTImageSequence("assets/cabin/covers%d.png", 1, 16, 48, 54)
cabin_coverso_img = PTImage("assets/cabin/coverso.png", 48, 54)
cabin_covers_closing = {}
for i=1,#ash_undress_u-1 do
    cabin_covers_closing[i] = cabin_coverso_img
end
cabin_covers_closing[#cabin_covers_closing+1] = cabin_covers_img[1] 

cabin_covers_spr = PTSprite({
    PTAnimation("twohump", {cabin_covers_img[1]}, 0, 0),
    PTAnimation("winding", cabin_covers_img, 10, 0, false, false, false),
    PTAnimation("wound", {cabin_covers_img[16]}, 0, 0),
    PTAnimation("open", {cabin_coverso_img}, 0, 0), 
    PTAnimation("closing", cabin_covers_closing, 10, 0, false, false, false), 
}, 75, 142, 4)
PTSpriteSetAnimation(cabin_covers_spr, "wound", 0)
cabin_covers_spr.collision = true
cabin_covers_spr.hotspot_id = "maura"
cabin_covers_spr.name = "Maura"

cabin_vent_bg = PTBackground(PTImage("assets/cabin/vent.png", 9, 9), 214, 36, -3)
cabin_vent_bg.name = "air vent"
cabin_vent_bg.hotspot_id = "air vent"
cabin_vent_bg.facing = 0
cabin_vent_bg.collision = true

cabin_bed_bg = PTBackground(PTImage("assets/cabin/bed.png", 57, 48), 68, 146, 1)

PTRoomAddObject(cabin_room, cabin_porthole_bg)
PTRoomAddObject(cabin_room, cabin_room_bg)
PTRoomAddObject(cabin_room, cabin_drawers_bg)
PTRoomAddObject(cabin_room, cabin_cress_bg)
PTRoomAddObject(cabin_room, cabin_door_bg)
PTRoomAddObject(cabin_room, cabin_dooro_bg)
PTRoomAddObject(cabin_room, cabin_doorf_bg)
PTRoomAddObject(cabin_room, cabin_panel_bg)
PTRoomAddObject(cabin_room, cabin_panelo_bg)
PTRoomAddObject(cabin_room, cabin_locker_bg)
PTRoomAddObject(cabin_room, cabin_lockerl_bg)
PTRoomAddObject(cabin_room, cabin_lockerr_bg)
PTRoomAddObject(cabin_room, cabin_lockerlo_bg)
PTRoomAddObject(cabin_room, cabin_lockerro_bg)
PTRoomAddObject(cabin_room, cabin_rug_bg)
PTRoomAddObject(cabin_room, cabin_covers_spr)
PTRoomAddObject(cabin_room, cabin_vent_bg)
PTRoomAddObject(cabin_room, cabin_bed_bg)


PTRoomSetWalkBoxes(cabin_room, {
    PTWalkBox(PTPoint(40, 150), PTPoint(135, 150), PTPoint(135, 152), PTPoint(39, 152), 5),
    PTWalkBox(PTPoint(135, 150), PTPoint(140, 115), PTPoint(140, 152), PTPoint(135, 152), 5),
    PTWalkBox(PTPoint(140, 152), PTPoint(140, 115), PTPoint(253, 115), PTPoint(294, 152), 1),
    PTWalkBox(PTPoint(141, 105), PTPoint(149, 105), PTPoint(153, 115), PTPoint(140, 115), 0),
    PTWalkBox(PTPoint(74, 103), PTPoint(149, 103), PTPoint(149, 105), PTPoint(74, 105), 0),
    PTWalkBox(PTPoint(74, 105), PTPoint(133, 105), PTPoint(113, 113), PTPoint(74, 113), 0),
})

cabin_room.camera_actor = ash
bedside_x = 88
bedside_y = 113 
PTActorSetRoom(ash, cabin_room, bedside_x, bedside_y, 2)
PTActorSetRoom(maura, cabin_room, 39, 122, 3)


PTOnRoomEnter("cabin", function (first_time)
    cabin_room.camera_actor = ash
    cabin_room.x = ash.x
    cabin_room.y = ash.y
    if first_time then
        PTSpriteSetAnimation(cabin_covers_spr, "twohump", 0)
        PTStartThread("intro", intro_scene)
        PTOnTalkSkipWhileGrabbed(function() 
            PTTalkSkipThread("intro")
        end)
        PTOnFastForwardWhileGrabbed(function() 
            PTFastForwardThread("intro")
        end)
    end
end)

PTOnRoomLoad("cabin", function ()
    -- move the door open or shut
    if vars.cabin_door_open then 
        cabin_door_bg.x, cabin_door_bg.y = 284-15, 132-12
    else
        cabin_door_bg.x, cabin_door_bg.y = 284, 132
    end
    if vars.panel_open then
        cabin_panel_bg.y = 153-17; 
    end
    print("cabin room load")
    if vars.graphics_mode == 3 then
        SetGraphicsMode("cga", "cabin") 
    end
    PTSpriteSetAnimation(cabin_covers_spr, "wound", 0)
    PTActorSetAnimation(maura, maura.anim_stand, 0)
end)

control_hints_lmb = PTBackground(PTImage("assets/ms_lmb.png"), 0, 0)
control_hints_rmb = PTBackground(PTImage("assets/ms_rmb.png"), 0, 16)
control_hints_tap = PTSprite({PTAnimation("default", {PTImage("assets/tap_lmb1.png"), PTImage("assets/tap_lmb2.png")}, 2)}, 0, 0)
PTSpriteSetAnimation(control_hints_tap, "default")
control_hints_press = PTBackground(PTImage("assets/tap_rmb.png"), 0, 16)
control_hints_inter = PTBackground(PTText("Interact", font, 64, "left", { 0xed, 0xb1, 0x00 }), 16, 2)
control_hints_exam = PTBackground(PTText("Examine", font, 64, "left", { 0xed, 0xb1, 0x00 }), 16, 18)

control_hints = PTGroup(
    {
    },
    -80,
    8,
    15,
    0,
    0
)

PTRoomAddObject(cabin_room, control_hints)

ShowControlHints = function ()
    control_hints.visible = true
    if PTUsingTouch() then
        control_hints.objects = {control_hints_tap, control_hints_press, control_hints_inter, control_hints_exam}
    else 
        control_hints.objects = {control_hints_lmb, control_hints_rmb, control_hints_inter, control_hints_exam}
    end
    PTMoveObject(control_hints, 8, 8, 1000, "ease-out")
    PTWaitForMoveObject(control_hints)
    PTSleep(5000)
    PTMoveObject(control_hints, -80, 8, 1000, "ease-in")
    PTWaitForMoveObject(control_hints)
    control_hints.visible = false
end



PTOnVerb("look", "drawers", function()
    PTActorTalk(ash, "Clothes, underwear, socks.")
end)
PTOnVerb("use", "drawers", function()
    PTActorTalk(ash, "Nothing in here that I need.")
end)
PTOnVerb2("use", "lucky wrench", "drawers", function ()
    PTActorTalk(ash, "The sliding mechanism is well-oiled and needs no tightening.")
end)
PTOnVerb2("use", "fabric tape", "drawers", function ()
    PTActorTalk(ash, "There aren't any torn clothes. Those are on rag duty.")
end)
PTOnVerb2("use", "roll of plastic", "drawers", function ()
    PTActorTalk(ash, "It's all clean! The laundry is not a hazard.")
end)
PTOnVerb2("use", "stein", "drawers", function ()
    if vars.stein_state == "water" or vars.stein_state == "coffee" or vars.stein_state == "sludge" then
        PTActorTalk(ash, "No liquids allowed in the sock drawer.")
    elseif vars.stein_state == "cress" then
        PTActorTalk(ash, "No cress allowed in the sock drawer.")
    elseif vars.stein_state == "weevils" then
        PTActorTalk(ash, "DEFINITELY no weevils allowed in the sock drawer.")
    else
        PTActorTalk(ash, "No German drinking vessels allowed in the sock drawer.")
    end
end)
PTOnVerb2("use", "cress", "drawers", function ()
    PTActorTalk(ash, "Don't want to get cress bits on the nice clean laundry.")
end)



vars.has_taken_wrench = false
PTOnVerb("look", "right locker", function()
    PTActorTalk(ash, "Feels strange, having all my stuff in this box instead of scattered around the ship.")
end)
PTOnVerb("use", "right locker", function()
    ash.facing = 0
    cabin_lockerr_bg.visible = false
    cabin_lockerro_bg.visible = true
    PTPCSpeakerPlayData(PCSPK_DOOR_OPEN)
    if not vars.has_taken_wrench then
        PTActorTalk(ash, "Ahhhh! My lucky wrench.");
        PTActorTalk(ash, "We go way back, so many happy memories...");
        PTActorTalk(maura, "... can you two not talk so loudly?");
        PTActorTalk(ash, "Shhhh... ignore her Francesca, she's just jealous.");
        AddInv("lucky wrench")
        SetCurrentInv("lucky wrench") 
        vars.has_taken_wrench = true
    else
        PTActorTalk(ash, "No more tools in here, sadly.");
    end
    cabin_lockerro_bg.visible = false
    cabin_lockerr_bg.visible = true
    PTPCSpeakerPlayData(PCSPK_DOOR_CLOSE)
end)
PTOnVerb2("use", "lucky wrench", "right locker", function ()
    PTActorTalk(ash, "Not yet, Francesca has much to contribute to ship repairs.")
end)
PTOnVerb2("use", "fabric tape", "right locker", function ()
    PTActorTalk(ash, "The tape isn't mine.")
end)
PTOnVerb2("use", "roll of plastic", "right locker", function ()
    PTActorTalk(maura, "Taking my advice I see?")
    PTActorTalk(ash, "Psssh. The boots aren't that bad.")
    PTActorTalk(ash, "They smell normal and have many years of life left.")
    PTActorTalk(ash, "If I wanted to carry them I would use my hands.")
    PTActorSleep(ash, 500)
    PTActorTalk(ash, "Feet.")
    PTActorSleep(ash, 500)
    PTActorTalk(ash, "Whatever.")
end)
PTOnVerb2("use", "stein", "right locker", function ()
    PTActorTalk(ash, "It's the only clean-ish mug on the ship. I might need it.")
end)
PTOnVerb2("use", "cress", "right locker", function ()
    PTActorTalk(ash, "The cress would fare poorly in my locker's complex microbiome.")
end)




vars.has_taken_tape = false
PTOnVerb("look", "left locker", function()
    PTActorTalk(ash, "The left locker is Maura's.")
end)
PTOnVerb("use", "left locker", function()
    ash.facing = 0
    if not vars.has_taken_tape then
        cabin_lockerl_bg.visible = false
        cabin_lockerlo_bg.visible = true
        PTPCSpeakerPlayData(PCSPK_DOOR_OPEN)
        PTActorTalk(ash, "There's a roll of Maura's special rock-climbing tape.")
        PTActorTalk(ash, "Better borrow it.")
        AddInv("fabric tape")
        SetCurrentInv("fabric tape") 
        cabin_lockerlo_bg.visible = false
        cabin_lockerl_bg.visible = true
        PTPCSpeakerPlayData(PCSPK_DOOR_CLOSE)
        vars.has_taken_tape = true
    else
        cabin_lockerl_bg.visible = false
        cabin_lockerlo_bg.visible = true
        PTPCSpeakerPlayData(PCSPK_DOOR_OPEN)
        PTActorTalk(ash, "I probably don't need any more of Maura's stuff.");
        cabin_lockerlo_bg.visible = false
        cabin_lockerl_bg.visible = true
        PTPCSpeakerPlayData(PCSPK_DOOR_CLOSE)
    end
end);
PTOnVerb2("use", "lucky wrench", "left locker", function ()
    PTActorTalk(ash, "Francesca would never cheat on me.")
end)
PTOnVerb2("use", "fabric tape", "left locker", function ()
    PTActorTalk(ash, "Not yet, there's still things to fix!")
end)
PTOnVerb2("use", "roll of plastic", "left locker", function ()
    PTActorSetAnimation(ash, "stand", 270)
    PTActorTalk(maura, "Hey hey hey. What's with the hazmat wrap?")
    PTActorTalk(maura, "My locker is always spotless!")
    PTActorSleep(ash, 1000)
    PTActorTalk(ash, "Always, eh?")
    PTActorTalk(ash, "Are we forgetting the taco incident?")
    PTActorSleep(maura, 2000)
    PTActorTalk(maura, "I knew you'd bring that up.")
    PTActorTalk(maura, "Swear to God, you leave ONE taco in a locker, ONCE, BY ACCIDENT...")
    PTActorTalk(maura, "Just engrave it on my tombstone already.")
end)
PTOnVerb2("use", "stein", "left locker", function ()
    PTActorTalk(maura, "Ash, why are you putting a used cup in my locker?")
    PTActorSetAnimation(ash, "stand", 270)
    PTActorSleep(ash, 1000)
    PTActorTalk(ash, "Uhhhh...") 
    PTActorTalk(ash, "The sink is full?") 
    PTActorTalk(maura, "Yes. It is full.")
    PTActorTalk(maura, "And it's your week, so tomorrow I expect scrubbing.")
    PTActorSleep(ash, 2000)
    PTActorTalk(ash, "Yes ma'am.")
end)
PTOnVerb2("use", "cress", "left locker", function ()
    PTActorSetAnimation(ash, "stand", 270)
    PTActorTalk(maura, "Honestly! What does my locker look like, some kind of green waste bin?")
    PTActorTalk(maura, "If you're going to take cress, I expect you to finish it.")
end)



PTOnVerb("look", "maura", function ()
    PTActorTalk(ash, "Maura has engaged the blanket burrito defense.")
    PTActorTalk(ash, "I can't believe she doesn't trust me!")
end)

vars.left_the_room = false
vars.got_door_advice = false
vars.got_room_advice = false
vars.seen_weevils = false
vars.captured_weevils = false
vars.got_weevil_advice = false
vars.fixed_wiring = false
vars.got_wiring_advice = false

PTOnVerb("use", "maura", function ()
    if not vars.left_the_room and not vars.got_room_advice then
        vars.got_room_advice = true
        PTActorTalk(ash, "Tragic news, captain.")
        PTActorTalk(ash, "I couldn't fix the ship.")
        PTActorTalk(ash, "It's all over.")
        PTActorTalk(ash, "Nothing left but to hold one other and wait for the uncaring vacuum of space to claim our bones.")
        PTActorSleep(maura, 1000)
        PTActorTalk(maura, "Ash, have you *tried* to fix the ship?")
        PTActorSleep(ash, 1000)
        PTActorTalk(ash, "Define \"tried\"?")
        PTActorTalk(maura, "Have you even left this room?")
        PTActorTalk(ash, "...define \"room\"?")
        PTActorSleep(ash, 1000)
        PTActorTalk(ash, "Okay, so there may be a few things I haven't checked.")
    
    elseif vars.seen_cabin_door and not vars.cabin_door_open and not vars.got_door_advice then
        vars.got_door_advice = true
        PTActorTalk(ash, "On a scale of 1 to 10, how bad would you say you were with enclosed spaces?")
        PTActorSleep(maura, 1000)
        PTActorTalk(maura, "I mean... not great?")
        PTActorTalk(maura, "What size are we talking about? Coffin sized?")
        PTActorTalk(ash, "Oh no no. Much bigger than that.")
        PTActorTalk(ash, "Say, the size of this room?")
        PTActorTalk(maura, "Oh! About a 4 then.")
        PTActorSleep(maura, 2000)
        PTActorTalk(maura, "Waiiit a second. That's an awfully specific question.")
        PTActorTalk(maura, "Is there something wrong with the door??")
        PTActorTalk(ash, "Sounding more like a 7...")
        PTActorSleep(maura, 1000)
        PTActorTalk(maura, "Actually, I'm not worried.")
        PTActorTalk(maura, "We got Derek in to renew the ship's safety cert, remember?")
        PTActorTalk(maura, "All the doors must have a working failsafe.")
        PTActorTalk(ash, "You hired that piss artist AGAIN???")
        PTActorTalk(ash, "All Derek does is wander around tapping things with a hammer!")
        PTActorTalk(maura, "It was an expensive hammer!!!")
        PTActorTalk(maura, "That's enough for my peace of mind.")
        PTActorSleep(ash, 1000)
        PTActorTalk(ash, "I'm off to use the air on the other side of the box.")

    elseif vars.seen_filter and not vars.cleaned_filter and not vars.got_filter_advice then
        vars.got_filter_advice = true
        PTActorTalk(ash, "I know this probably isn't a good time.")
        PTActorTalk(ash, "But remember when you switched to that extra-hold-factor conditioner?")
        PTActorTalk(ash, "And something about it caused that catastrophic drain blockage?")
        PTActorSleep(ash, 1000)
        PTActorTalk(ash, "And I had to hire that special drill?")
        PTActorTalk(ash, "For fatbergs?")
        PTActorSleep(ash, 2000)
        PTActorTalk(maura, "So I've been stressed lately.")
        PTActorTalk(maura, "Is that a crime?")
        PTActorTalk(maura, "Are you taking me to Anxiety Jail?")
        PTActorTalk(ash, "I think the prison system has poor rehabilitation outcomes...")
        PTActorTalk(maura, "Well too bad. My bank statement beat you to it.")
        PTActorTalk(maura, "Clients can smell fear, and I don't need to tip them off by shedding everywhere.")
        PTActorSleep(ash, 2000)
        PTActorTalk(ash, "Anyway, what I was getting to is that we have a similar problem.")
        PTActorTalk(ash, "On the main life support filter, in fact.")
        PTActorTalk(ash, "And we don't have the special drill.")
        PTActorSleep(maura, 1000)
        PTActorTalk(maura, "Now I'm spiralling about money again. Thanks.")
        PTActorTalk(maura, "Best of luck cleaning that, you can eat it for all I care.")
        PTActorSleep(ash, 500)
        PTActorTalk(ash, "Crap. I'm sorry, I really wasn't trying to pull your chain.")
        PTActorSleep(maura, 2000)
        PTActorTalk(maura, "Uhh... what I meant to say was, I fully delegate this to my first officer.")
        PTActorTalk(maura, "Who is a mechanical genius.")
        PTActorTalk(maura, "And great dancer.")
        PTActorTalk(ash, "I swear ONE DAY I will meet this person.")

    elseif vars.checked_barrels and not vars.fixed_reactor and not vars.got_reactor_advice then
        vars.got_reactor_advice = true
        PTActorTalk(ash, "So. The reactor.")
        PTActorTalk(ash, "The one that mostly runs itself, so long as you refill the heavy water.")
        PTActorTalk(ash, "What if, hypothetically, we couldn't do that.")
        PTActorSleep(maura, 500)
        PTActorTalk(maura, "Don't we hypothetically have that giant stack of spare heavy water?")
        PTActorTalk(ash, "See... there's this thing about barrels.")
        PTActorTalk(ash, "From a distance it's hard to say conclusively if they are full or empty.")
        PTActorTalk(ash, "Or, by extension, if -any- of them have -any- amount of liquid left.")
        PTActorSleep(maura, 2000)
        PTActorTalk(maura, "Hypothetically?")
        PTActorTalk(ash, "Yes. Hypothetically.")
        PTActorSleep(maura, 2000)
        PTActorTalk(maura, "Well, hypothetically I should be demanding a resignation right about now.")
        PTActorSleep(maura, 1000)
        PTActorTalk(maura, "*sigh*")
        PTActorTalk(maura, "Isn't the heavy water just used as a safety thing?")
        PTActorTalk(maura, "We might be able to limp to the next port with something similar.")
        PTActorTalk(ash, "Thanks boss. You're the best.")
        PTActorTalk(maura, "You're getting my oncology bill.")

    elseif vars.seen_steam_pipe and vars.steam_pipe_state == 0 and not vars.got_steam_pipe_advice then
        vars.got_steam_pipe_advice = true
        PTActorTalk(ash, "We've got a gaping hole in the steam line for heat exchanger B.")
        PTActorTalk(ash, "I swear it wasn't there yesterday. Maybe the pipe has been eroding under the paint?")
        PTActorSleep(maura, 1000)
        PTActorTalk(maura, "Hmm, that's weird. TIG weld it?")
        PTActorTalk(ash, "Ah... yeah I would advise against that.")
        PTActorTalk(maura, "Oh. Yeah that'd drain the emergency power, bad idea.")
        PTActorSleep(ash, 1000)
        PTActorTalk(ash, "I was going to say the TIG welder is very heavy, but that's a much better reason.")
        PTActorSleep(maura, 2000)
        PTActorTalk(maura, "Well, patch it up as best you can for now.")
        PTActorTalk(maura, "There must be some steam-resistant material somewhere onboard.")

    elseif vars.seen_weevils and not vars.got_weevil_advice and not vars.captured_weevils then
        vars.got_weevil_advice = true
        PTActorTalk(ash, "I'm tilted. The weevils are back.")
        PTActorTalk(maura, "So I gathered! From your bellowing.")
        PTActorTalk(ash, "First chance we get I propose loading up on all the Insectotox we can carry.")
        if (got_reactor_advice and reactor_filled) then
            PTActorTalk(maura, "Even before getting a specialist to fix the awful thing you did to make the reactor work?")
            PTActorTalk(ash, "ESPECIALLY before that.")
        end
        PTActorSleep(maura, 2000)
        PTActorTalk(maura, "Wasn't Insectotox the one that got recalled after that big scandal?")
        PTActorTalk(ash, "Don't know what you mean.")
        PTActorTalk(maura, "...yes, now I remember! They found it in bone marrow!")
        PTActorTalk(ash, "Even better. Their puny weevil skeletons wouldn't stand a chance.")
        PTActorSleep(maura, 1000)
        PTActorTalk(maura, "We'll discuss having a bug hunt later.")
        PTActorTalk(maura, "For now just get them away from the important bits of the ship? I guess??")

    elseif vars.captured_weevils and not vars.got_wiring_advice then
        vars.got_wiring_advice = true
        PTActorTalk(ash, "Any ideas for fixing weevil holes in the navi wiring?")
        PTActorSleep(maura, 1000)
        PTActorTalk(maura, "Y'know, sometimes I wonder if you *have* tools other than that wrench.")
        PTActorTalk(ash, "I do!!")
        PTActorTalk(ash, "They're just... in the cargo bay.")
        PTActorTalk(ash, "Which has no air.")
        PTActorTalk(ash, "Conveniently.")
        PTActorSleep(maura, 1000)
        PTActorTalk(maura, "You're resourceful, I'm sure you can insulate some wire.")

    else
        PTActorTalk(ash, "I should let her rest unless I have something new to bring up.")
    end
end)


-- I know you're still awake. You can't pretend not to hear me forever.



PTOnVerb2("use", "lucky wrench", "maura", function ()
    PTActorTalk(ash, "Not even the highest torque setting could loosen those blankets.")
end)

PTOnVerb2("use", "fabric tape", "maura", function ()
    PTActorTalk(ash, "Okay if I use some of your tape for repairs?");
    PTActorSleep(maura, 1000);
    PTActorTalk(maura, "Ehhh, as long as the clients don't see it.")
    PTActorTalk(maura, "Don't need to give them any ideas about being cheap.")
end)

PTOnVerb2("use", "roll of plastic", "maura", function ()
    -- smile animation
    PTActorSleep(ash, 2000);
    PTActorTalk(maura, "What's with the smile and the strange faraway look?")
    PTActorTalk(ash, "...hmm?")
    PTActorTalk(ash, "Oh! Sorry. Was lost in thought.")
end)

vars.shown_maura_stein = false
PTOnVerb2("use", "stein", "maura", function ()
    if not vars.shown_maura_stein then
        vars.shown_maura_stein = true
        PTActorTalk(ash, "Remember this?");
        PTActorSleep(maura, 500);
        PTActorTalk(maura, "Hah, how could I forget?")
        PTActorTalk(maura, "That was the day we went on the rollercoaster after you ate all that cheese!")
        PTActorTalk(ash, "I remember it as the day you won $500 drinking that mining crew into a coma.");
        PTActorTalk(maura, "Heh. Yeah we were both pretty out of it!")
        PTActorSleep(maura, 1000);
        PTActorTalk(maura, "Wow. That Oktoberfest was... three years ago now.")

        PTActorSleep(maura, 1000);
        PTActorTalk(maura, "How come we never do goofy stuff like that any more, Ash?")
        PTActorSleep(ash, 500);
        PTActorTalk(ash, "Work, I guess.");
        PTActorTalk(maura, "Yeah.")
        PTActorTalk(maura, "God, I wanted to be a captain so badly!")
        PTActorTalk(maura, "No-one told me about the long hours, or the truckstop food, or the bottomless debt...")
        PTActorSleep(ash, 1000);
        PTActorTalk(ash, "We'll get that big score, boss. Soon. It'll happen.");
        PTActorTalk(maura, "I sure hope so, kid.")
    else
        PTActorTalk(maura, "After this is over, let's scrape some cash together and do something fun.")
        PTActorTalk(maura, "Just the two of us.")
        PTActorTalk(ash, "I'd like that.")
    end
end)


PTOnVerb2("use", "cress", "maura", function ()
    PTActorTalk(ash, "Would you like some cress?");
    PTActorTalk(maura, "No thanks. You know I get weird cress dreams if I eat it before bed.");
end)



vars.has_taken_cress = false
vars.has_used_cress = false
PTOnVerb("look", "cress terrarium", function ()
    PTActorTalk(ash, "Our faithful companion/room brightener/salad bar.")
end)

PTOnVerb("use", "cress terrarium", function ()
    if vars.has_taken_cress then 
        PTActorTalk(maura, "Hey! Don't be a cress hog.")
        if vars.captured_weevils then 
            PTActorSetAnimation(ash, "stand", 270)
            PTActorTalk(ash, "But I don't have any cress!")
            PTActorSleep(maura, 500)
            PTActorTalk(maura, "Classic cress hog misdirection tactic. Not falling for it.")
        end
    else 
        PTActorTalk(ash, "Maybe just a little bit of cress.")
        AddInv("cress")
        SetCurrentInv("cress") 
        vars.has_taken_cress = true
    end
end)

PTOnVerb2("use", "lucky wrench", "cress terrarium", function ()
    PTActorTalk(ash, "The terrarium is too fragile for Francesca.")
end)
PTOnVerb2("use", "fabric tape", "cress terrarium", function ()
    PTActorTalk(ash, "She's pristine. No cracks to mend.")
end)
PTOnVerb2("use", "roll of plastic", "cress terrarium", function ()
    PTActorTalk(ash, "There's plenty of soil moisture, no need to collect condensation.")
end)
PTOnVerb2("use", "stein", "cress terrarium", function ()
    if vars.stein_state == "water" then
        PTActorTalk(ash, "I watered the cress yesterday.");
    elseif vars.stein_state == "coffee" or vars.stein_state == "sludge" then
        PTActorTalk(ash, "That would wreck the pH of the soil.")
    elseif vars.stein_state == "cress" then
        PTActorTalk(ash, "What, tip it back in the terrarium? Why?")
    elseif vars.stein_state == "weevils" then
        PTActorTalk(ash, "Dear God NO!!! They would ruin the whole harvest!")
    else
        PTActorTalk(ash, "It's hard to scoop up herbs with a bulky stein.");
    end
end)
PTOnVerb2("use", "cress", "cress terrarium", function ()
    PTActorTalk(ash, "Ehh, I don't feel like replanting the cress.")
end)


vars.seen_cabin_door = false
vars.cabin_door_open = false
PTOnVerb("look", "cabin door", function ()
    if not vars.cabin_door_open then
        vars.seen_cabin_door = true
        PTActorTalk(ash, "The cool sliding door to our quarters has no power.");
        PTActorTalk(ash, "Bodes well for the next time we have a fire.");
    else
        PTActorTalk(ash, "Freedom! Horrible, horrible freedom!");
    end
end)
LeaveCabin = function ()
    vars.left_the_room = true
    PTActorSetRoom(ash, bridge_room, bridge_tocabin_bg.x, bridge_tocabin_bg.y)
    PTSwitchRoom("bridge")
end
PTOnVerb("use", "cabin door", function ()
    if not vars.cabin_door_open then
        vars.seen_cabin_door = true
        PTActorTalk(ash, "There's no handle; it's meant to be automatic.")
    else
        LeaveCabin()
    end
end)

PTOnVerb2("use", "lucky wrench", "cabin door", function ()
    if vars.cabin_door_open then
        LeaveCabin()
    else 
        PTActorTalk(ash, "And what? Make a bunch of angry dents I'd have to buff out later?")
    end
end)
PTOnVerb2("use", "fabric tape", "cabin door", function ()
    if vars.cabin_door_open then
        LeaveCabin()
    else
        PTActorTalk(ash, "The tape isn't sticky enough to pull the door open with.")
    end
end)
PTOnVerb2("use", "roll of plastic", "cabin door", function ()
    if vars.cabin_door_open then
        LeaveCabin()
    end
end)
PTOnVerb2("use", "stein", "cabin door", function ()
    if vars.cabin_door_open then
        LeaveCabin()
    end
end)
PTOnVerb2("use", "cress", "cabin door", function ()
    if vars.cabin_door_open then
        LeaveCabin()
    else 
        PTActorTalk(maura, "Stop.")
        PTActorSetAnimation(ash, "stand", 270)
        PTActorTalk(maura, "Don't rub cress on the door.")
        PTActorSleep(ash, 1000)
        PTActorTalk(ash, "How... did you know I was about to rub cress on the door?")
        PTActorSleep(maura, 500)
        PTActorTalk(maura, "You have a tell.")
    end
end)


PTOnVerb("look", "rug", function ()
    PTActorTalk(ash, "Really helps level the place up from \"repurposed manager's office\" to \"boudoir\".")
end)

PTOnVerb("use", "rug", function ()
    if vars.seen_cabin_door and not vars.cabin_door_open then 
        PTActorTalk(ash, "There's no hidden escape hatch, sadly.")
        PTActorTalk(ash, "I tried getting one priced; there's surprisingly little free space in the floor and walls.")
    else
        PTActorTalk(ash, "I wouldn't want to break the fragile truce with the dust mites.")
    end
end)

PTOnVerb2("use", "lucky wrench", "rug", function ()
    PTActorTalk(ash, "It's not rug-beating day.")
end)
PTOnVerb2("use", "fabric tape", "rug", function ()
    PTActorTalk(ash, "Unnecessary; the rug has a non-slip backing pad.")
end)
PTOnVerb2("use", "roll of plastic", "rug", function ()
    PTActorTalk(ash, "That's more of an idea for the mat in the bathroom.")
end)
PTOnVerb2("use", "stein", "rug", function ()
    if vars.stein_state == "water" or vars.stein_state == "coffee" or vars.stein_state == "sludge" then
        PTActorTalk(ash, "No. This thing is hell to clean.")
    elseif vars.stein_state == "cress" then
        PTActorTalk(ash, "I went to a lot of effort to put the cress in this mug. I'm not about to squander it all by tipping it on the shag.")
    elseif vars.stein_state == "weevils" then
        PTActorTalk(ash, "Reward my most hated enemy?? With a twelve-course meal???")
    else
        PTActorTalk(ash, "There's nothing to scoop up on the rug.")
    end

end)
PTOnVerb2("use", "cress", "rug", function ()
    PTActorTalk(ash, "Plenty of accidental cress pieces in here already.")
end)



PTOnVerb("look", "air vent", function ()
    PTActorTalk(ash, "Kind of troubling that this isn't circulating clean, fresh air.") 
end)

PTOnVerb("use", "air vent", function ()
    if vars.seen_cabin_door and not vars.cabin_door_open then 
        PTActorTalk(ash, "I guess this might be a potential way out?") 
        PTActorTalk(ash, "If only I could cut off my arms, legs and head...")
        PTActorTalk(maura, "That can be arranged.")
        PTActorSetAnimation(ash, "stand", 270)
        PTActorSleep(ash, 2000)
        PTActorTalk(ash, "I've decided; probably doesn't lead anywhere.")
        PTActorTalk(maura, "You sure?")
        PTActorTalk(maura, "I mean we can make it happen. No trouble at all.")
        PTActorTalk(ash, "99% sure.")
    else 
        PTActorTalk(ash, "It's kinda high up. I don't think I need to mess with it.")
    end
end)

PTOnVerb2("use", "lucky wrench", "air vent", function ()
    PTActorTalk(ash, "There aren't any bolts on the grating.")
end)
PTOnVerb2("use", "fabric tape", "air vent", function ()
    PTActorTalk(ash, "Maybe if the grate was making a horrible rattling noise? But not now.")
end)
PTOnVerb2("use", "roll of plastic", "air vent", function ()
    PTActorTalk(ash, "We need that air to live!")
end)
PTOnVerb2("use", "stein", "air vent", function ()
    PTActorTalk(ash, "It's too high, shut, and I don't want to.")
end)
PTOnVerb2("use", "cress", "air vent", function ()
    PTActorTalk(ash, "This wouldn't be the first time I've considered hiding cress in the air vents for when times get hard.")
    PTActorTalk(ash, "But the stupid grating never closes properly once opened, so I'll pass for now.")
end)



vars.panel_open = false
PTOnVerb("look", "cabin door panel", function ()
    if not vars.panel_open then
        PTActorTalk(ash, "It has \"MANUAL DOOR CONTROL\" engraved on it.")
    else
        PTActorTalk(ash, "Hmm. There's a spindle in here with a hex head.")
    end
end)

OpenDoorPanel = function ()
    vars.panel_open = true
    PTPCSpeakerPlayData(PCSPK_SWITCH)
    PTMoveObjectRelative(cabin_panel_bg, 0, -17, 500, "ease-out")
    PTWaitForMoveObject(cabin_panel_bg)
end

PTOnVerb("use", "cabin door panel", function ()
    -- play animation
    if not vars.panel_open then
        OpenDoorPanel()
    else
        if not vars.got_door_advice then 
            vars.seen_cabin_door = true
            PTActorTalk(ash, "There's meant to be an emergency lever, but some bastard has nicked it.")
        else
            PTActorTalk(ash, "Derek has taken the emergency lever. No doubt to bodge over a different, more visible problem.")
            PTActorTalk(ash, "New life goal: have Derek Cask of Amontillado'd behind a sewage riser.")
        end
    end
end)

PTOnVerb2("use", "lucky wrench", "cabin door panel", function ()
    if not vars.panel_open then
        OpenDoorPanel()
    end
    if not vars.cabin_door_open then
        PTActorSetAnimation(ash, "wrench_out", 90)
        PTSleep(2000)
        ash.facing = 0
        PTActorSetAnimation(ash, "stand", 0)
        PTActorTalk(ash, "Nhrrrrrrrghhh")
        PTPCSpeakerPlayData(PCSPK_DRAG1)
        PTMoveObjectRelative(cabin_door_bg, -5, -4, 500, "ease-out")
        PTWaitForMoveObject(cabin_door_bg)
        PTSleep(500)
        PTPCSpeakerPlayData(PCSPK_DRAG2)
        PTMoveObjectRelative(cabin_door_bg, -5, -4, 500, "ease-out")
        PTWaitForMoveObject(cabin_door_bg)
        PTSleep(500)
        PTPCSpeakerPlayData(PCSPK_DRAG3)
        PTMoveObjectRelative(cabin_door_bg, -5, -4, 500, "ease-out")
        PTWaitForMoveObject(cabin_door_bg)
        vars.cabin_door_open = true
        ash.facing = 90
        PTActorSetAnimation(ash, "wrench_in", 90)
        PTSleep(2000)
        PTActorSetAnimation(ash, "stand", 90)
        PTPCSpeakerStop()
    else
        PTActorTalk(ash, "Better leave it open for now.")
    end
end)
PTOnVerb2("use", "fabric tape", "cabin door panel", function ()
    if not vars.panel_open then
        OpenDoorPanel()
    end
    PTActorTalk(ash, "The spindle is pretty firm. I don't think adding tape will make it grippy enough to turn by hand.")
end)
PTOnVerb2("use", "roll of plastic", "cabin door panel", function ()
    PTActorTalk(ash, "There's a perfectly good sliding cover.")
end)
PTOnVerb2("use", "stein", "cabin door panel", function ()
    PTActorTalk(ash, "Not enough clearance to jam a whole stein in there.")
end)
PTOnVerb2("use", "cress", "cabin door panel", function ()
    if not vars.panel_open then
        OpenDoorPanel()
    end
    PTActorTalk(ash, "This wouldn't be the first time I've considered hiding cress in the walls for when times get hard.")
    PTActorTalk(ash, "But we have so many seedlings in the terrarium! There's no risk, surely.")
end)


