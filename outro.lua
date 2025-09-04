
lifefloat_bg = PTBackground(PTImage("assets/endgame/lifeflt.png", 19, 24), 182, 59, -5) 
PTRoomAddObject(cabin_room, lifefloat_bg)

weevil_drop = function (start_delay, grate_offset, land_delay, fuzz)
    PTSleep(start_delay)
    local weevil = PTBackground(img_weevil, 208+grate_offset, 32, 0)
    PTRoomAddObject(cabin_room, weevil)
    PTMoveObjectRelative(weevil, 0, 8-fuzz, 500, "ease-in")
    PTWaitForMoveObject(weevil)
    PTSleep(land_delay)
    PTMoveObjectRelative(weevil, -grate_offset-fuzz, 0, 500, "linear")
    PTWaitForMoveObject(weevil)
    PTMoveObjectRelative(weevil, 0, 48, 3000, "linear")
    PTWaitForMoveObject(weevil)
    PTMoveObjectRelative(weevil, -14, 0, 1500, "linear")
    PTWaitForMoveObject(weevil)
    PTRoomRemoveObject(cabin_room, weevil)
end

end_scene = function()
    PTActorTalk = TalkOrig
    PTSwitchRoom("cabin")
    PTSpriteSetAnimation(cabin_covers_spr, "open", 0)
    inv_bg.visible = false
    mouseover_text.visible = false
    PTRadStop()
    PTSleep(300)
    PTPCSpeakerPlayData(PCSPK_CLANG1)
    PTSleep(700)
    PTPCSpeakerPlayData(PCSPK_CLANG2)
    PTSleep(700)
    PTPCSpeakerPlayData(PCSPK_CLANG3)
    PTSleep(700)
    PTPCSpeakerPlayData(PCSPK_CLANG4)
    PTSleep(1500)
    PTPCSpeakerPlayData(PCSPK_MEGADRAG)
    PTSleep(3000)
    PTPCSpeakerPlayData(PCSPK_KEYPAD)
    PTSleep(500)
    PTPCSpeakerPlayData(PCSPK_KEYPAD)
    PTSleep(200)
    PTPCSpeakerPlayData(PCSPK_KEYPAD)
    PTSleep(200)
    PTPCSpeakerPlayData(PCSPK_KEYPAD)
    PTSleep(250)
    PTPCSpeakerPlayData(PCSPK_KEYPAD)
    PTSleep(225)
    PTPCSpeakerPlayData(PCSPK_KEYPAD)
    PTSleep(1000)
    PTPCSpeakerPlayData(PCSPK_KEYPAD_SUCCESS)
    PTSleep(1000)
    PTPCSpeakerPlayData(PCSPK_WHOOSH)
    PTSleep(3000)
    -- FIXME: animation of maura looking shocked
    -- FIXME: sound effects: various punches, dragging, sound of airlock being opened and shut
    PTActorSetRoom(ash, cabin_room, cabin_door_bg.x, cabin_door_bg.y)
    PTActorSetAnimation(ash, "stand", 270)

    PTActorTalk(maura, "Anything I should be worried about?")
    PTActorTalk(ash, "That was the Nobel Committee.")
    PTActorTalk(ash, "Here to deliver my prize for Outstanding Achievements in the Field of Ship Repair.")
    PTActorSetWalk(ash, bedside_x, bedside_y)
    PTActorTalk(maura, "Congratulations!")
    PTActorTalk(maura, "May I see it?")
    PTWaitForActor(ash)
    PTMoveObjectRelative(lifefloat_bg, -170, -5, 10000, PTLinear())
    PTActorSleep(ash, 1000)
    PTActorTalk(ash, "I, uh... turned them down.")
    PTActorTalk(ash, "On principle!")
    PTActorTalk(ash, "Economics is not a science.")
    ash.z = 2
    PTRoomUpdateDepth(PTCurrentRoom())
    PTSpriteSetAnimation(cabin_covers_spr, "closing", 0)
    PTActorSetAnimation(ash, "undress", 0)
    PTActorSleep(maura, 1000)
    PTActorTalk(maura, "That's a shame, I think your portrait would have looked nice next to the war criminals.")
    PTWaitForAnimation(ash.sprite.animations[ash.sprite.anim_index])
    ash.anim_stand = "bed"
    ash.anim_talk = "bed_talk"

    PTActorTalk(ash, "Aww, that's sweet. You really think so?")
    PTActorSleep(maura, 2000)
    if PTThreadInFastForward() then
        lifefloat_bg.visible = false
    end
    PTFastForward(false)
    maura.anim_talk = nil
    maura.anim_stand = nil
    PTActorSetAnimation(maura, "face", 0)
    PTActorSetAnimation(ash, "face", 0)
    PTRadLoad("assets/bgm.rad")
    PTRadSetPosition(24, 0)
    PTRadPlay()
    PTSetActorWaitAfterTalk(false)
    PTActorTalk(maura, "You're quite odd sometimes.", nil, nil, 2000)
    PTSleep(2000)
    PTActorTalk(maura, "It's very endearing.", nil, nil, 2000)
    PTSleep(2000)
    -- hack to make them kiss
    PTActorSetAnimation(ash, "kiss", 0)
    local ash_anim = ash.sprite.animations[ash.sprite.anim_index]
    local maura_anim = maura.sprite.animations[maura.sprite.anim_index]
    local ash_frame = ash_anim.frames[ash_anim.current_frame]
    local maura_frame = maura_anim.frames[maura_anim.current_frame]
    local ax, ay = PTGetImageOrigin(ash_frame)
    local mx, my = PTGetImageOrigin(maura_frame)
    local offs = {1, 2, 3, 3, 2}
    for i=1, #offs do
        PTSetImageOrigin(ash_frame, ax+offs[i], ay-offs[i])
        PTSetImageOrigin(maura_frame, mx-offs[i], my+offs[i])
        PTSleep(1000)
    end
    PTActorTalk(maura, "Aaack! Who gave you permission to be freezing???", nil, nil, 4000)
    PTSleep(1000)
    PTStartThread("weevil_drop1", weevil_drop, 0, 3, 3500, 1)
    PTStartThread("weevil_drop2", weevil_drop, 1000, 11, 3000, 2)
    PTStartThread("weevil_drop3", weevil_drop, 1500, 8, 3000, 0)
    PTStartThread("weevil_drop4", weevil_drop, 3000, 2, 1000, 3)
    PTStartThread("weevil_drop5", weevil_drop, 3500, 3, 1000, 1)
    PTStartThread("weevil_drop6", weevil_drop, 4000, 9, 500, 0)
    PTStartThread("weevil_drop7", weevil_drop, 4250, 1, 500, 3)
    PTStartThread("weevil_drop8", weevil_drop, 5000, 5, 250, 1)
    PTStartThread("weevil_drop9", weevil_drop, 5500, 12, 250, 2)
    PTStartThread("weevil_drop10", weevil_drop, 6000, 4, 250, 1)
    PTStartThread("weevil_drop11", weevil_drop, 6250, 1, 250, 3)
    PTStartThread("weevil_drop12", weevil_drop, 6500, 4, 250, 0)
    PTStartThread("weevil_drop13", weevil_drop, 7000, 9, 250, 1)
    PTStartThread("weevil_drop14", weevil_drop, 7250, 2, 250, 3)
    PTStartThread("weevil_drop15", weevil_drop, 7500, 7, 250, 2)
    PTStartThread("weevil_drop16", weevil_drop, 8000, 3, 250, 0)
    PTSleep(3000)
    PTSetImageOrigin(ash_frame, ax+3, ay-3)
    PTSetImageOrigin(maura_frame, mx-3, my+3)
    PTSleep(3000)
    PTSetImageOrigin(ash_frame, ax+2, ay-2)
    PTSetImageOrigin(maura_frame, mx-2, my+2)
    PTSleep(3000)
    PTReleaseInput()
    PTSwitchRoom("credits") 
end


credits_room = PTRoom("credits", 320, 200)
PTAddRoom(credits_room)


credits_end = PTBackground(PTText("END", font, 80, "center", { 0xed, 0xb1, 0x00 }), 160, 70, 0)
PTSetImageOriginSimple(credits_end.image, "bottom")
credits_end.visible = false
credits_score = PTBackground(nil, 160, 100, 0) 
credits_rank = PTBackground(nil, 160, 130, 0)

credits_title = PTBackground(
    PTText("Maura & Ash\n\nA game by Scott Percival", font, 240, "center", { 0xed, 0xb1, 0x00 }),
    160, 240, 0
)
PTSetImageOriginSimple(credits_title.image, "bottom")

credits_testers = PTBackground(
    PTText("Testing squad:\n\nLiam\nMaddie\nNonk\nJack\nKyle\nFab\nAdon\nRaal\nand Ash", font, 120, "center", { 0xed, 0xb1, 0x00 }),
    160, 400, 0
)
PTSetImageOriginSimple(credits_testers.image, "bottom")


credits_copyright = PTBackground(
    PTText("(C) 2025 moralrecordings\n\nhttps://moral.net.au\n\n\n\nMade with the Perentie engine\n\nhttps://moral.net.au/perentie", font, 240, "center", {0xed, 0xb1, 0x00}),
    160, 600, 0 
)
PTSetImageOriginSimple(credits_copyright.image, "bottom")

ps_offset = 800

credits_ps1 = PTBackground(
    PTText("Trans rights are human rights.", font, 320, "center", { 0xed, 0xb1, 0x00 }),
    160, ps_offset, 0
)
PTSetImageOriginSimple(credits_ps1.image, "bottom")
credits_ps2 = PTBackground(
    PTText("Poverty is a government policy choice.", font, 320, "center", { 0xed, 0xb1, 0x00 }),
    160, ps_offset+SCREEN_HEIGHT/2, 0
)
PTSetImageOriginSimple(credits_ps2.image, "bottom")
 credits_ps3 = PTBackground(
    PTText("Surveillance capitalism will end.", font, 320, "center", { 0xed, 0xb1, 0x00 }),
    160, ps_offset+SCREEN_HEIGHT, 0
)
PTSetImageOriginSimple(credits_ps3.image, "bottom")
 credits_ps4 = PTBackground(
    PTText("Palestine will be free.", font, 320, "center", { 0xed, 0xb1, 0x00 }),
    160, ps_offset+SCREEN_HEIGHT*3/2, 0
)
PTSetImageOriginSimple(credits_ps4.image, "bottom")
 

credits_group = PTGroup({
    credits_end, 
    credits_score,
    credits_rank,
    credits_title,
    credits_copyright,
    credits_testers,
    credits_ps1,
    credits_ps2,
    credits_ps3,
    credits_ps4,
}, 0, 0, 0)

PTRoomAddObject(credits_room, credits_group)

credits_scene = function ()
    PTGrabInput()
    inv_bg.visible = false
    mouseover_text.visible = false
    PTSleep(3000)
    PTRadLoad("assets/outro.rad")
    PTRadPlay()
    credits_end.visible = true
    PTSleep(6300)
    credits_score.image = PTText(string.format("Final score: %d of %d", score_counter, MAX_SCORE), font, 240, "center", {0xed, 0xb1, 0x00})
    PTSetImageOriginSimple(credits_score.image, "bottom")
    PTSleep(6300)
    credits_rank.image = PTText(string.format("Ranking: %s", GetRanking()), font, 320, "center", {0xed, 0xb1, 0x00})
    PTSetImageOriginSimple(credits_rank.image, "bottom")
    PTSleep(12600)
    PTMoveObjectRelative(credits_group, 0, -16-ps_offset-3*SCREEN_HEIGHT/2, 60000)
    PTWaitForMoveObject(credits_group)
    PTRadFadeOut(4000)
    PTSleep(8000)
    PTReset()
end

PTOnRoomLoad("credits", function ()
    PTRadStop()
    PTStartThread("credits_scene", credits_scene)
    PTOnFastForwardWhileGrabbed(function ()
        PTReset()
    end)
end)

PTOnRoomUnload("credits", function ()
    PTStopThread("credits", true, true)
end)


