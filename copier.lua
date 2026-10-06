-- File: copier.lua
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local Copier = {}

function Copier.Run(inputVal)
    if inputVal == "" then return end
    
    task.spawn(function()
        local targetUserId = tonumber(inputVal)
        
        -- Nếu nhập tên, tìm UserId với pcall chống lỗi sập script
        if not targetUserId then
            local successName, errName = pcall(function()
                targetUserId = Players:GetUserIdFromNameAsync(inputVal)
            end)
            if not successName then
                warn("AvatarCopy Lỗi tìm tên: " .. tostring(errName))
            end
        end
        
        if targetUserId then
            local successDesc, humanoidDescription = pcall(function()
                return Players:GetHumanoidDescriptionFromUserIdAsync(targetUserId)
            end)
            
            if successDesc and humanoidDescription then
                local character = LP.Character
                local myHumanoid = character and character:FindFirstChildOfClass("Humanoid")
                
                if myHumanoid then
                    -- Xóa sạch đồ cũ để tránh xung đột phụ kiện
                    for _, child in ipairs(character:GetChildren()) do
                        if child:IsA("Accessory") or child:IsA("Clothing") then
                            child:Destroy()
                        end
                    end
                    
                    -- Áp dụng Description mới
                    myHumanoid:ApplyDescription(humanoidDescription)
                    print("AvatarCopy: Đã copy thành công avatar của ID: " .. targetUserId)
                end
            else
                warn("AvatarCopy: Không thể lấy HumanoidDescription của ID này!")
            end
        else
            warn("AvatarCopy: Không tìm thấy User ID hợp lệ!")
        end
    end)
end

return Copier
