-- File: copier.lua
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local Copier = {}

function Copier.Run(inputVal)
    if inputVal == "" then return end
    
    task.spawn(function()
        local targetUserId = tonumber(inputVal)
        
        -- Nếu nhập tên thì chuyển sang UserId
        if not targetUserId then
            pcall(function()
                targetUserId = Players:GetUserIdFromNameAsync(inputVal)
            end)
        end
        
        if targetUserId then
            local humanoidDescription
            -- Vòng lặp thử tải Description để tránh nghẽn mạng
            for i = 1, 3 do
                local success = pcall(function()
                    humanoidDescription = Players:GetHumanoidDescriptionFromUserIdAsync(targetUserId)
                end)
                if success and humanoidDescription then break end
                task.wait(0.3)
            end
            
            local character = LP.Character
            local myHumanoid = character and character:FindFirstChildOfClass("Humanoid")
            
            if humanoidDescription and myHumanoid then
                -- Xóa đồ cũ trước khi áp dụng đồ mới
                for _, child in ipairs(character:GetChildren()) do
                    if child:IsA("Accessory") or child:IsA("Clothing") or child:IsA("ShirtGraphic") then
                        child:Destroy()
                    end
                end
                
                pcall(function()
                    myHumanoid:ApplyDescription(humanoidDescription)
                end)
            end
        end
    end)
end

return Copier
