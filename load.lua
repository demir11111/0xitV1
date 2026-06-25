-- =============================================================================
-- 0xit V1 MASTER - PARÇA 1: GÖVDE VE ORTASI BEYAZ PARLAMA MOTORU
-- =============================================================================
if game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("OxitGuiTuvali") then
    game.Players.LocalPlayer.PlayerGui.OxitGuiTuvali:Destroy()
end

local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local hesapYasiGunu = Player.AccountAge
local profilResmiUrl = "rbxthumb://type=AvatarHeadShot&id=" .. Player.UserId .. "&w=150&h=150"

_G.OxitNoclipActive = false
_G.OxitNoclipConnection = nil

local Ekran = Instance.new("ScreenGui")
Ekran.Name = "OxitGuiTuvali"
Ekran.ResetOnSpawn = false
Ekran.Parent = PlayerGui

local DisKutu = Instance.new("Frame")
DisKutu.Size = UDim2.new(0, 600, 0, 320) 
DisKutu.Position = UDim2.new(0.5, -300, 0, -400) 
DisKutu.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
DisKutu.BorderSizePixel = 0
DisKutu.Active = true
DisKutu.Draggable = true
DisKutu.Parent = Ekran

local DisKose = Instance.new("UICorner")
DisKose.CornerRadius = UDim.new(0, 20)
DisKose.Parent = DisKutu

local IcKutu = Instance.new("Frame")
IcKutu.Size = UDim2.new(1, -2, 1, -2) 
IcKutu.Position = UDim2.new(0, 1, 0, 1)
IcKutu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IcKutu.BorderSizePixel = 0
IcKutu.Parent = DisKutu

local IcKose = Instance.new("UICorner")
IcKose.CornerRadius = UDim.new(0, 19)
IcKose.Parent = IcKutu

pcall(function()
    local GriGradient = Instance.new("UIGradient")
    GriGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 17)),   
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)), -- Ortası beyaz parlama!
        ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 82, 88))     
    })
    GriGradient.Rotation = 90
    GriGradient.Parent = IcKutu
end)

local HoverSes = Instance.new("Sound")
HoverSes.Name = "HoverSes"
HoverSes.SoundId = "rbxassetid://9114223190"
HoverSes.Volume = 0.5
HoverSes.Parent = DisKutu
-- =============================================================================
-- 0xit V1 MASTER - PARÇA 2: LOGO, X BUTONU VE YEŞİL HİLE PANELİ
-- =============================================================================
local LogoOxit = Instance.new("TextLabel")
LogoOxit.Size = UDim2.new(0, 180, 0, 40)
LogoOxit.Position = UDim2.new(0, 25, 0, 15)
LogoOxit.Text = "0xit <font color='rgb(255,75,75)'><i>V1</i></font>"
LogoOxit.RichText = true
LogoOxit.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoOxit.TextSize = 22
LogoOxit.Font = Enum.Font.SourceSansBold
LogoOxit.BackgroundTransparency = 1
LogoOxit.TextXAlignment = Enum.TextXAlignment.Left
LogoOxit.Parent = IcKutu

local KapatButon = Instance.new("TextButton")
KapatButon.Size = UDim2.new(0, 40, 0, 24)
KapatButon.Position = UDim2.new(1, -65, 0, 15)
KapatButon.Text = "X"
KapatButon.TextColor3 = Color3.fromRGB(255, 230, 230)
KapatButon.TextSize = 12
KapatButon.Font = Enum.Font.SourceSansBold
KapatButon.BackgroundColor3 = Color3.fromRGB(190, 40, 40)
KapatButon.BorderSizePixel = 0
KapatButon.Parent = IcKutu

local KapatKose = Instance.new("UICorner")
KapatKose.CornerRadius = UDim.new(0, 6)
KapatKose.Parent = KapatButon

local YesilPanelDis = Instance.new("Frame")
YesilPanelDis.Size = UDim2.new(0, 330, 0, 215)
YesilPanelDis.Position = UDim2.new(0, 25, 0, 70)
YesilPanelDis.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
YesilPanelDis.BorderSizePixel = 0
YesilPanelDis.Parent = IcKutu
Instance.new("UICorner", YesilPanelDis).CornerRadius = UDim.new(0, 12)

local YesilPanel = Instance.new("Frame")
YesilPanel.Size = UDim2.new(1, -2, 1, -2)
YesilPanel.Position = UDim2.new(0, 1, 0, 1)
YesilPanel.BackgroundColor3 = Color3.fromRGB(39, 174, 96)
YesilPanel.BorderSizePixel = 0
YesilPanel.Parent = YesilPanelDis
Instance.new("UICorner", YesilPanel).CornerRadius = UDim.new(0, 11)

local function KontrolKutusuYap(isim, yPos)
    local PanelDis = Instance.new("Frame")
    PanelDis.Size = UDim2.new(1, -30, 0, 45) 
    PanelDis.Position = UDim2.new(0, 15, 0, yPos)
    PanelDis.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    PanelDis.BorderSizePixel = 0
    PanelDis.Parent = YesilPanel
    Instance.new("UICorner", PanelDis).CornerRadius = UDim.new(0, 8)
    
    local Panel = Instance.new("Frame")
    Panel.Size = UDim2.new(1, -2, 1, -2)
    Panel.Position = UDim2.new(0, 1, 0, 1)
    Panel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Panel.BorderSizePixel = 0
    Panel.Parent = PanelDis
    Instance.new("UICorner", Panel).CornerRadius = UDim.new(0, 7)
    
    pcall(function()
        local KutuGradient = Instance.new("UIGradient")
        KutuGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 130, 72)),  
            ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 80, 45))    
        })
        KutuGradient.Rotation = 90
        KutuGradient.Parent = Panel
    end)
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0, 120, 1, 0)
    Label.Position = UDim2.new(0, 15, 0, 0)
    Label.Text = isim
    Label.TextColor3 = Color3.fromRGB(245, 245, 245)
    Label.Font = Enum.Font.SourceSansBold
    Label.TextSize = 14
    Label.BackgroundTransparency = 1
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Panel
    return Panel
end

local NoclipKutu = KontrolKutusuYap("NOCLIP", 15)
local NoclipToggle = Instance.new("TextButton")
NoclipToggle.Size = UDim2.new(0, 65, 0, 26)
NoclipToggle.Position = UDim2.new(1, -80, 0, 9)
NoclipToggle.Text = "OFF"
NoclipToggle.BackgroundColor3 = Color3.fromRGB(225, 75, 75)
NoclipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipToggle.Font = Enum.Font.SourceSansBold
NoclipToggle.TextSize = 12
NoclipToggle.Parent = NoclipKutu
Instance.new("UICorner", NoclipToggle).CornerRadius = UDim.new(0, 5)

local SpeedKutu = KontrolKutusuYap("Speed", 80)
local SpeedInput = Instance.new("TextBox")
SpeedInput.Size = UDim2.new(0, 110, 0, 26)
SpeedInput.Position = UDim2.new(1, -125, 0, 9)
SpeedInput.Text = "sayı girin"
SpeedInput.TextColor3 = Color3.fromRGB(150, 150, 150)
SpeedInput.BackgroundColor3 = Color3.fromRGB(22, 22, 24)
SpeedInput.Font = Enum.Font.SourceSans
SpeedInput.TextSize = 12
SpeedInput.Parent = SpeedKutu
Instance.new("UICorner", SpeedInput).CornerRadius = UDim.new(0, 4)

local JumpKutu = KontrolKutusuYap("Jump power", 145)
local JumpInput = Instance.new("TextBox")
JumpInput.Size = UDim2.new(0, 110, 0, 26)
JumpInput.Position = UDim2.new(1, -125, 0, 9)
JumpInput.Text = "sayı girin"
JumpInput.TextColor3 = Color3.fromRGB(150, 150, 150)
JumpInput.BackgroundColor3 = Color3.fromRGB(22, 22, 24)
JumpInput.Font = Enum.Font.SourceSans
JumpInput.TextSize = 12
JumpInput.Parent = JumpKutu
Instance.new("UICorner", JumpInput).CornerRadius = UDim.new(0, 4)
-- =============================================================================
-- 0xit V1 MASTER - PARÇA 3: KIRMIZI PANEL, SESLİ HOVER VE SÜZÜLME MOTORU
-- =============================================================================
local KirmiziPanelDis = Instance.new("Frame")
KirmiziPanelDis.Size = UDim2.new(0, 190, 0, 215)
KirmiziPanelDis.Position = UDim2.new(1, -215, 0, 70)
KirmiziPanelDis.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
KirmiziPanelDis.BorderSizePixel = 0
KirmiziPanelDis.Parent = IcKutu
Instance.new("UICorner", KirmiziPanelDis).CornerRadius = UDim.new(0, 12)

local KirmiziPanel = Instance.new("Frame")
KirmiziPanel.Size = UDim2.new(1, -2, 1, -2)
KirmiziPanel.Position = UDim2.new(0, 1, 0, 1)
KirmiziPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KirmiziPanel.BorderSizePixel = 0
KirmiziPanel.Parent = KirmiziPanelDis
Instance.new("UICorner", KirmiziPanel).CornerRadius = UDim.new(0, 11)

pcall(function()
    local KirmiziGradient = Instance.new("UIGradient")
    KirmiziGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(115, 16, 16)),   
        ColorSequenceKeypoint.new(1, Color3.fromRGB(215, 38, 38))    
    })
    KirmiziGradient.Rotation = 90
    KirmiziGradient.Parent = KirmiziPanel
end)

local BilgiEtiketi = Instance.new("TextLabel")
BilgiEtiketi.Size = UDim2.new(1, -24, 1, -80)
BilgiEtiketi.Position = UDim2.new(0, 12, 0, 15)
BilgiEtiketi.Text = "Nick: " .. Player.Name .. "\n\nHesap Yaşı: " .. hesapYasiGunu .. " Gün\n\n0xit V1\n\nKullandığınız için teşekkürler"
BilgiEtiketi.TextColor3 = Color3.fromRGB(250, 250, 250)
BilgiEtiketi.TextSize = 12
BilgiEtiketi.Font = Enum.Font.SourceSansBold
BilgiEtiketi.TextWrapped = true
BilgiEtiketi.TextYAlignment = Enum.TextYAlignment.Top
BilgiEtiketi.TextXAlignment = Enum.TextXAlignment.Left
BilgiEtiketi.BackgroundTransparency = 1
BilgiEtiketi.Parent = KirmiziPanel

local ProfilResmi = Instance.new("ImageLabel")
ProfilResmi.Size = UDim2.new(0, 55, 0, 55)
ProfilResmi.Position = UDim2.new(1, -67, 1, -67)
ProfilResmi.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
ProfilResmi.BorderSizePixel = 0
ProfilResmi.Parent = KirmiziPanel
Instance.new("UICorner", ProfilResmi).CornerRadius = UDim.new(1, 0)
local prStroke = Instance.new("UIStroke", ProfilResmi)
prStroke.Color = Color3.fromRGB(255,255,255)
prStroke.Thickness = 1

spawn(function()
	pcall(function()
		local canlıResim, hazırMi = game.Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
		ProfilResmi.Image = canlıResim
		ProfilResmi.BackgroundTransparency = 1
	end)
end)

local function TextboxAyarla(box)
    box.Focused:Connect(function() if box.Text == "sayı girin" then box.Text = "" box.TextColor3 = Color3.fromRGB(255,255,255) end end)
    box.FocusLost:Connect(function() if box.Text == "" then box.Text = "sayı girin" box.TextColor3 = Color3.fromRGB(150,150,150) end end)
end
TextboxAyarla(SpeedInput)
TextboxAyarla(JumpInput)

SpeedInput.FocusLost:Connect(function()
    local sayi = tonumber(SpeedInput.Text)
    if sayi and Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = sayi
    end
end)

JumpInput.FocusLost:Connect(function()
    local sayi = tonumber(JumpInput.Text)
    if sayi and Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.UseJumpPower = true
        Player.Character.Humanoid.JumpPower = sayi
    end
end)

NoclipToggle.MouseButton1Click:Connect(function()
    _G.OxitNoclipActive = not _G.OxitNoclipActive
    local hedon = _G.OxitNoclipActive and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(225, 75, 75)
    local hedyaz = _G.OxitNoclipActive and "ON" or "OFF"
    
    TweenService:Create(NoclipToggle, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {BackgroundColor3 = hedon}):Play()
    NoclipToggle.Text = hedyaz
    
    if _G.OxitNoclipActive then
        _G.OxitNoclipConnection = RunService.RenderStepped:Connect(function()
            if _G.OxitNoclipActive and Player.Character then
                for _, parca in pairs(Player.Character:GetChildren()) do
                    if parca:IsA("BasePart") and parca.Name ~= "HumanoidRootPart" then
                        parca.CanCollide = false
                    end
                end
            end
        end)
    else
        if _G.OxitNoclipConnection then _G.OxitNoclipConnection:Disconnect() end
        if Player.Character then
            for _, parca in pairs(Player.Character:GetChildren()) do
                if parca:IsA("BasePart") then parca.CanCollide = true end
            end
        end
    end
end)

local AnimasyonBilgisi = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local function BuyumeEfektiEkle(hedefKutu)
	if not hedefKutu then return end
	local orijinalBoyut = hedefKutu.Size
	local BuyukBoyut = UDim2.new(orijinalBoyut.X.Scale, hedefKutu.AbsoluteSize.X * 1.05, orijinalBoyut.Y.Scale, hedefKutu.AbsoluteSize.Y * 1.05)
	hedefKutu.MouseEnter:Connect(function()
		TweenService:Create(hedefKutu, AnimasyonBilgisi, {Size = BuyukBoyut}):Play()
		if HoverSes then HoverSes:Play() end
	end)
	hedefKutu.MouseLeave:Connect(function()
		TweenService:Create(hedefKutu, AnimasyonBilgisi, {Size = orijinalBoyut}):Play()
	end)
end
BuyumeEfektiEkle(YesilPanel)
BuyumeEfektiEkle(KirmiziPanel)

local function MenuyuAcAnimasyonlu()
    Ekran.Enabled = true
    task.wait(3) 
    DisKutu:TweenPosition(UDim2.new(0.5, -300, 0.5, -160), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.6, true)
end

local function MenuyuKapatAnimasyonlu()
    DisKutu:TweenPosition(UDim2.new(0.5, -300, 0, -400), Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.4, true, function() 
        Ekran.Enabled = false 
        pcall(function()
            StarterGui:SetCore("SendNotification", {Title = "0xit V1", Text = "Sağ CTRL ile tekrar menüyü açebilirsin.", Duration = 4})
        end)
    end)
end

spawn(MenuyuAcAnimasyonlu)
KapatButon.MouseButton1Click:Connect(MenuyuKapatAnimasyonlu)

local menuAcikMi = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightControl then
        menuAcikMi = not menuAcikMi
        if menuAcikMi then MenuyuAcAnimasyonlu() else MenuyuKapatAnimasyonlu() end
    end
end)
