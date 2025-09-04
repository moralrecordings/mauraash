-- Goes without saying, but this file is nothing but spoilers for the game.

local vars = PTVars()

bridge_room = PTRoom("bridge", 600, 200)
PTAddRoom(bridge_room)

------------
-- bridge --
------------
bridge_bg = PTBackground(PTImage("assets/bridge/bridge.png", 270, 200), 300, 200, -8)
bridge_fg_bg = PTBackground(PTImage("assets/bridge/fg.png", 94, 42), 285, 166, 10)
bridge_fg_bg.parallax_x = 1.15

bridge_space_bg = PTBackground(PTImage("assets/bridge/space.png", 160, 200), 160, 200, -10)
bridge_space_bg.parallax_x = 0


bridge_rock1_bg = PTBackground(PTImage("assets/bridge/rock1.png", 11, 18), -300, 0, -9)
bridge_rock2_bg = PTBackground(PTImage("assets/bridge/rock2.png", 19, 21), -300, 0, -9)
bridge_rock3_bg = PTBackground(PTImage("assets/bridge/rock3.png", 17, 32), -300, 0, -9)
bridge_comet_bg = PTBackground(PTImage("assets/bridge/comet.png", 4, 26), 340, -14, -9)
bridge_rocks = {bridge_rock1_bg, bridge_rock2_bg, bridge_rock3_bg}


bridge_coffee_bg = PTBackground(PTImage("assets/bridge/coffee.png", 14, 29), 499, 98, -5)
bridge_coffee_bg.collision = true
bridge_coffee_bg.name = "espresso machine"
bridge_coffee_bg.hotspot_id = "espresso machine"
bridge_coffee_bg.facing = 90

bridge_sink_bg = PTBackground(PTImage("assets/bridge/sink.png", 14, 17), 514, 111, -4)
bridge_sink_bg.collision = true
bridge_sink_bg.name = "sink"
bridge_sink_bg.hotspot_id = "sink"
bridge_sink_bg.facing = 90

bridge_kdoorc_bg = PTBackground(PTImage("assets/bridge/kdoorc.png", -20, 50), 474, 154, -3)
bridge_kdoorc_bg.collision = true
bridge_kdoorc_bg.name = "cupboard"
bridge_kdoorc_bg.hotspot_id = "cupboard"
bridge_kdoorc_bg.facing = 90
bridge_kdooro_bg = PTBackground(PTImage("assets/bridge/kdooro.png", 12, 38), 497, 153, 2)
bridge_kdooro_bg.visible = false

bridge_diaglit = PTImage("assets/bridge/diaglit.png", 2, 3)
bridge_diag_lights = {
    PTBackground(bridge_diaglit, 269, 80),
    PTBackground(bridge_diaglit, 269, 76),
    PTBackground(bridge_diaglit, 269, 72),
    PTBackground(bridge_diaglit, 269, 68),
    PTBackground(bridge_diaglit, 269, 64),
    PTBackground(bridge_diaglit, 269, 60)
}
bridge_diag_lightgrp = PTGroup(bridge_diag_lights, 0, 0, 0, 0, 0)

bridge_diagon_bg = PTBackground(PTImage("assets/bridge/diagon.png", 24, 34), 235, 95, -4)
bridge_diagon_bg.visible = false
bridge_diag_bg = PTBackground(PTImage("assets/bridge/diag.png", 35, 82), 242, 137, -5)
bridge_diag_bg.collision = true
bridge_diag_bg.name = "diagnostic terminal"
bridge_diag_bg.hotspot_id = "diagnostic terminal"
bridge_diag_bg.facing = 0
bridge_panelon_bg = PTBackground(PTImage("assets/bridge/panelon.png", 32, 26), 323, 80, -6)
bridge_panelon_bg.visible = false
bridge_panelon_bg.collision = true
bridge_panelon_bg.name = "instrument monitors"
bridge_panelon_bg.hotspot_id = "instrument monitors"
bridge_panelon_bg.facing = 0

bridge_part_bg = PTBackground(PTImage("assets/bridge/part.png", 4, 114), 392, 164, 2)

bridge_poweroff_bg = PTBackground(PTImage("assets/bridge/poweroff.png", 9, 27), 368, 83, -6)
bridge_poweroff_bg.name = "emergency power relay"
bridge_poweroff_bg.hotspot_id = "emergency power relay"
bridge_poweroff_bg.facing = 0
bridge_poweroff_bg.collision = true
bridge_poweron_bg = PTBackground(PTImage("assets/bridge/poweron.png", 9, 27), 368, 83, -6)
bridge_poweron_bg.visible = false
bridge_poweron_bg.name = "emergency power relay"
bridge_poweron_bg.hotspot_id = "emergency power relay"
bridge_poweron_bg.facing = 0
bridge_poweron_bg.collision = true
bridge_ppanelc_bg = PTBackground(PTImage("assets/bridge/ppanelc.png", 10, 27), 369, 83, -5)
bridge_ppanelc_bg.name = "emergency power box"
bridge_ppanelc_bg.hotspot_id = "emergency power box"
bridge_ppanelc_bg.facing = 0
bridge_ppanelc_bg.collision = true
bridge_ppanelo_bg = PTBackground(PTImage("assets/bridge/ppanelo.png", 2, 27), 380, 84, -5)
bridge_ppanelo_bg.visible = false
bridge_ppanelo_bg.name = "emergency power box"
bridge_ppanelo_bg.hotspot_id = "emergency power box"
bridge_ppanelo_bg.facing = 0
bridge_ppanelo_bg.collision = true

bridge_cockbase_bg = PTBackground(PTImage("assets/bridge/cockbase.png", 49+12, 32-20), 105+12, 134-20, -5)
bridge_cockbase_bg.name = "cockpit controls"
bridge_cockbase_bg.hotspot_id = "cockpit controls"
bridge_cockbase_bg.facing = 270
bridge_cockbase_bg.collision = true
bridge_cockon_bg = PTBackground(PTImage("assets/bridge/cockon.png", 35, 21), 93, 125, -4)
bridge_cockon_bg.visible = false
bridge_seatcplt_bg = PTBackground(PTImage("assets/bridge/seatcplt.png", 18, 70), 106, 158, -2)
bridge_seatcplt_bg.collision = true
bridge_seatcplt_bg.name = "copilot seat"
bridge_seatcplt_bg.hotspot_id = "copilot seat"
bridge_seatcplt_bg.facing = 270
bridge_seatplt_bg = PTBackground(PTImage("assets/bridge/seatplt.png", 18+16, 70-16), 132+16, 142-16, -3)
bridge_seatplt_bg.collision = true
bridge_seatplt_bg.name = "pilot seat"
bridge_seatplt_bg.hotspot_id = "pilot seat"
bridge_seatplt_bg.facing = 270
bridge_books_bg = PTBackground(PTImage("assets/bridge/books.png", 7, 14), 174, 107, -7)
bridge_stein_bg = PTBackground(PTImage("assets/bridge/stein.png", 3, 8), 160, 105, -7)
bridge_stein_bg.collision = true
bridge_stein_bg.name = "stein"
bridge_stein_bg.hotspot_id = "stein on bridge"
bridge_stein_bg.facing = 0

bridge_tocabin_bg = PTBackground(PTImage("assets/bridge/tocabin.png", 19, 77), 425, 131, -7)
bridge_tocabin_bg.name = "cabin passage"
bridge_tocabin_bg.hotspot_id = "cabin passage"
bridge_tocabin_bg.facing = 0
bridge_tocabin_bg.collision = true
bridge_toreact_bg = PTBackground(PTImage("assets/bridge/toreact.png", 22, 8), 445, 171, -7)
bridge_toreact_bg.name = "maintenance passage"
bridge_toreact_bg.hotspot_id = "reactor passage"
bridge_toreact_bg.facing = 180
bridge_toreact_bg.collision = true

bridge_wdoor0o_bg = PTBackground(PTImage("assets/bridge/wdoor0o.png", 12, 47), 295, 138, -5)
bridge_wdoor0o_bg.collision = true
bridge_wdoor0o_bg.hotspot_id = "instrument bank 1 door"
bridge_wdoor0o_bg.name = "instrument bank door"
bridge_wdoor0o_bg.facing = 0
bridge_wdoor0o_bg.visible = false
bridge_wdoor0sh_bg = PTBackground(PTImage("assets/bridge/wdoor0sh.png", 12, 47), 295, 138, -5)
bridge_wdoor0sh_bg.collision = true
bridge_wdoor0sh_bg.hotspot_id = "instrument bank 1 door"
bridge_wdoor0sh_bg.name = "instrument bank door"
bridge_wdoor0sh_bg.facing = 0
bridge_wdoor1o_bg = PTBackground(PTImage("assets/bridge/wdoor1o.png", 12, 47), 319, 138, -5)
bridge_wdoor1o_bg.collision = true
bridge_wdoor1o_bg.hotspot_id = "instrument bank 2 door"
bridge_wdoor1o_bg.name = "instrument bank door"
bridge_wdoor1o_bg.facing = 0
bridge_wdoor1o_bg.visible = false
bridge_wdoor1sh_bg = PTBackground(PTImage("assets/bridge/wdoor1sh.png", 12, 47), 319, 138, -5)
bridge_wdoor1sh_bg.collision = true
bridge_wdoor1sh_bg.hotspot_id = "instrument bank 2 door"
bridge_wdoor1sh_bg.name = "instrument bank door"
bridge_wdoor1sh_bg.facing = 0
bridge_wdoor2o_bg = PTBackground(PTImage("assets/bridge/wdoor2o.png", 12, 47), 344, 138, -5)
bridge_wdoor2o_bg.collision = true
bridge_wdoor2o_bg.hotspot_id = "instrument bank 3 door"
bridge_wdoor2o_bg.name = "instrument bank door"
bridge_wdoor2o_bg.facing = 0
bridge_wdoor2o_bg.visible = false
bridge_wdoor2sh_bg = PTBackground(PTImage("assets/bridge/wdoor2sh.png", 12, 47), 344, 138, -5)
bridge_wdoor2sh_bg.collision = true
bridge_wdoor2sh_bg.hotspot_id = "instrument bank 3 door"
bridge_wdoor2sh_bg.name = "instrument bank door"
bridge_wdoor2sh_bg.facing = 0
bridge_wdoor3o_bg = PTBackground(PTImage("assets/bridge/wdoor3o.png", 12, 47), 369, 138, -5)
bridge_wdoor3o_bg.collision = true
bridge_wdoor3o_bg.hotspot_id = "instrument bank 4 door"
bridge_wdoor3o_bg.name = "instrument bank door"
bridge_wdoor3o_bg.facing = 0
bridge_wdoor3o_bg.visible = false
bridge_wdoor3sh_bg = PTBackground(PTImage("assets/bridge/wdoor3sh.png", 12, 47), 369, 138, -5)
bridge_wdoor3sh_bg.collision = true
bridge_wdoor3sh_bg.hotspot_id = "instrument bank 4 door"
bridge_wdoor3sh_bg.name = "instrument bank door"
bridge_wdoor3sh_bg.facing = 0
bridge_wdoor = {
    {bridge_wdoor0sh_bg, bridge_wdoor0o_bg},
    {bridge_wdoor1sh_bg, bridge_wdoor1o_bg},
    {bridge_wdoor2sh_bg, bridge_wdoor2o_bg},
    {bridge_wdoor3sh_bg, bridge_wdoor3o_bg},
}

bridge_wire_img = {
    PTImage("assets/bridge/wire0.png", 12, 39),
    PTImage("assets/bridge/wire1.png", 12, 39),
    PTImage("assets/bridge/wire2.png", 12, 39),
    PTImage("assets/bridge/wire3.png", 12, 39),
}

bridge_wire0_bg = PTBackground(nil, 295, 130, -7)
bridge_wire1_bg = PTBackground(nil, 320, 130, -7)
bridge_wire2_bg = PTBackground(nil, 345, 130, -7)
bridge_wire3_bg = PTBackground(nil, 370, 130, -7)
bridge_wire_bg = {bridge_wire0_bg, bridge_wire1_bg, bridge_wire2_bg, bridge_wire3_bg}

img_panliter = PTImage("assets/bridge/panliter.png", -9, 37)
img_panliton = PTImage("assets/bridge/panliton.png", -9, 37)
bridge_light0_bg = PTBackground(img_panliton, 295, 130, -6)
bridge_light1_bg = PTBackground(img_panliton, 320, 130, -6)
bridge_light2_bg = PTBackground(img_panliton, 345, 130, -6)
bridge_light3_bg = PTBackground(img_panliton, 370, 130, -6)
bridge_light_bg = {bridge_light0_bg, bridge_light1_bg, bridge_light2_bg, bridge_light3_bg}

img_weevil = PTImage("assets/weevil.png")
bridge_weevils_group = PTGroup({
    PTBackground(img_weevil, 3, 5, 0),
    PTBackground(img_weevil, 5, 15, 0),
    PTBackground(img_weevil, 8, 4, 0),
    PTBackground(img_weevil, 7, 14, 0),
    PTBackground(img_weevil, 10, 6, 0),
    PTBackground(img_weevil, 11, 13, 0),
    PTBackground(img_weevil, 16, 5, 0),
    PTBackground(img_weevil, 17, 14, 0)
}, 0, 0, -6, 0, 0)
bridge_weevils_group.visible = false

bridge_wirerep_bg = PTBackground(PTImage("assets/bridge/wirerep.png", 11, 44), 0, 0, -6)
bridge_wirerep_bg.visible = false

bridge_wiremask_bg = PTBackground(PTImage("assets/bridge/wiremask.png", 12, 46), 0, 0, -7)
bridge_wiremask_bg.hotspot_id = "space weevils"
bridge_wiremask_bg.name = "weevils"
bridge_wiremask_bg.visible = false
bridge_wiremask_bg.facing = 0


-- coffee machine overlay
vars.cof_kn_state = 2
cof_kn_names = {
    "strength knob (minimum)",
    "strength knob (ideal)",
    "strength knob (maximum)",
}
cof_bg_bg = PTBackground(PTImage("assets/bridge/cof_bg.png", 46, 99), 50, 103, 0)
cof_head_bg = PTBackground(PTImage("assets/bridge/cof_head.png", 31, 40), 50, 57, 4)
cof_head_bg.collision = true
cof_kn_img = {
    PTImage("assets/bridge/cof_kn1.png", 3, 7),
    PTImage("assets/bridge/cof_kn2.png", 3, 7),
    PTImage("assets/bridge/cof_kn3.png", 3, 7)
}
cof_kn_bg = PTBackground(cof_kn_img[vars.cof_kn_state], 57, 38, 5)
cof_kn_bg.collision = true
cof_kn_bg.name = cof_kn_names[vars.cof_kn_state]
cof_kn_bg.hotspot_id = "strength knob"
cof_mach_bg = PTBackground(PTImage("assets/bridge/cof_mach.png", 32, 73), 50, 90, 1)
cof_mach_bg.collision = true
cof_mach_bg.name = "espresso machine"
cof_mach_bg.hotspot_id = "espresso closeup"
cof_stn_bg = PTBackground(PTImage("assets/bridge/cof_stn.png", 10, 34), 54, 79, 3)
cof_stn_bg.visible = false
cof_splash_bg = PTBackground(PTImage("assets/bridge/splash.png", 12, 10), 50, 75, 2)
cof_splash_bg.visible = false
cof_steam_bg = PTBackground(PTImage("assets/bridge/steam.png", 13, 12), 47, 60, 12)
cof_steam_bg.visible = false
cof_hands_bg = PTBackground(PTImage("assets/bridge/hands.png", 14, 39), 47, 99, 11)
cof_hands_bg.visible = false


cof_panel = PTPanel(panel_img, -1000, -1000, 100, 107)
cof_panel.z = 5
cof_panel.visible = false
cof_mach_group = PTGroup({cof_head_bg, cof_kn_bg, cof_mach_bg, cof_stn_bg, cof_splash_bg}, 0, 0, 10, 0, 0)
cof_group = PTGroup({cof_bg_bg, cof_mach_group, cof_steam_bg, cof_hands_bg}, 0, 0, 10, 0, 0)

PTPanelAddObject(cof_panel, cof_group)


PTRoomAddObject(bridge_room, bridge_bg)
PTRoomAddObject(bridge_room, bridge_fg_bg)
PTRoomAddObject(bridge_room, bridge_space_bg)

PTRoomAddObject(bridge_room, bridge_rock1_bg)
PTRoomAddObject(bridge_room, bridge_rock2_bg)
PTRoomAddObject(bridge_room, bridge_rock3_bg)
PTRoomAddObject(bridge_room, bridge_comet_bg)

PTRoomAddObject(bridge_room, bridge_coffee_bg)
PTRoomAddObject(bridge_room, bridge_sink_bg)

PTRoomAddObject(bridge_room, bridge_kdoorc_bg)
PTRoomAddObject(bridge_room, bridge_kdooro_bg)

PTRoomAddObject(bridge_room, bridge_diag_lightgrp)

PTRoomAddObject(bridge_room, bridge_diagon_bg)
PTRoomAddObject(bridge_room, bridge_diag_bg)
PTRoomAddObject(bridge_room, bridge_panelon_bg)

PTRoomAddObject(bridge_room, bridge_part_bg)

PTRoomAddObject(bridge_room, bridge_poweroff_bg)
PTRoomAddObject(bridge_room, bridge_poweron_bg)
PTRoomAddObject(bridge_room, bridge_ppanelc_bg)
PTRoomAddObject(bridge_room, bridge_ppanelo_bg)

PTRoomAddObject(bridge_room, bridge_cockbase_bg)
PTRoomAddObject(bridge_room, bridge_cockon_bg)
PTRoomAddObject(bridge_room, bridge_seatcplt_bg)
PTRoomAddObject(bridge_room, bridge_seatplt_bg)
PTRoomAddObject(bridge_room, bridge_books_bg)
PTRoomAddObject(bridge_room, bridge_stein_bg)

PTRoomAddObject(bridge_room, bridge_wdoor0o_bg)
PTRoomAddObject(bridge_room, bridge_wdoor0sh_bg)
PTRoomAddObject(bridge_room, bridge_wdoor1o_bg)
PTRoomAddObject(bridge_room, bridge_wdoor1sh_bg)
PTRoomAddObject(bridge_room, bridge_wdoor2o_bg)
PTRoomAddObject(bridge_room, bridge_wdoor2sh_bg)
PTRoomAddObject(bridge_room, bridge_wdoor3o_bg)
PTRoomAddObject(bridge_room, bridge_wdoor3sh_bg)

PTRoomAddObject(bridge_room, bridge_wire0_bg)
PTRoomAddObject(bridge_room, bridge_wire1_bg)
PTRoomAddObject(bridge_room, bridge_wire2_bg)
PTRoomAddObject(bridge_room, bridge_wire3_bg)

PTRoomAddObject(bridge_room, bridge_light0_bg)
PTRoomAddObject(bridge_room, bridge_light1_bg)
PTRoomAddObject(bridge_room, bridge_light2_bg)
PTRoomAddObject(bridge_room, bridge_light3_bg)

PTRoomAddObject(bridge_room, bridge_weevils_group)
PTRoomAddObject(bridge_room, bridge_wiremask_bg)
PTRoomAddObject(bridge_room, bridge_wirerep_bg)

PTRoomAddObject(bridge_room, bridge_tocabin_bg)
PTRoomAddObject(bridge_room, bridge_toreact_bg)

PTRoomAddObject(bridge_room, cof_panel)

wb_kitchen = {
    PTWalkBox(PTPoint(405, 132), PTPoint(471, 132), PTPoint(493, 155), PTPoint(405, 155), 0),
    PTWalkBox(PTPoint(376, 139), PTPoint(405, 139), PTPoint(405, 150), PTPoint(376, 150), 0)
}
wb_bridge = {
    PTWalkBox(PTPoint(195, 139), PTPoint(376, 139), PTPoint(376, 150), PTPoint(195, 150), 0),
    PTWalkBox(PTPoint(275, 132), PTPoint(373, 132), PTPoint(375, 139), PTPoint(275, 139), 0),
    PTWalkBox(PTPoint(195, 150), PTPoint(375, 150), PTPoint(375, 155), PTPoint(195, 155), 0),
    PTWalkBox(PTPoint(161, 132), PTPoint(195, 132), PTPoint(195, 155), PTPoint(128, 155), 0)
}

PTRoomSetWalkBoxes(bridge_room, {wb_kitchen[1], wb_kitchen[2], wb_bridge[1], wb_bridge[2], wb_bridge[3], wb_bridge[4]})

PTOnRoomEnter("bridge", function (first_time)
    bridge_room.camera_actor = ash
    bridge_room.x = ash.x
    bridge_room.y = ash.y
end)

GenerateRocks = function ()
    while true do
        -- Make the weevils jiggle around
        for _, v in ipairs(bridge_weevils_group.objects) do
            PTShakeObject(v, 60000, PTSimplexShake(1, 1, 1000, 1000))
        end

        -- Pick a random delay
        PTSleep(math.random(5000, 7000))
        -- Pick a random rock
        local rock_id = math.random(1, 3)
        -- Pick a start pos, trajectory going from left to right
        bridge_rocks[rock_id].x = -64 
        bridge_rocks[rock_id].y = math.random(SCREEN_HEIGHT // 4, 3*SCREEN_HEIGHT// 4)
        -- Send the rock on its way
        PTMoveObject(bridge_rocks[rock_id], 600, math.random(SCREEN_HEIGHT // 4, 3*SCREEN_HEIGHT// 4), 8000, PTTimingFunction("linear"))
        PTWaitForMoveObject(bridge_rocks[rock_id])
    end
end

GenerateComet = function ()
    PTSleep(3000)
    PTLog("comet!!!\n")
    PTMoveObject(bridge_comet_bg, -88, 149, 1500, PTTimingFunction("linear"))
    PTWaitForMoveObject(bridge_comet_bg)
    -- move the comet back
    bridge_comet_bg.x = 340
    bridge_comet_bg.y = -14
end


vars.seen_comet = false
PTOnEnterWalkBox(wb_bridge[4], function (box, actor)
    -- If we touch the leftmost walkbox, show the comet if we
    -- haven't seen it. Otherwise there's a 4% chance it comes back.
    if not vars.seen_comet or math.random(100) < 5 then
        PTStartThread("GenerateComet", GenerateComet)
        vars.seen_comet = true
    end
end)

UpdateBridgePower = function ()
    -- power switch state
    bridge_poweron_bg.visible = vars.emergency_power_on
    bridge_poweroff_bg.visible = not vars.emergency_power_on
    -- power box open state
    bridge_ppanelo_bg.visible = vars.emergency_power_open
    bridge_ppanelo_bg.collision = vars.emergency_power_open
    bridge_ppanelc_bg.visible = not vars.emergency_power_open
    bridge_ppanelc_bg.collision = not vars.emergency_power_open

    bridge_cockon_bg.visible = vars.ship_powered_up

    local powered = vars.emergency_power_on or vars.ship_powered_up

    bridge_diagon_bg.visible = powered
    bridge_panelon_bg.visible = powered

    bridge_diag_lights[1].visible = powered and (vars.diagnostic_terminal_state ~= 1)
    bridge_diag_lights[2].visible = powered and vars.reactor_filled
    bridge_diag_lights[3].visible = powered and vars.steam_pipe_state == 2
    bridge_diag_lights[4].visible = powered
    bridge_diag_lights[5].visible = powered and vars.wiring_state == 2
    bridge_diag_lights[6].visible = powered and vars.cleaned_filter 
    bridge_light0_bg.visible = powered
    bridge_light1_bg.visible = powered
    bridge_light2_bg.visible = powered
    bridge_light3_bg.visible = powered
end
-- One of the four cabinets will have broken wiring.
-- Set the position of the sprites accordingly.
UpdateBridgeWDoor = function()
    for i = 1,4 do
        bridge_wdoor[i][1].visible = not vars.bank_door_state[i]
        bridge_wdoor[i][1].collision = not vars.bank_door_state[i]
        bridge_wdoor[i][2].visible = vars.bank_door_state[i]
        bridge_wdoor[i][2].collision = vars.bank_door_state[i]
        if vars.bank_door_order[i] ~= 0 then
            bridge_wire_bg[i].image = bridge_wire_img[vars.bank_door_order[i]]
            if vars.bank_door_order[i] == 4 then
                local origin_x, origin_y = PTGetImageOrigin(bridge_wdoor[i][1].image)
                bridge_weevils_group.visible = vars.bank_door_state[i] and (not vars.captured_weevils)
                bridge_weevils_group.x = bridge_wdoor[i][1].x - origin_x
                bridge_weevils_group.y = bridge_wdoor[i][1].y - origin_y
                bridge_wiremask_bg.x = bridge_wdoor[i][1].x
                bridge_wiremask_bg.y = bridge_wdoor[i][1].y
                bridge_wiremask_bg.collision = true
                bridge_wirerep_bg.x = bridge_wdoor[i][1].x
                bridge_wirerep_bg.y = bridge_wdoor[i][1].y
                bridge_wirerep_bg.visible = vars.wiring_state == 2
                if vars.wiring_state ~= 2 then
                    bridge_light_bg[i].image = img_panliter
                else
                    bridge_light_bg[i].image = img_panliton
                end
            end
        end
    end
    if vars.wiring_state == 0 then 
        bridge_wiremask_bg.name = "weevils"
        bridge_wiremask_bg.hotspot_id = "space weevils"
    elseif vars.wiring_state == 1 then
        bridge_wiremask_bg.name = "chewed wires"
        bridge_wiremask_bg.hotspot_id = "chewed wires"
    elseif vars.wiring_state == 2 then
        bridge_wiremask_bg.name = "bandaged wires"
        bridge_wiremask_bg.hotspot_id = "chewed wires"
    end
end


PTOnRoomLoad("bridge", function ()
    -- espresso machine knob state
    cof_kn_bg.image = cof_kn_img[vars.cof_kn_state]
    cof_kn_bg.name = cof_kn_names[vars.cof_kn_state]

    -- emergency power state
    UpdateBridgePower()
  
    -- panel door open state
    UpdateBridgeWDoor()
    -- stein availability
    bridge_stein_bg.visible = not vars.has_taken_stein
    bridge_stein_bg.collision = not vars.has_taken_stein

    UpdateEndgameBlock()

    cof_splash_bg.visible = vars.coffee_count >= 5

    -- send asteroids past the windshield every 14 seconds
    PTStartThread("GenerateRocks", GenerateRocks)

    print("bridge room load")
    if vars.graphics_mode == 3 then
        SetGraphicsMode("cga", "bridge") 
    end
end)

PTOnRoomUnload("bridge", function ()
    -- stop the asteroid movement, move the rock back
    PTStopThread("GenerateRocks", false, true)
    PTStopThread("GenerateSpit", false, true)
    bridge_rock1_bg.x = -300
    bridge_rock2_bg.x = -300
    bridge_rock3_bg.x = -300
end)


PTOnVerb("look", "cabin passage", function()
    PTActorTalk(ash, "The way back to sweet merciful bedrest.")
end)

bridge_to_cabin = function ()
    PTActorSetRoom(ash, cabin_room, cabin_door_bg.x, cabin_door_bg.y)
    PTActorSetAnimation(ash, "stand", 270)
    PTSwitchRoom("cabin")
end 
PTOnVerb("use", "cabin passage", bridge_to_cabin)
PTOnVerb2("use", "lucky wrench", "cabin passage", bridge_to_cabin)
PTOnVerb2("use", "fabric tape", "cabin passage", bridge_to_cabin)
PTOnVerb2("use", "roll of plastic", "cabin passage", bridge_to_cabin)
PTOnVerb2("use", "stein", "cabin passage", bridge_to_cabin)
PTOnVerb2("use", "cress", "cabin passage", bridge_to_cabin)


PTOnVerb("look", "reactor passage", function()
    PTActorTalk(ash, "Smells like ozone.")
end)
bridge_to_reactor = function ()
    PTActorSetRoom(ash, react_room, react_passage_bg.x, react_passage_bg.y)
    PTActorSetAnimation(ash, "stand", 90)
    PTSwitchRoom("react")
end
PTOnVerb("use", "reactor passage", bridge_to_reactor) 
PTOnVerb2("use", "lucky wrench", "reactor passage", bridge_to_reactor)
PTOnVerb2("use", "fabric tape", "reactor passage", bridge_to_reactor)
PTOnVerb2("use", "roll of plastic", "reactor passage", bridge_to_reactor)
PTOnVerb2("use", "stein", "reactor passage", bridge_to_reactor)
PTOnVerb2("use", "cress", "reactor passage", bridge_to_reactor)



PTOnVerb("look", "pilot seat", function ()
    PTActorTalk(ash, "Maura's seat.")
end)

PTOnVerb("use", "pilot seat", function ()
    PTActorTalk(ash, "I'm under orders not to change the reclining presets.")
end)

PTOnVerb2("use", "lucky wrench", "pilot seat", function()
    PTActorTalk(ash, "I'd better not, the seat might concertina shut at an inoppertune time.")
end)

PTOnVerb2("use", "fabric tape", "pilot seat", function()
    PTActorTalk(ash, "There's nothing wrong with this seat cover.")
end)

PTOnVerb2("use", "roll of plastic", "pilot seat", function()
    PTActorTalk(ash, "That joke gets old after the seventh or eighth time.")
end)

PTOnVerb2("use", "stein", "pilot seat", function()
    PTActorTalk(ash, "Bad idea, Maura is the designated driver.")
end)

PTOnVerb2("use", "cress", "pilot seat", function()
    PTActorTalk(ash, "Maura would keelhaul me if I pulled a stunt like that.")
    PTActorTalk(ash, "And she'd be right!")
end)



PTOnVerb("look", "copilot seat", function ()
    PTActorTalk(ash, "I've grown to like the Grover-skin seat covers.")
end)

PTOnVerb("use", "copilot seat", function ()
    if vars.ship_powered_up then 
        PTActorTalk(ash, "I earned my bed rest fair and square. I refuse to settle for napping here.")
    else
        PTActorTalk(ash, "The ship is adrift! No time for loafing!")
    end
end)

PTOnVerb2("use", "lucky wrench", "copilot seat", function()
    PTActorTalk(ash, "I'd better not, the seat back might fall off.")
end)

PTOnVerb2("use", "fabric tape", "copilot seat", function()
    PTActorTalk(ash, "There's only minor things wrong with this seat cover.")
end)

PTOnVerb2("use", "roll of plastic", "copilot seat", function()
    PTActorTalk(ash, "It still has a few more months of sweat absorption before it gets that bad.")
end)

PTOnVerb2("use", "stein", "copilot seat", function()
    PTActorTalk(ash, "The stein doesn't have a license.")
end)

PTOnVerb2("use", "cress", "copilot seat", function()
    PTActorTalk(ash, "This wouldn't be the first time I've considered hiding cress in the crack of the seat cushions for when times get hard.")
    PTActorTalk(ash, "Never again. Tastes foul.")
end)



PTOnVerb("look", "espresso machine", function ()
    PTActorTalk(ash, "My pride and joy.")
    PTActorTalk(ash, "Worth every amp of emergency power budget.");
end)

use_espresso = function ()
    -- open up the modal
    -- clicks on the modal shouldn't be interpreted as movement
        -- goes the same for hotspot and non-hotspot
    -- clicking outside the modal should close it and do a move
    cof_panel.x, cof_panel.y = PTScreenToRoom((SCREEN_WIDTH - 100)//2, (SCREEN_HEIGHT - 107)//2)
    OpenModal(cof_panel)
end
PTOnVerb("use", "espresso machine", use_espresso)
PTOnVerb2("use", "lucky wrench", "espresso machine", use_espresso)
PTOnVerb2("use", "fabric tape", "espresso machine", use_espresso)
PTOnVerb2("use", "roll of plastic ", "espresso machine", use_espresso)
PTOnVerb2("use", "stein", "espresso machine", use_espresso)
PTOnVerb2("use", "cress", "espresso machine", use_espresso)


PTOnVerb("look", "espresso closeup", function ()
    PTActorTalk(ash, "Filled with only the finest questionably-sourced coffee grounds.")
end)

vars.coffee_count = 0
PTOnVerb("use", "espresso closeup", function ()
    vars.coffee_count = vars.coffee_count + 1
    if vars.coffee_count == 5 then 
        PTActorSleep(ash, 500)
        PTActorTalk(ash, "Well...")
        PTActorTalk(ash, "I -am- kind of in a hurry...")
        PTActorSleep(ash, 1000)
        PTShakeObject(cof_mach_group, 3600, PTSimplexShake(0.5, 0.5, 1000, 1000))
        cof_splash_bg.visible = true
        cof_hands_bg.visible = true
        cof_steam_bg.visible = true
        cof_steam_bg.y = cof_steam_bg.y + 10
        PTSetActorWaitAfterTalk(false)
        PTPCSpeakerPlayData(PCSPK_STEAM)
        PTSleep(200)
        PTActorTalk(ash, "ow")
        PTSleep(200)
        PTActorTalk(ash, "ow ow")
        PTSleep(200)
        PTActorTalk(ash, "ow ow ow")
        PTSleep(200)
        PTActorTalk(ash, "ow ow ow oW")
        PTSleep(200)
        PTActorTalk(ash, "ow ow ow oW OW")
        PTSleep(200)
        PTActorTalk(ash, "ow ow ow oW OW OW")
        PTSleep(200)
        PTActorTalk(ash, "ow ow ow oW OW OW JESUS")
        PTSleep(200)
        PTActorTalk(ash, "ow ow ow oW OW OW JESUS OW")
        PTSleep(200)
        PTActorTalk(ash, "ow ow ow oW OW OW JESUS OW OW")
        PTSleep(200)
        PTActorTalk(ash, "ow ow ow oW OW OW JESUS OW OW OW")
        PTSleep(200)
        PTActorTalk(ash, "ow ow ow oW OW OW JESUS OW OW OW OW")
        PTSleep(200)
        PTActorTalk(ash, "ow ow ow oW OW OW JESUS OW OW OW OW ")
        PTSleep(200)
        PTActorTalk(ash, "ow ow ow oW OW OW JESUS OW OW OW OW OWWWWW")
        PTSleep(1000)
        PTActorTalk(ash, "")
        PTSetActorWaitAfterTalk(true)
        PTPCSpeakerStop()
        cof_hands_bg.visible = false
        cof_steam_bg.visible = false
        cof_steam_bg.y = cof_steam_bg.y - 10
        PTActorSleep(ash, 500)
        PTActorTalk(ash, "That was the worst idea yet! What the hell is wrong with me??")
    else
        PTActorTalk(ash, "Oh, sure. I'll just dispense some scalding coffee into my cupped hands.")
    end
end)

PTOnVerb2("use", "lucky wrench", "espresso closeup", function ()
    PTActorTalk(ash, "No. Me and Natashenka have a good working relationship.");
end)

PTOnVerb2("use", "fabric tape", "espresso closeup", function()
    PTActorTalk(ash, "Every part of this machine is rigorously maintained. I have a spreadsheet and everything!")
end)

PTOnVerb2("use", "roll of plastic", "espresso closeup", function()
    PTActorTalk(ash, "Every part of this machine has a monthly deep-clean schedule. I have a spreadsheet and everything!")
end)

PTOnVerb2("use", "stein", "espresso closeup", function()
    if vars.stein_state == "cress" then 
        PTActorTalk(ash, "I'd better take the cress out first.")
        AddInv("cress")
        vars.stein_state = "empty"
    end
    if vars.stein_state == "empty" then
        if vars.cof_kn_state == 1 then
            vars.stein_state = "water"
        elseif vars.cof_kn_state == 2 then
            vars.stein_state = "coffee"
        elseif vars.cof_kn_state == 3 then
            vars.stein_state = "sludge"
        end
        cof_stn_bg.visible = true
        cof_steam_bg.visible = true
        PTShakeObject(cof_mach_group, 4000, PTSimplexShake(0.5, 0.5, 1000, 1000))
        PTPCSpeakerPlayData(PCSPK_STEAM)
        PTSleep(4000)
        PTPCSpeakerStop()
        cof_steam_bg.visible = false
        cof_stn_bg.visible = false
        UpdateMouseOver()
    elseif vars.stein_state == "weevils" then
        PTActorTalk(ash, "I'll save that idea for when I find the queen.")
    else
        PTActorTalk(ash, "The stein would overflow if I added any more.")
    end
end)

PTOnVerb2("use", "cress", "espresso closeup", function()
    PTActorTalk(ash, "The world just isn't ready for the cressachino. I've come to accept that now.")
end)




PTOnVerb("look", "strength knob", function ()
    PTActorTalk(ash, "This sets the coffee-to-water ratio.")
end)

PTOnVerb("use", "strength knob", function ()
    PTPCSpeakerPlayData(PCSPK_SWITCH)
    vars.cof_kn_state = ((vars.cof_kn_state) % 3) + 1
    cof_kn_bg.image = cof_kn_img[vars.cof_kn_state]
    cof_kn_bg.name = cof_kn_names[vars.cof_kn_state]
    UpdateMouseOver()
end)

PTOnVerb2("use", "lucky wrench", "strength knob", function ()
    PTActorTalk(ash, "The knobs are designed for weak caffeine-deprived fingers. I should be okay.")
end)

PTOnVerb2("use", "fabric tape", "strength knob", function()
    PTActorTalk(ash, "Natashenka is shared infrastructure. Blocking people from changing the dosage would be selfish.")
end)

PTOnVerb2("use", "roll of plastic", "strength knob", function()
    PTActorTalk(ash, "It's been well-sterilised by the frequent steam exposure.")
end)

PTOnVerb2("use", "stein", "strength knob", function()
    PTActorTalk(ash, "Slamming the knob with the stein for luck won't affect the mix, no matter how enthusaistically.")
end)

PTOnVerb2("use", "cress", "strength knob", function()
    PTActorTalk(ash, "The cress is already fullstrength.")
end)



PTOnVerb("look", "cupboard", function ()
    PTActorTalk(ash, "Our kitchenette supplies go in here.")
end)

vars.has_taken_plastic = false
PTOnVerb("use", "cupboard", function ()
    bridge_kdoorc_bg.visible = false
    bridge_kdooro_bg.visible = true
    PTPCSpeakerPlayData(PCSPK_DOOR_OPEN)
    if not vars.has_taken_plastic then
        PTActorTalk(ash, "There's a roll of lab-grade plastic wrap in here.")
        PTActorTalk(ash, "I'll just be having that.")
        AddInv("roll of plastic")
        SetCurrentInv("roll of plastic")
        vars.has_taken_plastic = true
    else
        PTActorTalk(ash, "It's empty. Everything else is in the sink.")
    end
    bridge_kdoorc_bg.visible = true
    bridge_kdooro_bg.visible = false
    PTPCSpeakerPlayData(PCSPK_DOOR_CLOSE)
end)


PTOnVerb2("use", "lucky wrench", "cupboard", function()
    PTActorTalk(ash, "A bit early to smash all the plates in a fit of desperation.")
end)

PTOnVerb2("use", "fabric tape", "cupboard", function()
    PTActorTalk(ash, "I do need to fix the magnet latch on this door, but this isn't the time for distraction.")
end)

PTOnVerb2("use", "roll of plastic", "cupboard", function()
    PTActorTalk(ash, "Not yet, I might need to wrap something.")
end)

PTOnVerb2("use", "stein", "cupboard", function()
    PTActorTalk(ash, "That can wait until I've done the washing up.")
end)

PTOnVerb2("use", "cress", "cupboard", function()
    PTActorTalk(ash, "Food doesn't last long when left in this cupboard.")
end)



PTOnVerb("look", "sink", function ()
    PTActorTalk(ash, "It's chock full of used plates and mugs.")
end)

vars.tried_using_sink = false
PTOnVerb("use", "sink", function ()
    if not vars.tried_using_sink then
        vars.tried_using_sink = true
        PTActorTalk(ash, "Oh no. This is terrible.")
        PTActorTalk(ash, "The water pump isn't on the emergency circuit.");
        PTActorTalk(ash, "Leaving me no choice but to save cleaning the filthy dishes for later.");
    else
        vars.tried_using_sink = false
        PTActorTalk(ash, "LEAVING ME NO CHOICE.");
    end
end)

PTOnVerb2("use", "lucky wrench", "sink", function ()
    PTActorTalk(ash, "Oh I've yearned for a wrench which makes things cleaner by hitting them.");
    PTActorTalk(ash, "Francesca is current wrench technology and can only dent the limescale.");
end)

PTOnVerb2("use", "fabric tape", "sink", function()
    PTActorTalk(ash, "Nothing in here is broken.")
end)

PTOnVerb2("use", "roll of plastic", "sink", function()
    PTActorTalk(ash, "Money's tight. We can only drop off the dishes at hazardous waste on special occasions.")
end)

PTOnVerb2("use", "stein", "sink", function ()
    if vars.stein_state == "weevils" then
        PTActorTalk(ash, "Call me a rules lawyer, but I don't think the plates would count as clean afterwards.")
        PTActorTalk(ash, "And I'd never get the weevils back.");
    elseif vars.stein_state == "cress" then
        PTActorTalk(ash, "I'll tip out the cress, but I'm not dumping it in the sink.")
        AddInv("cress")
        vars.stein_state = "empty"
    elseif vars.stein_state == "empty" then
        PTActorTalk(ash, "It's the only clean-ish mug on the ship. I should hang onto it.");
    else
        PTPCSpeakerPlayData(PCSPK_POUR)
        PTActorTalk(ash, "Out it goes.");
        PTPCSpeakerStop()
        vars.stein_state = "empty"
    end
end)

PTOnVerb2("use", "cress", "sink", function()
    PTActorTalk(ash, "What example would I be setting? Wasting cress -and- clogging the sink?")
end)


PTOnVerb("look", "emergency power box", function ()
    PTActorTalk(ash, "It has the ISO 3864 marking for \"Cool Stuff Inside\".")
end)

vars.emergency_power_open = false
PTOnVerb("use", "emergency power box", function ()
    vars.emergency_power_open = not vars.emergency_power_open
    if vars.emergency_power_open then
        PTPCSpeakerPlayData(PCSPK_DOOR_OPEN)
    else
        PTPCSpeakerPlayData(PCSPK_DOOR_CLOSE)
    end
    UpdateBridgePower()
end)

PTOnVerb2("use", "lucky wrench", "emergency power box", function()
    PTActorTalk(ash, "It's designed to be opened by human hands.")
end)

PTOnVerb2("use", "fabric tape", "emergency power box", function()
    PTActorTalk(ash, "I'm not that paranoid about people opening this.")
end)

PTOnVerb2("use", "roll of plastic", "emergency power box", function()
    PTActorTalk(ash, "Why? This power box is maybe the most sterile thing on the ship.")
end)

PTOnVerb2("use", "stein", "emergency power box", function()
    PTActorTalk(ash, "It's a slim cover, the stein is far too big to fit inside.")
end)

PTOnVerb2("use", "cress", "emergency power box", function()
    PTActorTalk(ash, "This wouldn't be the first time I've considered hiding cress in the emergency power box for when times get hard.")
    PTActorTalk(ash, "I changed my mind after starting a small fire.")
end)



vars.emergency_power_on = false
vars.ship_powered_up = false
PTOnVerb("look", "emergency power relay", function ()
    PTActorTalk(ash, "This is for diverting emergency power to the bridge computers.")
    PTActorTalk(ash, "For aesthetic reasons I replaced the breaker with this old-timey knife switch.")
end)

PTOnVerb("use", "emergency power relay", function ()
    vars.emergency_power_on = not vars.emergency_power_on
    PTPCSpeakerPlayData(PCSPK_SWITCH)
    UpdateBridgePower()
end)

PTOnVerb2("use", "lucky wrench", "emergency power relay", function()
    PTActorTalk(ash, "Touch the mains voltage with the wrench.")
    PTActorSleep(ash, 3000)
    PTActorTalk(ash, "The MAINS VOLTAGE.")
    PTActorSleep(ash, 1000)
    PTActorTalk(ash, "With the WRENCH.")
    PTActorSleep(ash, 3000)
    PTActorTalk(ash, "Sigh.")
end)

PTOnVerb2("use", "fabric tape", "emergency power relay", function()
    PTActorTalk(ash, "The wooden grip is not splintery enough to need tape.")
end)

PTOnVerb2("use", "roll of plastic", "emergency power relay", function()
    PTActorTalk(ash, "Why? I don't need to touch the exposed metal bit.")
end)

PTOnVerb2("use", "stein", "emergency power relay", function()
    PTActorTalk(ash, "Here's to you, emergency power relay!")
end)

PTOnVerb2("use", "cress", "emergency power relay", function()
    PTActorTalk(ash, "Hey emergency power relay, want some cress?")
    PTActorSleep(ash, 1000)
    PTActorTalk(ash, "No?")
    PTActorSleep(ash, 1000)
    PTActorTalk(ash, "Well... personally I think you're making a mistake. But okay.")
end)



vars.diagnostic_terminal_state = 0
PTOnVerb("look", "diagnostic terminal", function () 
    PTActorTalk(ash, "Always whinging about things wrong with the ship.")
end)

vars.diagnostic_first_time = true
PTOnVerb("use", "diagnostic terminal", function ()
    if not (vars.emergency_power_on or vars.ship_powered_up) then
        PTActorTalk(ash, "The power is out, so the terminal can't shout at me.")
        PTActorTalk(ash, "Lucky escape.")
    else
        local old_talk = ash.talk_colour
        local new_talk = { 255, 255, 85 }
        ash.talk_colour = new_talk
        PTActorTalk(ash, "-- DIAGNOSTIC REPORT --")
        local total = 0
        if not vars.reactor_filled then
            PTActorTalk(ash, "POWER GENERATION: FAULT")
            total = total + 1
        end
        if not (vars.steam_pipe_state == 2) then
            PTActorTalk(ash, "HEAT EXCHANGERS: FAULT")
            total = total + 1
        end
        if not (vars.wiring_state == 2) then
            PTActorTalk(ash, "NAVIGATION: FAULT")
            total = total + 1
        end
        if not vars.cleaned_filter then
            PTActorTalk(ash, "LIFE SUPPORT: FAULT")
            total = total + 1
        end
        if vars.diagnostic_terminal_state == 1 then 
            PTActorSleep(ash, 2000)
            PTActorTalk(ash, "DIAGNOSTIC TERMINAL: FAULT")
            ash.talk_colour = old_talk
            PTActorSleep(ash, 2000)
            PTActorTalk(ash, "Piss.")
        elseif vars.diagnostic_first_time and total == 4 then
            ash.talk_colour = old_talk
            PTActorSleep(ash, 2000)
            PTActorTalk(ash, "Even by our standards that's a lot of faults.")
            vars.diagnostic_first_time = false
        elseif vars.lifeform_enabled then
            ash.talk_colour = new_talk
            PTActorTalk(ash, "UNAUTHORISED LIFEFORM DETECTED")
            ash.talk_colour = old_talk
            PTActorSleep(ash, 2000)
            PTActorTalk(ash, "Remind me to take a trip to e-waste.")
        elseif total == 0 then
            -- everything is fixed
            ash.talk_colour = new_talk
            PTRadFadeOut(5000)
            PTActorTalk(ash, "READY FOR PRE-FLIGHT CHECKLIST")
            ash.talk_colour = old_talk
            PTActorTalk(ash, "Thank. Christ.")
            PTActorSleep(ash, 1000)
            ash.talk_colour = new_talk
            PTActorTalk(ash, "WARNING: MANUAL OVERRIDE OF PRE-FLIGHT CHECKLIST IS DANGEROUS AND MAY VOID YOUR SERVICING AGREEMENT blah blah blah")
            PTActorSleep(ash, 1000)
            PTActorTalk(ash, "→ Yes to All")
            ash.talk_colour = old_talk
            penultimate_scene()
        end
        ash.talk_colour = old_talk
    end
end)

PTOnVerb2("use", "lucky wrench", "diagnostic terminal", function ()
    if vars.diagnostic_terminal_state == 0 then
        PTActorTalk(ash, "Maybe just a minor adjustment.")
        PTActorSetAnimation(ash, "wrench_out", 90)
        PTSleep(2000)
        PTActorSetAnimation(ash, "stand", 0)
        WrenchSmack(1000)
        vars.diagnostic_terminal_state = 1
        UpdateBridgePower()
        WrenchSmack(1000)
        ash.facing = 90
        PTActorSetAnimation(ash, "wrench_in", 90)
        PTSleep(2000)
        PTActorSetAnimation(ash, "stand", 90)
    elseif vars.diagnostic_terminal_state == 1 then
        PTActorSetAnimation(ash, "wrench_out", 90)
        PTSleep(2000)
        PTActorSetAnimation(ash, "stand", 0)
        WrenchSmack(700)
        WrenchSmack(700)
        WrenchSmack(700)
        vars.diagnostic_terminal_state = 2
        UpdateBridgePower()
        WrenchSmack(700)
        PTSleep(1000)
        PTActorSetAnimation(ash, "wrench_in", 90)
        PTSleep(2000)
        PTActorSetAnimation(ash, "stand", 90)
    else
        PTActorTalk(ash, "Why? It's been tuned by an expert.")
    end

end)

PTOnVerb2("use", "fabric tape", "diagnostic terminal", function()
    PTActorTalk(ash, "I don't want to extend the life of this. If it dies, it dies.")
end)

PTOnVerb2("use", "roll of plastic", "diagnostic terminal", function()
    PTActorTalk(ash, "Unfortunately this machine dishes out psychic damage.")
end)

PTOnVerb2("use", "stein", "diagnostic terminal", function ()
    if vars.stein_state == "weevils" then
        PTActorTalk(ash, "I don't need any extra help cleaning skin flakes from the keyboard.");
    elseif vars.stein_state == "empty" then
        PTActorTalk(ash, "The steel case is pretty thick. I don't think the stein would survive.");
    elseif vars.stein_state == "cress" then 
        PTActorTalk(ash, "I can pour as much cress as I'd like onto the terminal, it's still going to be bad news.");
    else
        PTActorTalk(ash, "It's liquid-proof. I'd just be making a mess for myself.");
    end
end)

PTOnVerb2("use", "cress", "diagnostic terminal", function()
    PTActorTalk(ash, "Yeah... maybe once this is over I can turn you into a planter.")
end)



PTOnVerb("look", "instrument monitors", function ()
    PTActorTalk(ash, "These screens and controls are for the ship's navigation instruments.")
end)

vars.looking_for_faults = false
PTOnVerb("use", "instrument monitors", function ()
    if vars.ship_powered_up then
        PTActorTalk(ash, "The positioning system is up, and we are flying in a straight line.")
        PTActorTalk(ash, "Basically overachieving at this point.")
    elseif vars.emergency_power_on then
        if vars.wiring_state == 2 then 
            PTActorTalk(ash, "All the nav readings look pretty sane to me.")
        else
            PTActorTalk(ash, "Everything is online, but we're getting chopped and screwed readings from two instrument banks.")
            if vars.seen_weevils then
                PTActorTalk(ash, "Can't imagine why.")
            else
                PTActorTalk(ash, "Maybe there's a short?")
                vars.looking_for_faults = true
            end
        end
    else 
        PTActorTalk(ash, "Power's out. Not much to see.")
    end
end)

PTOnVerb2("use", "lucky wrench", "instrument monitors", function()
    PTActorTalk(ash, "Sadly you can't threaten the instruments to get a better result.")
end)

PTOnVerb2("use", "fabric tape", "instrument monitors", function()
    PTActorTalk(ash, "I doubt it would do a better job than the mounting screws.")
end)

PTOnVerb2("use", "roll of plastic", "instrument monitors", function()
    PTActorTalk(ash, "I -could- pretend to shrinkwrap these and see if I could get a refund. If it weren't for the decade printed on the back.")
end)

PTOnVerb2("use", "stein", "instrument monitors", function()
    PTActorTalk(ash, "Some of the numbers I've seen come off of here do require a strong drink, yes.")
end)

PTOnVerb2("use", "cress", "instrument monitors", function()
    PTActorTalk(ash, "The organic material sensors are outside the ship.")
    PTActorTalk(ash, "Which is good, as they'd be screaming like crazy right about now.")
end)





vars.bank_door_state = {false, false, false, false}
vars.bank_door_order = {0, 0, 0, 0}
vars.bank_door_next = 1
local look_bankdoor = function ()
    PTActorTalk(ash, "These hatches hide the patch panels for the instrument cabling.")
end

vars.seen_weevils = false
local use_bankdoor = function (n)
    return function()
        ash.facing = 0
        vars.bank_door_state[n] = not vars.bank_door_state[n]
        if vars.bank_door_state[n] then 
            PTPCSpeakerPlayData(PCSPK_DOOR_OPEN)
        else
            PTPCSpeakerPlayData(PCSPK_DOOR_CLOSE)
        end

        UpdateBridgeWDoor()

        if vars.bank_door_state[n] and vars.bank_door_order[n] == 0 then
            vars.bank_door_order[n] = vars.bank_door_next
            bridge_wire_bg[n].image = bridge_wire_img[vars.bank_door_order[n]]
            UpdateBridgeWDoor()
            if vars.looking_for_faults and vars.bank_door_next == 1 then
                PTActorTalk(ash, "Hmm. Looks fine to me.")
            elseif vars.looking_for_faults and vars.bank_door_next == 2 then
                PTActorTalk(ash, "Again, the wiring looks fine.")
            elseif vars.looking_for_faults and vars.bank_door_next == 3 then
                PTActorTalk(ash, "This is weird... maybe I was wrong about this?")
            elseif not vars.seen_weevils and vars.bank_door_next == 4 then
                PTActorTalk(ash, "Argh!!")
                PTActorTalk(ash, "The little bastards are back!!!")
                PTActorTalk(ash, "That's ruined my morning.")
                vars.seen_weevils = true
            end
            vars.bank_door_next = vars.bank_door_next + 1
        end
    end
end

use_wrench_bankdoor = function (n)
    return function ()
        if vars.seen_weevils and not vars.captured_weevils and vars.bank_door_order[n] == 4 then
            PTActorSetAnimation(ash, "wrench_out", 90)
            PTSleep(1300)
            PTActorSetAnimation(ash, "stand", 0)
            WrenchSmack(400)
            WrenchSmack(400)
            WrenchSmack(300)
            WrenchSmack(500)
            PTActorSetAnimation(ash, "wrench_in", 90)
            PTSleep(2000)
            PTActorSetAnimation(ash, "stand", 90)
            PTActorTalk(ash, "Yeah, you like that??? You see what happens???")
        else
            PTActorSetAnimation(ash, "wrench_out", 90)
            PTSleep(1300)
            PTActorSetAnimation(ash, "stand", 0)
            WrenchSmack(1000)
            PTActorSetAnimation(ash, "wrench_in", 90)
            PTSleep(2000)
            PTActorSetAnimation(ash, "stand", 90)
        end
    end 
end

use_tape_bankdoor = function ()
    PTActorTalk(ash, "It's fine, I'm used to the razor-sharp edges now.")
end

use_plastic_bankdoor = function ()
    PTActorTalk(ash, "The doors are already gasketed.")
end

use_stein_bankdoor = function ()
    PTActorTalk(ash, "The little perforations have been drilled to be resistant to pouring and/or splashing.")
end

use_cress_bankdoor = function ()
    PTActorTalk(ash, "Huh. I suppose you could use the perforated door panel as a large emergency grater.")
    PTActorTalk(ash, "It might even be good if you love the taste of grit and iron filings.")
end

for i = 1,4 do
    local target = string.format("instrument bank %d door", i)
    PTOnVerb("look", target, look_bankdoor)
    PTOnVerb("use", target, use_bankdoor(i))
    PTOnVerb2("use", "lucky wrench", target, use_wrench_bankdoor(i))
    PTOnVerb2("use", "fabric tape", target, use_tape_bankdoor)
    PTOnVerb2("use", "roll of plastic", target, use_plastic_bankdoor)
    PTOnVerb2("use", "stein", target, use_stein_bankdoor)
    PTOnVerb2("use", "cress", target, use_cress_bankdoor)
end


PTOnVerb("look", "cockpit controls", function ()
    if vars.lifeform_enabled then
        PTActorTalk(ash, "Oh good. The ship is back on course at least.")
    else
        PTActorTalk(ash, "On a good day, these controls set the ship's course.")
        PTActorTalk(ash, "Right now we're on the fallback system: our course is set by the biggest thing that plows into us.")
    end
end)

PTOnVerb("use", "cockpit controls", function ()
    if vars.lifeform_enabled then 
        PTActorTalk(ash, "It -would- be cathartic to hit the jets and slam this prick into a few walls.")
        PTActorTalk(ash, "But I don't want to hurt Maura.")
    else
        PTActorTalk(ash, "No point messing with these until the ship is fixed.")
    end
end)

PTOnVerb2("use", "lucky wrench", "cockpit controls", function()
    if vars.lifeform_enabled then 
        PTActorTalk(ash, "After all the work I went through getting this scow flying again? No.")
    else
        PTActorTalk(ash, "My gut feeling is that wailing on these controls won't fix anything.")
    end
end)

PTOnVerb2("use", "fabric tape", "cockpit controls", function()
    PTActorTalk(ash, "We only have to do that when one of the switches falls off the dash.")
end)

PTOnVerb2("use", "roll of plastic", "cockpit controls", function()
    PTActorTalk(ash, "Maybe I could wrap everything up in plastic and pretend this ship was defective from the factory.")
    PTActorTalk(ash, "Not now, though.")
end)

PTOnVerb2("use", "stein", "cockpit controls", function()
    PTActorTalk(ash, "The cup holder snapped off the last time we did an emergency brake.")
end)

PTOnVerb2("use", "cress", "cockpit controls", function()
    PTActorTalk(ash, "There's no rear view mirror, so I can't hang it up like one of those tree-shaped air fresheners.")
end)


vars.wiring_state = 0
PTOnVerb("look", "space weevils", function ()
    PTActorTalk(ash, "The parasites are snacking on my wiring looms.")
    PTActorTalk(ash, "Death is too good for them.")
end)

PTOnVerb("use", "space weevils", function ()
    PTActorTalk(ash, "They bite pretty hard! No thanks.")
end)

PTOnVerb2("use", "lucky wrench", "space weevils", function ()
    PTActorSetAnimation(ash, "wrench_out", 90)
    PTSleep(3000)
    PTActorSetAnimation(ash, "wrench_in", 90)
    PTSleep(1500)
    PTActorTalk(ash, "No. There's got to be a less messy way.")
    PTActorTalk(ash, "Last time it was like scrubbing off superglue.")
end)

PTOnVerb2("use", "fabric tape", "space weevils", function ()
    PTActorTalk(ash, "These things love eating carbon. The sports tape wouldn't stand a chance.")
end)

PTOnVerb2("use", "roll of plastic", "space weevils", function ()
    PTActorTalk(ash, "We tried that two infestations ago.")
    PTActorTalk(ash, "The bastards can survive days without air.")
end)

PTOnVerb2("use", "stein", "space weevils", function()
    if vars.stein_state == "empty" then
        PTActorSleep(ash, 1000)
        PTActorTalk(ash, "Weird... it's as if they don't *want* to jump into the portable ceramic prison.")
    elseif vars.stein_state == "cress" then
        PTActorSleep(ash, 1000)
        vars.stein_state = "weevils"
        vars.captured_weevils = true
        vars.wiring_state = 1
        UpdateBridgeWDoor()
        PTActorTalk(ash, "Gotcha, you bitey little pricks.")
        UpdateMouseOver()
    elseif vars.stein_state == "water" then
        PTActorTalk(ash, "The weevils wouldn't care, and it might damage the electronics.")
    elseif vars.stein_state == "coffee" then
        PTActorTalk(ash, "They're already far too jumpy.")
    elseif vars.stein_state == "sludge" then
        PTActorTalk(ash, "Immersing the weevils in pitch for future generations is unfair on the future generations.")
    end
end)

PTOnVerb2("use", "cress", "space weevils", function()
    PTActorTalk(ash, "If I did that they would have a go at my hand!")
end)


PTOnVerb("look", "chewed wires", function()
    if vars.wiring_state == 2 then
        PTActorTalk(ash, "Incredible. You can hardly tell there's anything wrong.")
    else 
        PTActorTalk(ash, "My beautiful cabling!!! What have they done to you???")
    end
end)

PTOnVerb("use", "chewed wires", function()
    if vars.wiring_state == 2 then
        PTActorTalk(ash, "Better not press my luck by jostling these.")
    else 
        PTActorTalk(ash, "The insulation is full of holes. These lines must be shorting like mad.")
    end
end)

PTOnVerb2("use", "lucky wrench", "chewed wires", function()
    PTActorTalk(ash, "You don't need to smack RJ45 connectors loose with a wrench.")
    PTActorTalk(ash, "Except maybe if the little tab gets stuck.")
end)


PTOnVerb2("use", "fabric tape", "chewed wires", function()
    if vars.wiring_state == 2 then
        PTActorTalk(ash, "I fixed this already!")
    elseif vars.emergency_power_on then
        PTPCSpeakerPlayData(PCSPK_ZAP)
        PTActorSleep(ash, 500)
        PTPCSpeakerStop()
        PTActorTalk(ash, "OW.")
        PTActorTalk(ash, "God I'm tired today.")
    else
        vars.wiring_state = 2
        UpdateBridgeWDoor()
        PTActorTalk(ash, "I declare this wiring up to code.")
        UpdateMouseOver()
    end
end)

PTOnVerb2("use", "roll of plastic", "chewed wires", function()
    if vars.wiring_state == 2 then 
        PTActorTalk(ash, "The wires are plenty insulated now.")
    else 
        PTActorTalk(ash, "A kernel of a good idea, but the clingfilm would fall off.")
    end
end)

PTOnVerb2("use", "stein", "chewed wires", function()
    if vars.stein_state == "weevils" then
        PTActorTalk(ash, "Let's just take a moment to think about how we got here. Why are the weevils in the stein?")
        PTActorTalk(ash, "Answer: because we got them away from THIS WIRING, AT GREAT PERSONAL COST.")
    elseif vars.stein_state == "water" or vars.stein_state == "coffee" or vars.stein_state == "sludge" then 
        PTActorTalk(ash, "I'm not pouring liquid on the damaged wires.")
    --elseif vars.stein_state == "cress" then
    -- shouldn't have this
    else
        PTActorTalk(ash, "Jam the stein into the cable run? Smash the stein on the connectors? Poke the lid flipper into one of the ports? What???")
    end
end)

PTOnVerb2("use", "cress", "chewed wires", function()
    -- shouldn't have this
end)



vars.has_taken_stein = false
PTOnVerb("look", "stein on bridge", function()
    PTActorTalk(ash, "A memory of better times.")
end)

PTOnVerb("use", "stein on bridge", function()
    if not vars.has_taken_stein then
        AddInv("stein")
        SetCurrentInv("stein")
        bridge_stein_bg.visible = false
        bridge_stein_bg.collision = false
        vars.has_taken_stein = true
    end
end)

PTOnVerb2("use", "lucky wrench", "stein on bridge", function()
    if not vars.has_taken_stein then
        AddInv("stein")
        SetCurrentInv("stein")
        bridge_stein_bg.visible = false
        bridge_stein_bg.collision = false
        vars.has_taken_stein = true
        PTDoVerb2("use", "lucky wrench", "stein")
    end
end)

PTOnVerb2("use", "fabric tape", "stein on bridge", function()
    if not vars.has_taken_stein then
        AddInv("stein")
        SetCurrentInv("stein")
        bridge_stein_bg.visible = false
        bridge_stein_bg.collision = false
        vars.has_taken_stein = true
        PTDoVerb2("use", "fabric tape", "stein")
    end
end)

PTOnVerb2("use", "roll of plastic", "stein on bridge", function()
    if not vars.has_taken_stein then
        AddInv("stein")
        SetCurrentInv("stein")
        bridge_stein_bg.visible = false
        bridge_stein_bg.collision = false
        vars.has_taken_stein = true
        PTDoVerb2("use", "roll of plastic", "stein")
    end
end)

PTOnVerb2("use", "cress", "stein on bridge", function()
    if not vars.has_taken_stein then
        AddInv("stein")
        SetCurrentInv("stein")
        bridge_stein_bg.visible = false
        bridge_stein_bg.collision = false
        vars.has_taken_stein = true
        CressInStein()
    end 
end)


