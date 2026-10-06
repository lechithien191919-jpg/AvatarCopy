-- File: copier.lua
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local Module = {}

function Module.ApplyAvatar(inputVal)
    if inputVal == "" then return end
    
    task.spawn(function()
        local targetUserId = tonumber(inputVal)
        
        -- Nếu nhập tên tài khoản, tự động tìm UserId tương ứng trên toàn hệ thống Roblox
        if not targetUserId then
            pcall(function()
                targetUserId = Players:GetUserIdFromNameAsync(inputVal)
            end)
        end
        
        if targetUserId then
            pcall(function()
                -- Lấy toàn bộ thông tin ngoại hình (tóc, quần áo, phụ kiện...) qua UserId bất kể online/offline
                local humanoidDescription = Players:GetHumanoidDescriptionFromUserIdAsync(targetUserId)
                
                local myHumanoid = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                if myHumanoid and humanoidDescription then
                    myHumanoid:ApplyDescription(humanoidDescription)
                end
            end)
        end
    end)
end

return Module
