-- File: main.lua
local BaseURL = "https://raw.githubusercontent.com/lechithien191919-jpg/AvatarCopy/main/"

local UIModule = loadstring(game:HttpGet(BaseURL .. "ui.lua", true))()
local CopierModule = loadstring(game:HttpGet(BaseURL .. "copier.lua", true))()

if UIModule and CopierModule then
    local UI = UIModule.Create()
    
    UI.CopyBtn.MouseButton1Click:Connect(function()
        CopierModule.Run(UI.TextBox.Text)
    end)
else
    warn("AvatarCopy: Lỗi tải module từ GitHub!")
end
