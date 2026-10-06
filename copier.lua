-- File: copier.lua
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local Copier = {}

function Copier.Run(inputVal)
    if inputVal == "" then return end
    
    task.spawn(function()
        local targetUserId = tonumber(inputVal)
        
        if not targetUserId then
            pcall(function()
                targetUserId = Players:GetUserIdFromNameAsync(inputVal)
            end)
        end
        
        if targetUserId then
            pcall(function()
                local humanoidDescription = Players:GetHumanoidDescriptionFromUserIdAsync(targetUserId)
                local character = LP.Character
                local myHumanoid = character and character:FindFirstChildOfClass("Humanoid")
                
                if humanoidDescription and myHumanoid then
                    -- Dọn dẹp phụ kiện cũ trước khi gán đồ mới để tránh kẹt đồ
                    for _, child in ipairs(character:GetChildren()) do
                        if child:IsA("Accessory") or child:IsA("Clothing") then
                            child:Destroy()
                        end
                    end
                    myHumanoid:ApplyDescription(humanoidDescription)
                end
            end)
        end
    end)
end

return Copier
