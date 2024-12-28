local Player = game.Players.LocalPlayer

local function PreventStun()
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:FindFirstChild("Humanoid")
    if Humanoid then
        Humanoid.StateChanged:Connect(function(_, newState)
            if newState == Enum.HumanoidStateType.FallingDown or newState == Enum.HumanoidStateType.Ragdoll then
                Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
        end)
    end
end

Player.CharacterAdded:Connect(PreventStun)
if Player.Character then
    PreventStun()
end
