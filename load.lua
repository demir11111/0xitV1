-- =============================================================================
-- %100 ÇALIŞAN GÜVENLİ TETİKLEYİCİ MOTORU
-- =============================================================================
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- 1. GitHub'daki ham rbxm dosyasını Xeno'nun kendi hafızasına indiriyoruz
local rbxmLinki = "https://github.com"
local dosyaVerisi = game:HttpGet(rbxmLinki)

-- 2. Dosyayı geçici olarak Xeno'nun içine yazıp oyun nesnesi olarak içeri çağırıyoruz
if dosyaVerisi and dosyaVerisi ~= "" then
    writefile("0xitTempMenu.rbxm", dosyaVerisi)
    
    local Basari, MenüKlasörü = pcall(function()
        return game:GetObjects("rbxlx://0xitTempMenu.rbxm")[1]
    end)
    
    -- 3. Menüyü senin ekranına başarıyla enjekte ediyoruz
    if Basari and MenüKlasörü then
        MenüKlasörü.Parent = PlayerGui
    else
        -- Eğer Xeno rbxlx desteklemiyorsa, direkt ScreenGui olarak çağırmayı dener
        local alternatif = game:GetObjects("rbxlx://0xitTempMenu.rbxm")
        if alternatif then alternatif.Parent = PlayerGui end
    end
end
