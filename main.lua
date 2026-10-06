local BaseURL = "https://raw.githubusercontent.com/lechithien191919-jpg/AvatarCopy/main/"

local successUI, UI = pcall(function()
    return loadstring(game:HttpGet(BaseURL .. "ui.lua", true))()
end)

local successCopier, Copier = pcall(function()
    return loadstring(game:HttpGet(BaseURL .. "copier.lua", true))()
end)

if successUI and successCopier and UI and Copier then
    UI.CopyBtn.MouseButton1Click:Connect(function()
        Copier.Apply(UI.TextBox.Text)
    end)
else
    warn("AvatarCopy: Lỗi tải các module từ GitHub!")
end
