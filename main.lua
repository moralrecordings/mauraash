
PTSetGameInfo("au.net.moral.mauraash", "1.0.3", "Maura & Ash")

dofile("sfx.lua")
dofile("common.lua")
dofile("menu.lua")

dofile("inv.lua")
dofile("intro.lua")
dofile("cabin.lua")
dofile("bridge.lua")
dofile("react.lua")
dofile("endgame.lua")
dofile("outro.lua")

--PTSetDebugConsole(true, "COM4")
--PTSetWalkBoxDebug(1)
--PTSetImageDebug(1)

PTOnEvent("start", function ()
    --ifs = PTPCSpeakerLoadIFS("test.ifs")
    --PTPCSpeakerPlayData(ifs[4])
    --wave = PTWave("points8k.wav")
    --PTPCSpeakerPlaySample(wave)
    PTLog("oh noes!!!!\n")
    PTSwitchRoom("intro")
end)


