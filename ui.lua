-- File: ui.lua
local UI = {}

function UI.Create()
    local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    ScreenGui.Name = "AvatarCopierGui"

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 240, 0, 180)
    MainFrame.Position = UDim2.new(0.5, -120, 0.4, -90)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.Active = true
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0.25, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "AVATAR COPY PRO"
    Title.TextColor3 = Color3.fromRGB(0, 255, 128)
    Title.TextSize, Title.Font = 14, Enum.Font.SourceSansBold

    local TextBox = Instance.new("TextBox", MainFrame)
    TextBox.Size = UDim2.new(0.85, 0, 0.28, 0)
    TextBox.Position = UDim2.new(0.075, 0, 0.32, 0)
    TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.PlaceholderText = "Nhập UserId hoặc Username..."
    TextBox.Text = ""
    TextBox.TextSize, TextBox.Font = 12, Enum.Font.SourceSans
    Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 6)

    local CopyBtn = Instance.new("TextButton", MainFrame)
    CopyBtn.Size = UDim2.new(0.85, 0, 0.25, 0)
    CopyBtn.Position = UDim2.new(0.075, 0, 0.68, 0)
    CopyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 80)
    CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyBtn.Text = "COPY AVATAR"
    CopyBtn.TextSize, CopyBtn.Font = 13, Enum.Font.SourceSansBold
    Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 6)

    return {
        TextBox = TextBox,
        CopyBtn = CopyBtn
    }
end

return UI
