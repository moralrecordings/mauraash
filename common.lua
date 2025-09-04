--- Common code.

-- Perentie games follow the model-view-controller pattern.
--
-- The model is the game state; the bare amount of data required to
-- explain the current state of the world (e.g. a list of held inventory
-- items, a boolean describing if a door is open).
-- 
-- The view is the current arrangement and state of graphics on the screen,
-- and audio being played.
--
-- The controller is the game code; responsible for updating the model and
-- the view accordingly. Perentie provides you an API for receiving
-- inputs (e.g. events from the keyboard/mouse via event callbacks) and
-- producing outputs (e.g. drawing PTSprites).
--
-- The aim is for the game state to be the source of truth, and contain
-- enough information to load and save the game.
local vars = PTVars()

-- Cache screen dimensions
SCREEN_WIDTH, SCREEN_HEIGHT = PTGetScreenDims()

-- Watchdog instruction limit.
-- Normally it's 10000, but the CGA dithering instructions push us over the line
PTSetWatchdogLimit(15000)

--- Font
-- Load a font. Font definitions must be provided in BMFont binary format,
-- with the character atlases as grayscale PNG.
font = PTFont("assets/eagle.fnt")
font_tiny = PTFont("assets/tiny.fnt")


--- Main character
talk_cycle = {1, 2, 1, 2, 1, 5, 6, 2, 1, 2, 1, 3, 4, 3, 4, 1, 5, 6, 1, 2}
ash_stand_r = PTImage("assets/stand_r.png", 30, 74)
ash_talk_r = PTImageSequence("assets/talk_r%d.png", 1, 6, 30, 74)
ash_talk_d = PTImageSequence("assets/talk_d%d.png", 1, 6, 30, 74)
ash_talk_u = PTImageSequence("assets/talk_u%d.png", 1, 6, 30, 74)
ash_talk_r_seq = {}
ash_talk_d_seq = {}
ash_talk_u_seq = {}
for k, v in ipairs(talk_cycle) do
    table.insert(ash_talk_r_seq, ash_talk_r[v])
    table.insert(ash_talk_d_seq, ash_talk_d[v])
    table.insert(ash_talk_u_seq, ash_talk_u[v])
end
ash_wrench_out_r = PTImageSequence("assets/wrn_r%02d.png", 1, 11, 30, 74)
ash_wrench_in_r = {}
for i=#ash_wrench_out_r,1,-1 do 
    ash_wrench_in_r[#ash_wrench_in_r+1] = ash_wrench_out_r[i]
end
ash_wrench_in_r[#ash_wrench_in_r+1] = ash_stand_r

ash_bedt_u = PTImageSequence("assets/bedt%d.png", 1, 4, 46, 16)

ash_getup_u = {
    PTImage("assets/getup1.png", 38+6, 43-3),
    PTImage("assets/getup2.png", 38+6, 44-3),
    PTImage("assets/getup3.png", 38+6, 45-3),
    PTImage("assets/getup4.png", 38, 46),
    PTImage("assets/getup5.png", 38, 47),
    PTImage("assets/getup6.png", 38, 48),
    PTImage("assets/getup7.png", 38, 49),
    PTImage("assets/getup8.png", 38, 50),
    PTImage("assets/getup9.png", 38, 51),
}

ash_dress_u = PTImageSequence("assets/dress%d.png", 1, 48, 24, 72)
ash_undress_u = {}
for i=#ash_dress_u,1,-1 do
    ash_undress_u[#ash_undress_u+1] = ash_dress_u[i]
end
ash_undress_u[#ash_undress_u+1] = ash_getup_u[7]
ash_undress_u[#ash_undress_u+1] = ash_getup_u[6]
ash_undress_u[#ash_undress_u+1] = ash_getup_u[5]
ash_undress_u[#ash_undress_u+1] = ash_bedt_u[1] 



ash = PTActor("ash")
ash.talk_x = 0
ash.talk_y = -80
ash.talk_font = font 
ash.sprite = PTSprite({
    PTAnimation("stand", {
        PTImage("assets/stand_d.png", 30, 74)
    }, 0, 180, false, false),
    PTAnimation("stand", {
        ash_stand_r
    }, 0, 90, true, false),
    PTAnimation("stand", {
        PTImage("assets/stand_u.png", 30, 74)
    }, 0, 0, false, false),
    PTAnimation("walk",
        PTImageSequence("assets/walk_r%d.png", 1, 8, 30, 74), 
        0, 90, true, false
    ),
    PTAnimation("talk",
        ash_talk_d_seq,
        8, 180, false, false 
    ),
    PTAnimation("talk",
        ash_talk_r_seq,
        8, 90, true, false 
    ),
    PTAnimation("talk",
        ash_talk_u_seq,
        8, 0, false, false 
    ),
    PTAnimation("wrench_out",
        ash_wrench_out_r,
        10, 90, true, false, false
    ),
    PTAnimation("wrench_in",
        ash_wrench_in_r,
        10, 90, true, false, false
    ),
    PTAnimation("sleep",
        {ash_getup_u[1]},
        10, 0, false, false, false
    ),
    PTAnimation("get_up",
        ash_getup_u,
        10, 0, false, false, false
    ),
    PTAnimation("dress",
        ash_dress_u,
        10, 0, false, false, false
    ),
    PTAnimation("undress",
        ash_undress_u,
        10, 0, false, false, false
    ),
    PTAnimation("bed",
        {ash_bedt_u[1]},
        0, 0, false, false, false
    ),
    PTAnimation("bed_talk",
        {ash_bedt_u[1], ash_bedt_u[2]},
        8, 0, false, false
    ),
    PTAnimation("face",
        {ash_bedt_u[3]},
        0, 0, false, false, false
    ),
    PTAnimation("kiss",
        {ash_bedt_u[4]},
        0, 0, false, false, false
    )
})
ash.collision = false
ash.hotspot_id = "ash"
ash.walk_rate = 8
PTActorSetAnimation(ash, "stand", 90)
PTAddActor(ash)

WRENCH_ONOMATOPOEIA = {
    "*BAM*",
    "*KLONK*",
    "*CLONG*",
    "*DANG*",
    "*DINK*",
    "*CRUNK*",
    "*BLIFF*",
    "*KRANG*",
    "*THUNK*",
}

WRENCH_SFX = {
    PCSPK_CLANG1,
    PCSPK_CLANG2,
    PCSPK_CLANG3,
    PCSPK_CLANG4,
    PCSPK_CLANG5,
    PCSPK_CLANG6,
    PCSPK_CLANG7,
}

WrenchSmack = function(delay)
    PTPCSpeakerPlayData(WRENCH_SFX[math.random(1, #WRENCH_SFX)])
    PTRoomTalk(ash.x + math.random(-3, 3), ash.y - 32 + math.random(-3, 3), WRENCH_ONOMATOPOEIA[math.random(1, #WRENCH_ONOMATOPOEIA)], font, EGA_BRBLUE, 400)
    PTRoomSleep(delay - 400)
    PTPCSpeakerStop()
end


maurot_img = PTImageSequence("assets/maurot%d.png", 1, 16, 12, 20)
mautlk_img = PTImageSequence("assets/mautlk%d.png", 1, 2, 12, 20)
mauslp_img = PTImageSequence("assets/mauslp%d.png", 1, 2, 12, 20)


maura = PTActor("Maura")
maura.talk_x = 0
maura.talk_y = -64
maura.talk_font = font
maura.talk_colour = { 210, 156, 240 }
maura.use_walkbox = false
maura.sprite = PTSprite({
    PTAnimation("sleep", {mauslp_img[2], mauslp_img[1]}, 2, 0, false, false, false),
    PTAnimation("wakeup", {
        mauslp_img[1], mauslp_img[1], mauslp_img[1],
        mautlk_img[1], mautlk_img[1], mautlk_img[1],
        mauslp_img[1], mauslp_img[1], mauslp_img[1],
        mautlk_img[1], mautlk_img[1], mautlk_img[1],
        mauslp_img[1], mauslp_img[1],
        mautlk_img[1], mautlk_img[1],
        mauslp_img[1], mauslp_img[1],
        mautlk_img[1], mautlk_img[1],
        maurot_img[15], maurot_img[14], maurot_img[13], maurot_img[14], maurot_img[15]
    }, 10, 0, false, false, false),
    PTAnimation("rotate", maurot_img, 10, 0, false, false, false),
    PTAnimation("talk", mautlk_img, 8, 0),
    PTAnimation("lie", {mautlk_img[1]}, 0, 0),
    PTAnimation("face", {maurot_img[15], maurot_img[14], maurot_img[13]}, 10, 0, false, false, false)
}, 0, 0, 0);
-- it's easier to have the blanket be Maura's hotspot
--maura.collision = true
--maura.hotspot_id = "maura"
maura.anim_stand = "lie"
PTActorSetAnimation(maura, "lie", 0) 
PTAddActor(maura)

ApplyEGAHints = function ()
    -- locker palette
    PTSetDitherHint({173, 206, 240}, "half", EGA_BRCYAN, EGA_WHITE)
    PTSetDitherHint({161, 202, 237}, "half", EGA_BRCYAN, EGA_WHITE)
    PTSetDitherHint({150, 187, 224}, "fill-a", EGA_BRCYAN, EGA_BRCYAN)
    PTSetDitherHint({139, 178, 217}, "fill-a", EGA_BRCYAN, EGA_BRCYAN)
    PTSetDitherHint({131, 171, 212}, "half", EGA_BRCYAN, EGA_CYAN)
    PTSetDitherHint({125, 166, 209}, "half", EGA_BRCYAN, EGA_CYAN)
    PTSetDitherHint({106, 145, 186}, "half", EGA_CYAN, EGA_BRCYAN)
    PTSetDitherHint({95, 133, 173}, "quarter-alt", EGA_BRCYAN, EGA_CYAN)
    PTSetDitherHint({85, 122, 161}, "fill-a", EGA_CYAN, EGA_CYAN)
    PTSetDitherHint({85, 122, 161}, "fill-a", EGA_CYAN, EGA_CYAN)
    PTSetDitherHint({66, 101, 138}, "fill-b", EGA_CYAN, EGA_DGRAY)
    PTSetDitherHint({47, 80, 115}, "fill-a", EGA_DGRAY, EGA_DGRAY)

    -- cress palette
    PTSetDitherHint({73, 99, 52}, "half", EGA_DGRAY, EGA_GREEN)
    PTSetDitherHint({84, 120, 56}, "fill-a", EGA_GREEN, EGA_GREEN)
    PTSetDitherHint({97, 143, 63}, "quarter", EGA_BRGREEN, EGA_GREEN)
    PTSetDitherHint({107, 163, 67}, "half", EGA_BRGREEN, EGA_GREEN)
    PTSetDitherHint({140, 227, 82}, "half", EGA_BRGREEN, EGA_BRYELLOW)
    PTSetDitherHint({198, 245, 169}, "half", EGA_BRGREEN, EGA_BRYELLOW)
    PTSetDitherHint({232, 247, 223}, "fill-a", EGA_WHITE, EGA_WHITE)
    PTSetDitherHint({194, 191, 169}, "fill-a", EGA_LGRAY, EGA_LGRAY)

    -- rust palette
    PTSetDitherHint({71, 61, 53}, "fill-a", EGA_BLACK, EGA_BLACK)
    PTSetDitherHint({99, 80, 63}, "fill-a", EGA_DGRAY, EGA_DGRAY)
    PTSetDitherHint({128, 95, 66}, "fill-a", EGA_BROWN, EGA_BROWN)
    PTSetDitherHint({156, 107, 64}, "fill-a", EGA_BROWN, EGA_BROWN)
    PTSetDitherHint({184, 115, 55}, "quarter-alt", EGA_BRRED, EGA_BROWN)
    PTSetDitherHint({212, 120, 40}, "half", EGA_BROWN, EGA_BRRED)

    -- steel palette
    PTSetDitherHint({28, 28, 28}, "fill-a", EGA_BLACK, EGA_BLACK) -- cabin sill
    PTSetDitherHint({36, 36, 36}, "fill-a", EGA_BLACK, EGA_BLACK) -- cabin floor riveting
    PTSetDitherHint({51, 50, 50}, "half", EGA_DGRAY, EGA_BLACK) -- cabin floor
    PTSetDitherHint({66, 64, 65}, "half", EGA_DGRAY, EGA_BLACK) -- cabin floor
    PTSetDitherHint({92, 84, 84}, "half", EGA_DGRAY, EGA_LGRAY) -- cabin wall
    PTSetDitherHint({112, 103, 95}, "half", EGA_LGRAY, EGA_BROWN) -- cabin wall underline
    PTSetDitherHint({128, 115, 106}, "half", EGA_LGRAY, EGA_DGRAY) -- seat back

    -- yellow 
    PTSetDitherHint({255, 231, 46}, "fill-a", EGA_BRYELLOW, EGA_BRYELLOW)
    PTSetDitherHint({237, 211, 38}, "half", EGA_LGRAY, EGA_BRYELLOW)
    PTSetDitherHint({222, 197, 35}, "half", EGA_BROWN, EGA_BRYELLOW)
    PTSetDitherHint({204, 178, 29}, "half", EGA_BROWN, EGA_BRYELLOW)
    PTSetDitherHint({189, 166, 19}, "fill-a", EGA_BROWN, EGA_BROWN)

    -- porcelain
    PTSetDitherHint({245, 246, 250}, "fill-a", EGA_WHITE, EGA_WHITE)
    PTSetDitherHint({240, 242, 252}, "fill-a", EGA_WHITE, EGA_WHITE)
    PTSetDitherHint({235, 238, 252}, "fill-a", EGA_WHITE, EGA_WHITE)
    PTSetDitherHint({232, 235, 250}, "fill-a", EGA_WHITE, EGA_WHITE)
    PTSetDitherHint({228, 231, 245}, "fill-a", EGA_WHITE, EGA_WHITE)
    PTSetDitherHint({220, 223, 247}, "fill-a", EGA_WHITE, EGA_WHITE)
    PTSetDitherHint({213, 219, 245}, "quarter-alt", EGA_LGRAY, EGA_WHITE)
    PTSetDitherHint({210, 215, 250}, "half", EGA_WHITE, EGA_LGRAY)
    PTSetDitherHint({200, 209, 250}, "half", EGA_BRBLUE, EGA_LGRAY)
    PTSetDitherHint({190, 198, 250}, "half", EGA_BRBLUE, EGA_LGRAY)
    PTSetDitherHint({173, 182, 240}, "half", EGA_DGRAY, EGA_LGRAY)
    PTSetDitherHint({155, 167, 235}, "fill-a", EGA_DGRAY, EGA_DGRAY)

    -- ash fleshtone
    PTSetDitherHint({222, 199, 186}, "half", EGA_WHITE, EGA_BRRED)
    PTSetDitherHint({217, 188, 171}, "fill-a", EGA_BRRED, EGA_BRRED)
    PTSetDitherHint({212, 178, 157}, "fill-a", EGA_BRRED, EGA_BRRED)
    PTSetDitherHint({204, 164, 139}, "fill-a", EGA_RED, EGA_RED)
    PTSetDitherHint({199, 152, 123}, "fill-a", EGA_RED, EGA_RED)
    PTSetDitherHint({212, 147, 112}, "fill-a", EGA_RED, EGA_RED)
    PTSetDitherHint({194, 133, 105}, "fill-a", EGA_BLACK, EGA_BLACK)
    PTSetDitherHint({161, 114, 88}, "fill-a", EGA_BLACK, EGA_BLACK)
    
    -- ash hair
    PTSetDitherHint({48, 0, 77}, "half", EGA_MAGENTA, EGA_BLACK)

    -- maura fleshtone
    PTSetDitherHint({194, 134, 97}, "half", EGA_BROWN, EGA_BRRED)
    PTSetDitherHint({176, 120, 83}, "fill-a", EGA_BROWN, EGA_BROWN)
    PTSetDitherHint({168, 112, 74}, "fill-a", EGA_BROWN, EGA_BROWN)
    PTSetDitherHint({158, 103, 66}, "fill-a", EGA_BROWN, EGA_BROWN)
    PTSetDitherHint({150, 97, 59}, "half", EGA_BROWN, EGA_DGRAY)
    PTSetDitherHint({125, 67, 46}, "fill-a", EGA_BLACK, EGA_BLACK)
    PTSetDitherHint({166, 88, 60}, "fill-a", EGA_RED, EGA_RED)


    -- navy
    PTSetDitherHint({10, 16, 79}, "fill-a", EGA_BLACK, EGA_BLACK)
    PTSetDitherHint({22, 25, 135}, "fill-a", EGA_BLUE, EGA_BLUE)
    PTSetDitherHint({31, 34, 145}, "fill-a", EGA_BLUE, EGA_BLUE)
    PTSetDitherHint({39, 45, 156}, "half", EGA_BLUE, EGA_DGRAY)
    PTSetDitherHint({48, 54, 166}, "half", EGA_BLUE, EGA_BRBLUE)
    PTSetDitherHint({58, 64, 176}, "half", EGA_BLUE, EGA_BRBLUE)
    PTSetDitherHint({67, 75, 186}, "fill-a", EGA_BRBLUE, EGA_BRBLUE)


    -- fabric tape
    PTSetDitherHint({184, 92, 92}, "half", EGA_RED, EGA_BROWN)
    PTSetDitherHint({247, 77, 77}, "fill-a", EGA_BRRED, EGA_BRRED)
    PTSetDitherHint({184, 177, 48}, "half", EGA_BRYELLOW, EGA_BROWN)
    PTSetDitherHint({245, 233, 0}, "fill-a", EGA_BRYELLOW, EGA_BRYELLOW)
    PTSetDitherHint({164, 104, 227}, "fill-a", EGA_BRMAGENTA, EGA_BRMAGENTA)
    PTSetDitherHint({131, 99, 166}, "fill-a", EGA_MAGENTA, EGA_MAGENTA)
    PTSetDitherHint({150, 219, 110}, "fill-a", EGA_BRGREEN, EGA_BRGREEN)
    PTSetDitherHint({126, 161, 104}, "fill-a", EGA_GREEN, EGA_GREEN)
    PTSetDitherHint({245, 155, 0}, "half", EGA_BRYELLOW, EGA_BRRED)
    PTSetDitherHint({184, 132, 48}, "half", EGA_BRRED, EGA_BROWN)

    -- lifeform
    PTSetDitherHint({243, 0, 0}, "fill-a", EGA_BRRED, EGA_BRRED)
    PTSetDitherHint({233, 0, 0}, "quarter-alt", EGA_RED, EGA_BRRED)
    PTSetDitherHint({228, 0, 0}, "quarter-alt", EGA_RED, EGA_BRRED)
    PTSetDitherHint({161, 0, 0}, "half", EGA_RED, EGA_BLACK)
    PTSetDitherHint({143, 0, 0}, "half", EGA_RED, EGA_BLACK)

    PTSetDitherHint({0xED, 0xB1, 0x00}, "fill-a", EGA_BRYELLOW, EGA_BRYELLOW) -- verb text
    PTSetDitherHint({0xD2, 0x9C, 0xF0}, "fill-a", EGA_BRMAGENTA, EGA_BRMAGENTA) -- maura speech text

    PTSetDitherHint({140, 46, 184}, "fill-a", EGA_MAGENTA, EGA_MAGENTA) -- score outline
    PTSetDitherHint({255, 222, 219}, "fill-a", EGA_WHITE, EGA_WHITE) -- score text
end

SetGraphicsMode = function (mode, room) 
    if mode == "ega" then
        PTSetOverscanColour(EGA_BLACK)
        PTSetPaletteRemapper("ega", "half")
        ApplyEGAHints()
    elseif mode == "cga" then
        if room == "cabin" then
            PTSetOverscanColour(EGA_DGRAY)
            PTSetPaletteRemapper("cga2a", "half")
            ApplyEGAHints()
        elseif room == "bridge" then
            PTSetOverscanColour(EGA_BLUE)
            PTSetPaletteRemapper("cga1a", "half")
            ApplyEGAHints()
        elseif room == "react" then
            PTSetOverscanColour(EGA_BLACK)
            PTSetPaletteRemapper("cga0a", "half")
            ApplyEGAHints()
        elseif room == "intro-alt" then
            PTSetOverscanColour(EGA_BLACK)
            PTSetPaletteRemapper("cga2b", "half")
            ApplyEGAHints()
        else    -- default, seen on intro screen
            PTSetOverscanColour(EGA_BLUE)
            PTSetPaletteRemapper("cga1a", "half")
            ApplyEGAHints()
        end
    else
        -- reset palette remapper
        PTSetOverscanColour(EGA_BLACK)
        PTSetPaletteRemapper()
    end
end


PTSetVerbReadyCheck(function () 
    return ash.moving == 0
end)


--- Scoring system
-- The game itself is pretty easy, but if you like you can play for points.
-- You get one point per unique line of dialogue.
-- We track this in vars.score, a table of hashes for every line of
-- speech the game has encountered. (We don't use the actual strings;
-- that would make the save files massive!)

-- Minimum possible points
MIN_SCORE = 29

-- Calc with: 
-- grep -E "PT(Room|Actor)Talk\(.*?\)" bridge.lua cabin.lua react.lua endgame.lua | wc -l
MAX_SCORE = 555
score_counter = 0
vars.score = {}
score_max_img = PTBackground(PTText(tostring(MAX_SCORE), font_tiny, 28, "center", {255, 222, 219}, {140, 46, 184}), 200-128, -13, 12)
score_img = PTBackground(PTText("0", font_tiny, 28, "center", {255, 222, 219}, {140, 46, 184}), 200-128, -28, 12)

TalkOrig = PTActorTalk
TalkScore = function(actor, message, font, colour, duration) 
    local hash = PTHash(message)
    if not vars.score[hash] then
        vars.score[hash] = true
        SetScore(score_counter + 1)
    end
    return TalkOrig(actor, message, font, colour, duration) 
end

SetScore = function(score)
    score_counter = score
    score_img.image = PTText(tostring(score), font_tiny, 28, "center", {255, 222, 219}, {140, 46, 184})
    
end

GetRanking = function ()
    local score = score_counter - MIN_SCORE
    local score_max = MAX_SCORE - MIN_SCORE
    if score <= 0 then 
        return "Chili dog enthusiast"
    elseif score < (score_max * 0.15) then
        return "Swabbie"
    elseif score < (score_max * 0.3) then
        return "Graduate swarf collector"
    elseif score < (score_max * 0.4) then
        return "Apprentice weld scrubber"
    elseif score < (score_max * 0.5) then
        return "Assistant cable wiggler"
    elseif score < (score_max * 0.6) then
        return "Licensed circuit bodger"
    elseif score < (score_max * 0.7) then
        return "Senior pipe thrasher"
    elseif score < (score_max * 0.85) then
        return "Chief engineer"
    elseif score < score_max then
        return "Masochist"
    end
    return "Committed masochist"
end

--- Modals
current_modal = nil
OpenModal = function(modal)
    CloseModal()
    current_modal = modal
    current_modal.visible = true
end

CloseModal = function()
    if current_modal then
        current_modal.visible = false
        current_modal.x = -1000
        current_modal.y = -1000
        current_modal = nil
    end
end

--- Inventory

-- The inventory panel:
-- Description line and inventory panel part of same group
-- Latch mechanism (moving into and out of the area)
-- Clicking a slot in the inventory when holding an item returns it to that slot
-- Right clicking while holding an item returns it
-- Clicking something on the screen triggers the action but keeps the item held
-- Picking something up adds to the next free slot, switches cursor to holding

-- SCUMM has one "global" inventory, but each item has an owner ID.
-- Inventory items should be defined ahead of time as part of resource definition.
-- When we do save games, we can define a list of props which are the things to be saved.

-- There's probably merit in making this as part of the core API; I just couldn't think
-- of a good one-size-fits-all approach. So for now this is part of the game code.


-- List of inventory items held by the player.
vars.inv_items = {}
-- The slots of the inventory UX.
vars.inv_item_slots = {}
-- Hotspot ID for the inventory item on the cursor.
current_inv = nil
-- Flag for whether the inventory UX is active.
inv_activated = false


-- Define all the inventory objects in the world.
-- Mapping between hotspot ID and image.
inv_images = {}
inv_images["lucky wrench"] = PTImage("assets/i_wrench.png", 0, 0, nil, false)
inv_images["fabric tape"] = PTImage("assets/i_tape.png", 0, 0, nil, false)
inv_images["roll of plastic"] = PTImage("assets/i_wrap.png", 0, 0, nil, false)
inv_images["stein"] = PTImage("assets/i_stein.png", 0, 0, nil, false)
inv_images["cress"] = PTImage("assets/i_cress.png", 0, 0, nil, false)
inv_blank = PTImage("assets/i_blank.png", 0, 0, nil, false)

vars.stein_state = "empty"
GetInvName = function(hotspot_id)
    if hotspot_id == "stein" then
        if vars.stein_state == "water" then
            return "stein fulla water"
        elseif vars.stein_state == "coffee" then
            return "stein fulla coffee"
        elseif vars.stein_state == "sludge" then
            return "stein fulla sludge"
        elseif vars.stein_state == "cress" then
            return "stein fulla cress"
        elseif vars.stein_state == "weevils" then
            return "stein fulla weevils"
        end
    end
    return hotspot_id
end

-- Create the sprites for the inventory UX.
-- The mouseover text of the inventory UX.
mouseover_text = PTBackground(nil, 0, -48, 10);
-- The panel image of the inventory UX.
inv_bg = PTBackground(
    PTImage("assets/inv.png", 128, 41),
    0, 0, 10)

-- When the mouse moves below certain y-positions on the screen,
-- slide the inventory in or out of view.
INV_TAG_HEIGHT = 9
INV_MENU_HEIGHT = 32
INV_Y_CAPTURE = SCREEN_HEIGHT-INV_TAG_HEIGHT 
INV_Y_RELEASE = SCREEN_HEIGHT-INV_MENU_HEIGHT
INV_MOVE_TIME = 500

SetInvActivated = function (active)
    if (inv_activated ~= active) then
        inv_activated = active
        if (inv_activated) then
            PTMoveObject(inv_group, inv_group.x, 0, INV_MOVE_TIME*(inv_group.y)/INV_MENU_HEIGHT, "ease-out", true)
        else
            PTMoveObject(inv_group, inv_group.x, INV_MENU_HEIGHT, INV_MOVE_TIME*(INV_MENU_HEIGHT-inv_group.y)/INV_MENU_HEIGHT, "ease-out", true)
        end
    end
end



-- The 7 inventory slot images. By default they will
-- use the blank image; a 16x16 transparent PNG. 
inv_slots = {
    PTBackground(inv_blank, 10-128, -24, 11),
    PTBackground(inv_blank, 36-128, -24, 11),
    PTBackground(inv_blank, 62-128, -24, 11),
    PTBackground(inv_blank, 88-128, -24, 11),
    PTBackground(inv_blank, 114-128, -24, 11),
    PTBackground(inv_blank, 140-128, -24, 11),
    PTBackground(inv_blank, 166-128, -24, 11),
}

-- Floppy disk button
menu_button = PTBackground(inv_blank, 230-128, -24, 11)
menu_button.collision = true
menu_button.name = "game menu"
menu_button.hotspot_id = "game menu"



-- Group object for the entire inventory UX.
inv_group = PTGroup(
    {
        inv_bg,
        mouseover_text,
        inv_slots[1],
        inv_slots[2],
        inv_slots[3],
        inv_slots[4],
        inv_slots[5],
        inv_slots[6],
        inv_slots[7],
        menu_button,
        score_img,
        score_max_img,
    },
    0, 32, 10,
    -math.floor(SCREEN_WIDTH/2), -SCREEN_HEIGHT
)
PTGlobalAddObject(inv_group)


-- Helper function to set the current inventory item.
SetCurrentInv = function(hotspot_id)
    if hotspot_id and inv_images[hotspot_id] then
        current_inv = hotspot_id
        inv_cursor_icon.image = inv_images[hotspot_id]
        PTSetMouseSprite(inv_cursor)
    else
        current_inv = nil
        PTSetMouseSprite(cursor_sp)
    end
    UpdateInvView()
    UpdateMouseOver()
end

GetNextFreeInvSlot = function()
    for i = 1, 7 do
        if not vars.inv_item_slots[i] then
            return i
        end
    end
    error("All slots full!")
end

-- Helper to add an item to the player's inventory.
AddInv = function(hotspot_id, slot)
    if not slot then
        slot = GetNextFreeInvSlot()
    end
    if vars.inv_item_slots[slot] and vars.inv_item_slots[slot] ~= hotspot_id then 
        error("Slot full!")
    end
    for i, item in ipairs(vars.inv_items) do
        if item == hotspot_id then
            PTLog("AddInv: attempted to pick up %s more than once", hotspot_id)
            return
        end
    end
    table.insert(vars.inv_items, hotspot_id)
    vars.inv_item_slots[slot] = hotspot_id
    UpdateInvView()
end

RemoveInv = function(hotspot_id)
    for i, item in ipairs(vars.inv_items) do 
        if item == hotspot_id then
            table.remove(vars.inv_items, i) 
            break
        end
    end
    for i, item in pairs(vars.inv_item_slots) do
        if item == hotspot_id then
            vars.inv_item_slots[i] = nil
            break
        end
    end
end

MoveToSlot = function ()
    local mouseover = PTGetMouseOver()
    for i, slot in ipairs(inv_slots) do
        if slot == mouseover then
            local inv = current_inv
            RemoveInv(inv)
            AddInv(inv, i)
            SetCurrentInv(nil)
            UpdateInvView()
            return
        end
    end
end

OpenGameMenu = function ()
    SetCurrentInv(nil)
    UpdateInvView()
    SetInvActivated(false)
    menu_panel.visible = true
    ChangeMouseOverText(nil)
    PTPauseGame()

end

CloseGameMenu = function ()
    menu_panel.visible = false
    PTUnpauseGame()
end

for key, value in pairs(inv_images) do
    PTOnVerb2("use", key, "empty slot", MoveToSlot)
    PTOnVerb2("use", key, "game menu", OpenGameMenu)
end
PTOnVerb("use", "game menu", OpenGameMenu)
PTOnVerb("look", "game menu", OpenGameMenu)


-- Update the image slots in the inventory to the current state 
UpdateInvView = function ()
    for i = 1, #inv_slots do 
        local item = vars.inv_item_slots[i]
        if item then
            inv_slots[i].image = inv_images[item]
            if item == current_inv then
                inv_slots[i].image = inv_blank
                inv_slots[i].name = nil
                inv_slots[i].hotspot_id = "empty slot"
            else
                inv_slots[i].name = GetInvName(item)
                inv_slots[i].hotspot_id = item
            end
            inv_slots[i].visible = true
            inv_slots[i].collision = true
        else
            inv_slots[i].image = inv_blank
            inv_slots[i].visible = true
            inv_slots[i].name = nil
            inv_slots[i].hotspot_id = "empty slot"
            inv_slots[i].collision = true
        end
    end
end




--- Keyboard code
PTOnEvent("keyDown", function(ev)
    PTLog("keydown: %s %d", ev.key, ev.flags)
    -- Map CTRL+Q to Quit.
    if ev.key == "q" and ((ev.flags & KEY_FLAG_CTRL) > 0) then
        PTQuit()
    -- Map CTRL+R to hot-reload the game code.
    elseif ev.key == "r" and ((ev.flags & KEY_FLAG_CTRL) > 0) then
        PTSaveState(0)
        PTLoadState(0)
    end
end)


--- Mouse code
-- Define the graphics for the mouse cursor.
--
-- The default crosshair is a sprite with two
-- animations; one for the default state, and
-- one to indicate the mouse is hovering over
-- something interactable.
cursor_sp = PTSprite({
    PTAnimation("default", {
        PTImage("assets/cursor.png", 9, 9, 0),
    }),
    PTAnimation("selected", {
        PTImage("assets/curssel.png", 9, 9, 0),
    }),
})
PTSpriteSetAnimation(cursor_sp, "default")

inv_cursor_sp = PTSprite({
    PTAnimation("default", {
        PTImage("assets/cursinv.png", 9, 9, 0),
    }),
    PTAnimation("selected", {
        PTImage("assets/cursinvs.png", 9, 9, 0),
    }),
})
PTSpriteSetAnimation(inv_cursor_sp, "default")

inv_cursor_icon = PTBackground(nil, 0, 0, -1)
PTSpriteSetAnimation(inv_cursor_sp, "default")
inv_cursor = PTGroup({
    inv_cursor_sp,
    inv_cursor_icon
})

-- Start off with the normal cursor sprite.
PTSetMouseSprite(cursor_sp)


-- Helper function to change the mouse hover text to a string.
ChangeMouseOverText = function (text) 
    if text then
        -- Create a new image containing the text.
        mouseover_text.image = PTText(text, font, 294, "center", {0xed, 0xb1, 0x00});
        -- The default image origin for a piece of text is the top-left corner.
        -- Because the anchor point of the text is the bottom-centre of the screen,
        -- we need to adjust the image origin to be the bottom-centre.
        local width, height = PTGetImageDims(mouseover_text.image)
        PTSetImageOrigin(mouseover_text.image, width/2, height)
        --PTLog("Setting mouseover text: %s, %d, %d\n", text, width/2, height)
    else
        -- Empty string, remove the text.
        mouseover_text.image = nil
    end
end

-- Helper function to update the screen when the mouse moves over a different object.
UpdateMouseOver = function ()
    local mouseover = PTGetMouseOver()
    if mouseover and mouseover.hotspot_id == "game menu" then
        ChangeMouseOverText("game menu")
    elseif mouseover and mouseover.name then 
        if current_inv then
            ChangeMouseOverText(string.format("use %s on %s", GetInvName(current_inv), mouseover.name))
        else
            ChangeMouseOverText(mouseover.name)
        end
    else
        if current_inv then
            ChangeMouseOverText(string.format("use %s on ...", GetInvName(current_inv)))
        else
            ChangeMouseOverText(nil)
        end
    end
    -- We're hovering over an object with a name property
    if mouseover and mouseover.name then
        PTSpriteSetAnimation(cursor_sp, "selected")
        PTSpriteSetAnimation(inv_cursor_sp, "selected")
    elseif mouseover and (mouseover.hotspot_id == "empty slot") then
        PTSpriteSetAnimation(cursor_sp, "default")
        PTSpriteSetAnimation(inv_cursor_sp, "selected")
    else
        PTSpriteSetAnimation(cursor_sp, "default")
        PTSpriteSetAnimation(inv_cursor_sp, "default")
    end
    UpdateInvView()
end


-- Callback for the mouseOver event.
-- Perentie will call this every time the mouse moves over a different
-- object with the "collision" flag set.
PTOnMouseOver(UpdateMouseOver)

WithinRect = function(x, y, width, height, test_x, test_y)
    return (test_x >= x) and (test_x < (x + width)) and (test_y >= y) and (test_y < (y + height))
end

NormalMouseDown = function (event) 
    -- PTLog("clicked da mouse %d %d %d\n", event.x, event.y, event.button )
    local mouseover = PTGetMouseOver()
    local in_modal = false
    if current_modal ~= nil then 
        local modal_x, modal_y = PTRoomToScreen(current_modal.x, current_modal.y)
        in_modal = WithinRect(modal_x, modal_y, current_modal.width, current_modal.height, event.x, event.y)
    end
    local allow_walking = not inv_activated and not in_modal

    if mouseover and mouseover.hotspot_id then
        if current_inv then
            if (event.button & 1) ~= 0 then -- left mouse button
                PTDoVerb2("use", current_inv, mouseover.hotspot_id)
                if allow_walking then
                    PTActorSetWalk(ash, mouseover.x, mouseover.y, mouseover.facing)
                    CloseModal()
                end
            elseif (event.button & 2) ~= 0 then -- right mouse button
                SetCurrentInv(nil)
            end
        else
            if (event.button & 1) ~= 0 then -- left mouse button
                PTDoVerb("use", mouseover.hotspot_id)
                if allow_walking then
                    PTActorSetWalk(ash, mouseover.x, mouseover.y, mouseover.facing)
                    CloseModal()
                end
            elseif (event.button & 2) ~= 0 then -- right mouse button
                PTDoVerb("look", mouseover.hotspot_id)
                if allow_walking then
                    PTActorSetWalk(ash, mouseover.x, mouseover.y, mouseover.facing)
                    CloseModal()
                end
            end
        end
    else
        -- no hotspot
        if (event.button & 2) ~= 0 and current_inv then
            SetCurrentInv(nil)
        else
            -- no hotspot, try your best to walk there
            PTDoVerb(nil, nil)
            local tmp_x, tmp_y = PTScreenToRoom(event.x, event.y)
            if allow_walking then
                PTActorSetWalk(ash, tmp_x, tmp_y)
                CloseModal()
            end
        end
   end

end
PTOnEvent("mouseDown", NormalMouseDown)


NormalMouseMove = function (event)
    -- Activate the inventory if the mouse is near the bottom. 
    if not inv_activated and event.y > INV_Y_CAPTURE then
        SetInvActivated(true)
    -- If the mouse has moved away, hide the inventory.
    elseif inv_activated and event.y < INV_Y_RELEASE then
        SetInvActivated(false)
    end
end

PTOnEvent("mouseMove", NormalMouseMove) 


vars.music = "assets/bgm.rad"
-- Callback to run when loading a saved state;
-- happens after the Lua code has been loaded in, but before the 
-- vars have been set.
PTOnLoadState(function (state)
    --ifs = PTPCSpeakerLoadIFS("keen.ifs")
    --PTPCSpeakerPlayData(ifs[22])
    -- 3 - cokecan
    -- 7 - gun
    --PTPCSpeakerPlayData(PCSPK_CLANG)
    --wave = PTWave("points8k.wav")
    --PTPCSpeakerPlaySample(wave)

    -- PTLog(inspect(state))
    if state.vars.inv_items and state.vars.inv_item_slots then
        vars.inv_items = state.vars.inv_items
        vars.inv_item_slots = state.vars.inv_item_slots
    end
    UpdateInvView()
    PTActorTalk = TalkScore
    if state.vars.score then 
        for _ in pairs(state.vars.score) do score_counter = score_counter + 1 end
    end
    if state.vars.graphics_mode == 1 then
        SetGraphicsMode("vga")
    elseif state.vars.graphics_mode == 2 then
        SetGraphicsMode("ega")
        -- CGA is set in the PTOnRoomLoad handler, not required to do so here
    end
    

    SetScore(score_counter)
    if PTRadGetPath() ~= state.vars.music then
        if state.vars.music then 
            PTRadLoad(state.vars.music)
        else
            PTRadLoad(vars.music)
        end
        PTRadPlay()
    end
end)


