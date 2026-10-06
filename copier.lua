local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local Copier = {}

function Copier.Apply(inputVal)
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
                local myHumanoid = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                
                if myHumanoid and humanoidDescription then
                    myHumanoid:ApplyDescription(humanoidDescription)
                end
            end)
        end
    end)
end

return Copier
