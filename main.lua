-- File: main.lua (Link Raw này dùng để loadstring chính)
local BaseURL = "https://github.com/lechithien191919-jpg/AvatarCopy/tree/main" -- Ví dụ: https://raw.githubusercontent.com/TênTàiKhoản/TênRepo/main/

-- Tải giao diện và logic từ các file riêng biệt
local UI = loadstring(game:HttpGet(BaseURL .. "ui.lua", true))()
local Copier = loadstring(game:HttpGet(BaseURL .. "copier.lua", true))()

-- Gắn sự kiện khi bấm nút Copy
UI.CopyBtn.MouseButton1Click:Connect(function()
    Copier.ApplyAvatar(UI.TextBox.Text)
end)
