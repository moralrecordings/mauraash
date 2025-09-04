local vars = PTVars()

--- In-game menus

btn_img = PT9Slice(PTImage("assets/btn.png", 0, 0, -1, true), 8, 8, 24, 24)
btn_high_img = PT9Slice(PTImage("assets/btn_high.png", 0, 0, -1, true), 8, 8, 24, 24)
btn_push_img = PT9Slice(PTImage("assets/btn_push.png", 0, 0, -1, true), 8, 8, 24, 24)
panel_img = PT9Slice(PTImage("assets/panel.png", 0, 0, -1, true), 1, 1, 31, 31)

sld_img = PT9Slice(PTImage("assets/sld.png", 0, 0, -1, true), 2, 3, 2, 6)
sld_high_img = PT9Slice(PTImage("assets/sld_high.png", 0, 0, -1, true), 2, 3, 2, 6)
sld_trak_img = PT9Slice(PTImage("assets/sld_trak.png", 0, 0, -1, true), 1, 1, 23, 2)



--- In-game pause menu
-- [Resume]
-- [Save game]
-- [Load game]
-- [Options]
-- [Quit to Title] 


PANEL_WIDTH = 128
PANEL_HEIGHT = 120
menu_panel = PTPanel(panel_img, (SCREEN_WIDTH - PANEL_WIDTH)//2, (SCREEN_HEIGHT - PANEL_HEIGHT)//2, PANEL_WIDTH, PANEL_HEIGHT)
menu_panel.visible = false

btn_resume = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8,
    112,
    16,
    {PTBackground(PTText("Resume", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    CloseGameMenu
)
PTPanelAddObject(menu_panel, btn_resume)

btn_save = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*1,
    112,
    16,
    {PTBackground(PTText("Save", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    function ()
        save_panel.visible = true
        menu_panel.visible = false
    end
)
PTPanelAddObject(menu_panel, btn_save)

btn_load = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*2,
    112,
    16,
    {PTBackground(PTText("Load", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    function ()
        load_panel.visible = true
        menu_panel.visible = false
        btn_load_cancel.callback = function ()
            load_panel.visible = false
            PTUnpauseGame()
        end
    end
)
PTPanelAddObject(menu_panel, btn_load)

btn_options = PTButton(
   {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*3,
    112,
    16,
    {PTBackground(PTText("Options", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    function ()
        menu_panel.visible = false
        options_panel.visible = true
        btn_options_graphics.objects = text_gmodes[vars.graphics_mode]
        btn_options_done.callback = function ()
            options_panel.visible = false
            PTUnpauseGame()
        end
    end
)
PTPanelAddObject(menu_panel, btn_options)

btn_quit_title = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*4,
    112,
    16,
    {PTBackground(PTText("Quit to Title", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    function () 
        menu_panel.visible = false
        quit_confirm_panel.visible = true
    end
)
PTPanelAddObject(menu_panel, btn_quit_title)
PTAddPanel(menu_panel)

-- Quit confirm panel
--
--    You sure, chief?
--  Unsaved progress will
--       be lost.
--
--  [      Quit       ]
--  [    Continue     ]

quit_confirm_panel = PTPanel(panel_img, (SCREEN_WIDTH - PANEL_WIDTH)//2, (SCREEN_HEIGHT - PANEL_HEIGHT)//2, PANEL_WIDTH, PANEL_HEIGHT)
quit_confirm_panel.visible = false

btn_quit_yes = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*3,
    112,
    16,
    {PTBackground(PTText("Quit", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    function ()
        PTReset()
    end
)
PTPanelAddObject(quit_confirm_panel, btn_quit_yes)

btn_quit_no = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*4,
    112,
    16,
    {PTBackground(PTText("Continue", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    function ()
        quit_confirm_panel.visible = false
        PTUnpauseGame()
    end
)
PTPanelAddObject(quit_confirm_panel, btn_quit_no)

text_yousure = PTBackground(PTText("You sure, chief?", font, 112, "center", {0xff, 0xff, 0xff}), 8, 8)
PTPanelAddObject(quit_confirm_panel, text_yousure)

text_unsaved = PTBackground(PTText("Unsaved progress will be lost.", font, 112, "center", {0xff, 0xff, 0xff}), 8, 8+22*1 + 3)
PTPanelAddObject(quit_confirm_panel, text_unsaved)

PTAddPanel(quit_confirm_panel)

--- Load menu
-- Load from:
-- [Slot 1]
-- [Slot 2]
-- [Slot 3]
-- [Cancel]

load_panel = PTPanel(panel_img, (SCREEN_WIDTH - PANEL_WIDTH-48)//2, (SCREEN_HEIGHT - PANEL_HEIGHT)//2, PANEL_WIDTH+48, PANEL_HEIGHT)
load_panel.visible = false

txt_loadfrom = PTBackground(
    PTText("Load from:", font, 112+48, "center", {0xff, 0xff, 0xff}),
    8, 8
)
PTPanelAddObject(load_panel, txt_loadfrom)

GetSaveName = function(i)
    local load_summ = PTGetSaveStateSummary(i)
    PTLog(inspect(load_summ))
    if load_summ then
        return string.gsub(load_summ.timestamp, "T", " ")
    end
    return "Empty"
end

btn_load_text_1 = PTBackground(PTText(GetSaveName(1), font, 112+48, "center", {0xff, 0xff, 0xff}), 0, 3)
btn_load_text_2 = PTBackground(PTText(GetSaveName(2), font, 112+48, "center", {0xff, 0xff, 0xff}), 0, 3)
btn_load_text_3 = PTBackground(PTText(GetSaveName(3), font, 112+48, "center", {0xff, 0xff, 0xff}), 0, 3)

btn_load_slot_1 = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*1,
    112+48,
    16,
    {btn_load_text_1},
    function ()
        PTLoadState(1)
    end
)
PTPanelAddObject(load_panel, btn_load_slot_1)

btn_load_slot_2 = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*2,
    112+48,
    16,
    {btn_load_text_2},
    function () 
        PTLoadState(2)
    end
)
PTPanelAddObject(load_panel, btn_load_slot_2)

btn_load_slot_3 = PTButton(
   {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*3,
    112+48,
    16,
    {btn_load_text_3},
    function ()
        PTLoadState(3)
    end
)
PTPanelAddObject(load_panel, btn_load_slot_3)

btn_load_cancel = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
8,
    8+22*4,
    112+48,
    16,
    {PTBackground(PTText("Cancel", font, 112+48, "center", {0xff, 0xff, 0xff}), 0, 3)},
    nil
)
PTPanelAddObject(load_panel, btn_load_cancel)
PTAddPanel(load_panel)



--- Save menu
-- Save to:
-- [Slot 1]
-- [Slot 2]
-- [Slot 3]
-- [Cancel]

save_panel = PTPanel(panel_img, (SCREEN_WIDTH - PANEL_WIDTH-48)//2, (SCREEN_HEIGHT - PANEL_HEIGHT)//2, PANEL_WIDTH+48, PANEL_HEIGHT)
save_panel.visible = false

txt_saveto = PTBackground(
    PTText("Save to:", font, 112+48, "center", {0xff, 0xff, 0xff}),
    8, 8
)
PTPanelAddObject(save_panel, txt_saveto)

btn_save_slot_1 = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*1,
    112+48,
    16,
    {btn_load_text_1},
    function ()
        PTSaveState(1)
        -- wait for deferred save action
        PTSleep(0)
        btn_load_text_1.image = PTText(GetSaveName(1), font, 112+48, "center", {0xff, 0xff, 0xff})
        save_panel.visible = false
        PTUnpauseGame()
    end
)
PTPanelAddObject(save_panel, btn_save_slot_1)

btn_save_slot_2 = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*2,
    112+48,
    16,
    {btn_load_text_2},
    function () 
        PTSaveState(2)
        -- wait for deferred save action
        PTSleep(0)
        btn_load_text_2.image = PTText(GetSaveName(2), font, 112+48, "center", {0xff, 0xff, 0xff})
        save_panel.visible = false
        PTUnpauseGame()
    end
)
PTPanelAddObject(save_panel, btn_save_slot_2)

btn_save_slot_3 = PTButton(
   {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*3,
    112+48,
    16,
    {btn_load_text_3},
    function ()
        PTSaveState(3)
        -- wait for deferred save action
        PTSleep(0)
        btn_load_text_3.image = PTText(GetSaveName(3), font, 112+48, "center", {0xff, 0xff, 0xff})
        save_panel.visible = false
        PTUnpauseGame()
    end
)
PTPanelAddObject(save_panel, btn_save_slot_3)

btn_save_cancel = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
8,
    8+22*4,
    112+48,
    16,
    {PTBackground(PTText("Cancel", font, 112+48, "center", {0xff, 0xff, 0xff}), 0, 3)},
    function () 
        save_panel.visible = false
        PTUnpauseGame()
    end
)
PTPanelAddObject(save_panel, btn_save_cancel)
PTAddPanel(save_panel)



--- Start screen
-- [Begin]
-- [Load game]
-- [Options]
-- [Quit to DOS]

INTRO_PANEL_WIDTH = 128
INTRO_PANEL_HEIGHT = 98

intro_panel = PTPanel(panel_img, (SCREEN_WIDTH - INTRO_PANEL_WIDTH)//2, (SCREEN_HEIGHT - INTRO_PANEL_HEIGHT)//2, INTRO_PANEL_WIDTH, INTRO_PANEL_HEIGHT)
intro_panel.visible = false

btn_begin = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8,
    112,
    16,
    {PTBackground(PTText("Begin", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    function ()
        intro_panel.visible = false
        PTUnpauseGame()
        PTRadSetPosition(3, 0)
    end
)
PTPanelAddObject(intro_panel, btn_begin)

btn_load = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*1,
    112,
    16,
    {PTBackground(PTText("Load", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    function ()
        load_panel.visible = true
        intro_panel.visible = false
        btn_load_cancel.callback = function ()
            load_panel.visible = false
            intro_panel.visible = true
        end
    end
)
PTPanelAddObject(intro_panel, btn_load)

btn_options = PTButton(
   {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*2,
    112,
    16,
    {PTBackground(PTText("Options", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    function ()
        options_panel.visible = true
        intro_panel.visible = false
        btn_options_graphics.objects = text_gmodes[vars.graphics_mode]
        btn_options_done.callback = function ()
            options_panel.visible = false
            intro_panel.visible = true
        end
    end
)
PTPanelAddObject(intro_panel, btn_options)

btn_quit = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*3,
    112,
    16,
    {PTBackground(PTText("Quit", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    function () 
        PTQuit()
    end
)
PTPanelAddObject(intro_panel, btn_quit)
PTAddPanel(intro_panel)


--- Options menu
--
--    Text speed
-- [-|-------] 1.0x
--   Music volume
-- [-|-------] 20%
--     Graphics      
-- [ VGA/EGA/CGA ]
--     [Done]


options_panel = PTPanel(panel_img, (SCREEN_WIDTH - PANEL_WIDTH)//2, (SCREEN_HEIGHT - PANEL_HEIGHT)//2, PANEL_WIDTH, PANEL_HEIGHT)
options_panel.visible = false

text_options_textspeed = PTBackground(PTText("Text speed", font, 112, "center", {0xff, 0xff, 0xff}), 8, 8)
PTPanelAddObject(options_panel, text_options_textspeed)

img_options_speeds = {
    PTText("Wait", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("0.25x", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("0.5x", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("0.75x", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("1.0x", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("1.25x", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("1.5x", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("1.75x", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("2.0x", font, 40, "right", {0xff, 0xff, 0xff})
}
text_options_textspeed = PTBackground(img_options_speeds[5], 80, 8+10)

slider_options_textspeed = PTHorizSlider(
    {default=sld_img, hover=sld_high_img, track=sld_trak_img},
    8,
    8+10,
    72,
    11,
    3,
    5,
    5,
    1,
    9,
    function (obj)
        text_options_textspeed.image = img_options_speeds[obj.value]
        if obj.value == 1 then
            PTSetTalkBaseDelay(-1)
            PTSetTalkCharDelay(-1)
        else
            PTSetTalkBaseDelay(TALK_BASE_DELAY*4/(obj.value-1))
            PTSetTalkCharDelay(TALK_CHAR_DELAY*4/(obj.value-1))
        end 
    end
)
PTPanelAddObject(options_panel, slider_options_textspeed)
PTPanelAddObject(options_panel, text_options_textspeed)

text_options_music = PTBackground(PTText("Music volume", font, 112, "center", {0xff, 0xff, 0xff}), 8, 8+26)
PTPanelAddObject(options_panel, text_options_music)

img_options_percent = {
    PTText("0%", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("10%", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("20%", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("30%", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("40%", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("50%", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("60%", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("70%", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("80%", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("90%", font, 40, "right", {0xff, 0xff, 0xff}),
    PTText("100%", font, 40, "right", {0xff, 0xff, 0xff})
}
music_init_val = 1 + (math.floor((PTRadGetVolume())*10/255))
text_options_musicpercent = PTBackground(img_options_percent[music_init_val], 80, 8+26+10)

slider_options_music = PTHorizSlider(
    {default=sld_img, hover=sld_high_img, track=sld_trak_img},
    8,
    8+26+10,
    72,
    11,
    3,
    5,
    music_init_val,
    1,
    11,
    function (obj)
        text_options_musicpercent.image = img_options_percent[obj.value]
        local vol = math.floor(0.5+(obj.value - 1)*255/10)
        PTLog("setting volume to %d", vol)
        PTRadSetVolume(vol)
    end
)
PTPanelAddObject(options_panel, slider_options_music)
PTPanelAddObject(options_panel, text_options_musicpercent)



text_options_graphics = PTBackground(PTText("Graphics", font, 112, "center", {0xff, 0xff, 0xff}), 8, 8+52)
PTPanelAddObject(options_panel, text_options_graphics)

text_vga = {PTBackground(PTText("VGA 256", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)}
text_ega = {PTBackground(PTText("EGA 16", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)}
text_cga = {PTBackground(PTText("CGA 4", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)}
text_gmodes = {
    text_vga,
    text_ega,
    text_cga
}
gmode_id = {
    "vga",
    "ega",
    "cga"
}
vars.graphics_mode = 1

btn_options_graphics = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+52+12,
    112,
    16,
    text_vga,
    function (obj)
        vars.graphics_mode = (vars.graphics_mode % #text_gmodes) + 1
        obj.objects = text_gmodes[vars.graphics_mode]
        SetGraphicsMode(gmode_id[vars.graphics_mode], PTCurrentRoom().name)
    end
)
PTPanelAddObject(options_panel, btn_options_graphics)

btn_options_done = PTButton(
    {default=btn_img, hover=btn_high_img, active=btn_push_img},
    8,
    8+22*4,
    112,
    16,
    {PTBackground(PTText("Done", font, 112, "center", {0xff, 0xff, 0xff}), 0, 3)},
    nil
)
PTPanelAddObject(options_panel, btn_options_done)

PTAddPanel(options_panel)



