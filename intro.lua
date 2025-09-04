intro_room = PTRoom("intro", 600, 200)
PTAddRoom(intro_room)

img_space = PTImage("assets/intro.png", 0, 0)
img_space_red = PTImage("assets/intro_i.png", 0, 0)
space_width, space_height = PTGetImageDims(img_space)

bg_intro = PTBackground(img_space, 0, 0, -2)
PTRoomAddObject(intro_room, bg_intro)

ship = PTImage("assets/ship.png", 0, 0)
ship_inv = PTImage("assets/ship_i.png", 0, 0)

ship_width, ship_height = PTGetImageDims(ship)
ship_end = 350
PTSetImageOrigin(ship, ship_width // 2, ship_height // 2)
PTSetImageOrigin(ship_inv, ship_width // 2, ship_height // 2)
bg_ship = PTBackground(ship, ship_end, space_height//2, 2, false)
bg_ship.parallax_x = 2.5
PTRoomAddObject(intro_room, bg_ship)

title = PTImage("assets/title.png")
bg_title = PTBackground(title, ship_end, space_height//2, -1)
title_width, title_height = PTGetImageDims(title)
PTSetImageOrigin(title, title_width//2, title_height//2)
bg_title.visible = false 
PTRoomAddObject(intro_room, bg_title)


intro_camera = function ()
    -- Thread just for moving the room camera
    PTGrabInput()
    PTMoveObject(intro_room, ship_end, intro_room.y, 17200, "ease-out")
    PTWaitForMoveObject(intro_room)
    bg_ship.image = ship_inv
    bg_intro.image = img_space_red
    if vars.graphics_mode == 3 then
        SetGraphicsMode("cga", "intro-alt")
    end
    PTSleep(3600)
    bg_title.visible = true
    PTSleep(7200)
    bg_ship.image = ship
    bg_intro.image = img_space
    bg_title.visible = false
    if vars.graphics_mode == 3 then
        SetGraphicsMode("cga", "intro")
    end
    PTSleep(2000)
    PTSwitchRoom("cabin", true)
end

PTOnRoomEnter("intro", function ()
    PTRadLoad("assets/intro.rad")
    PTRadPlay()
    intro_panel.visible = true
    inv_bg.visible = false
    ash.anim_stand = "sleep"
    ash.anim_talk = "sleep"
    maura.anim_talk = "sleep"
    maura.anim_stand = "sleep"
    ash.z = 2 
    PTPauseGame()
    PTOnFastForwardWhileGrabbed(function ()
        PTRadSetPosition(6, 0)
        PTSwitchRoom("cabin", true)
    end)

    PTStartThread("intro_camera", intro_camera)
end)

PTOnRoomExit("intro", function ()
    PTOnFastForwardWhileGrabbed()
    PTStopThread("intro_camera", true)
    PTReleaseInput()
end)


intro_scene = function ()
    PTGrabInput()
    PTSetActorWaitAfterTalk(false);
    PTRoomUpdateDepth(PTCurrentRoom())

    PTSleep(1000);
    
    PTActorTalk(maura, "z")
    PTActorTalk(ash, "z")
    PTSleep(150)
    PTActorTalk(maura, "zz")
    PTActorTalk(ash, "zz")
    PTSleep(150)
    PTActorTalk(maura, "zzz")
    PTActorTalk(ash, "zzz")
    PTSleep(150)
    PTActorTalk(maura, "zzzz")
    PTActorTalk(ash, "zzzz")
    PTSleep(150)
    PTActorTalk(maura, "zzzzz");
    PTActorTalk(ash, "zzzzz");
    PTSleep(1500);
    PTActorSilence(maura);
    PTActorSilence(ash);
    PTRadSetPosition(9, 0);

    PTSleep(1000);

    PTActorTalk(maura, "z")
    PTActorTalk(ash, "z")
    PTSleep(150)
    PTActorTalk(maura, "zz")
    PTActorTalk(ash, "zz")
    PTSleep(150)
    PTActorTalk(maura, "zzz")
    PTActorTalk(ash, "zzz")
    PTSleep(150)
    PTActorTalk(maura, "zzzz")
    PTActorTalk(ash, "zzzz")
    PTSleep(150)
    PTActorTalk(maura, "zzzzz");
    PTActorTalk(ash, "zzzzz");
    PTSleep(1500);
    PTActorSilence(maura);
    PTActorSilence(ash);
    maura.anim_talk = "talk"
    maura.anim_stand = "lie"
    PTActorSetAnimation(maura, "wakeup", 0)
    PTSleep(1000);
    
    PTActorTalk(ash, "z")
    PTSleep(150)
    PTActorTalk(ash, "zz")
    PTSleep(150)
    PTActorTalk(ash, "zzz")
    PTSleep(150)
    PTActorTalk(ash, "zzzz")
    PTSleep(200)
    PTActorTalk(ash, "zzzzz");
    PTSleep(3000);
    PTActorSilence(ash);
 
    PTSetActorWaitAfterTalk(true);
    PTActorTalk(maura, "mmhm? hey Ash. Ash.");
    PTActorTalk(maura, "Do you hear that?");
    PTActorSleep(ash, 1500);
    PTActorTalk(ash, "no. go back to sleep");
    
    PTSetActorWaitAfterTalk(false);
    PTActorTalk(ash, "z")
    PTSleep(200)
    PTActorTalk(ash, "zz")
    PTSleep(200)
    PTActorTalk(ash, "zzz")
    PTSleep(200)
    PTActorTalk(ash, "zzzz")
    PTSleep(200)
    PTActorTalk(ash, "zzzzz");
    PTSleep(200)
    PTActorSilence(ash);
    PTSetActorWaitAfterTalk(true);

    PTActorTalk(maura, "ASH.");
    PTActorTalk(maura, "There's no engine noise!");
    PTActorTalk(maura, "Isn't that bad??");
    PTActorSleep(ash, 1000);
    PTActorTalk(ash, "I guess? Sucks for the engineer.");
    PTActorSleep(maura, 1000);
    PTActorTalk(maura, "YOU'RE the engineer. It's just us two!");
    PTActorSleep(ash, 1000);
    PTActorTalk(ash, "Oh.");
    PTActorSleep(ash, 2000);
    PTActorTalk(ash, "It's pretty cold out. Maybe it'll fix itself?");
    -- swoosh anim
    PTSpriteSetAnimation(cabin_covers_spr, "winding", 0)
    PTActorSetAnimation(maura, "rotate", 0)
    PTActorSetAnimation(ash, "get_up", 0)
    PTSetRoomWaitAfterTalk(false);
    PTRoomTalk(ash.x + ash.talk_x, ash.y + ash.talk_y, "no", ash.talk_font, ash.talk_colour);
    PTSleep(150)
    PTRoomTalk(ash.x + ash.talk_x, ash.y + ash.talk_y, "nono", ash.talk_font, ash.talk_colour);
    PTSleep(150)
    PTRoomTalk(ash.x + ash.talk_x, ash.y + ash.talk_y, "nonono", ash.talk_font, ash.talk_colour);
    PTSleep(150)
    PTRoomTalk(ash.x + ash.talk_x, ash.y + ash.talk_y, "nononono", ash.talk_font, ash.talk_colour);
    PTSleep(150)
    PTRoomTalk(ash.x + ash.talk_x, ash.y + ash.talk_y, "nononononAAA", ash.talk_font, ash.talk_colour);
    PTSleep(150)
    PTRoomTalk(ash.x + ash.talk_x, ash.y + ash.talk_y, "nononononAAAAAAA", ash.talk_font, ash.talk_colour);
    PTSleep(150)
    PTRoomTalk(ash.x + ash.talk_x, ash.y + ash.talk_y, "nononononAAAAAAAAAH", ash.talk_font, ash.talk_colour);
    PTSleep(1000)
    PTRoomSilence();
    PTSetRoomWaitAfterTalk(true);
    PTSpriteSetAnimation(cabin_covers_spr, "wound", 0)
    PTActorTalk(maura, "There, now you're thermally adjusted.");
    PTActorTalk(maura, "Sort it out and you can have your blankets back.");
    PTActorSetAnimation(ash, "dress", 0)
    -- dressing animation
    PTRoomTalk(ash.x + ash.talk_x, ash.y + ash.talk_y, "*grumble* *shiver*", ash.talk_font, ash.talk_colour);
    PTWaitForAnimation(ash.sprite.animations[ash.sprite.anim_index])
    ash.z = 0
    PTActorSetAnimation(ash, "stand", 0)
    ash.anim_stand = "stand"
    ash.anim_talk = "talk"

    PTRoomUpdateDepth(PTCurrentRoom())
    -- overlay
    PTActorSetAnimation(maura, "lie", 0)
    PTReleaseInput()
    PTOnFastForwardWhileGrabbed(nil)
    PTOnTalkSkipWhileGrabbed(nil)
    inv_bg.visible = true
    PTStartThread("control_hints", ShowControlHints)
    PTRadLoad("assets/bgm.rad")
    PTRadPlay()
    -- Hotpatch PTActorTalk to update the score table
    PTActorTalk = TalkScore
end

