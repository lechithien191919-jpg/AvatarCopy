-- File: main.lua
local BaseURL = "https://raw.githubusercontent.com/lechithien191919-jpg/AvatarCopy/main/"

local successUI, UIModule = pcall(function()
    return loadstring(game:HttpGet(BaseURL .. "ui.lua", true))()
end)

local successCopier, CopierModule = pcall(function()
    return loadstring(game:HttpGet(BaseURL .. "copier.lua", true))()
end)

if successUI and successCopier and UIModule and CopierModule then
    local UI = UIModule.Create()
    
    UI.CopyBtn.MouseButton1Click:Connect(function()
        CopierModule.Run(UI.TextBox.Text)
    end)
else
    warn("AvatarCopy: Không thể tải các module từ GitHub!")
end
