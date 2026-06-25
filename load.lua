-- GitHub'daki asıl menü dosyasını indirip ekrana basan gizli tetikleyici
local link = "https://github.com"
game:GetObjects(game:HttpGet(link))[1].Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
