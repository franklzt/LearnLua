--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--
---@type BP_LuaCharacter_C
local M = UnLua.Class()

function M:Initialize(Initializer)

end

-- function M:UserConstructionScript()
-- end

function M:ReceiveBeginPlay()
    self.bUseControllerRotationYaw = false
    self.CharacterMovement.bOrientRotationToMovement = true;
    self.SpringArm.bUsePawnControlRotation = true
    self.BP_HealthCom.CurrentHealth = 100

    print("InActor")

    self.BP_ActionCom:InitActions()
    --local TempObjectClass = UE.UClass.Load("/Game/Blueprint/Actions/ActionBase.ActionBase_C")
    --self.BP_Action.Actions:Add(TempObjectClass)
end

-- function M:ReceiveEndPlay()
-- end

-- function M:ReceiveTick(DeltaSeconds)
-- end

-- function M:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function M:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function M:ReceiveActorEndOverlap(OtherActor)
-- end

function M:PrimaryAttack_Pressed()

end

function M:SecondaryAttack_Pressed()
end

function M:PrimaryInteract_Pressed()
end

function M:Dash_Pressed()

end

function M:Sprint_Pressed()

end

function M:Sprint_Released()

end

function M:Jump_Pressed()
   self:Jump()
end

function M:Turn(AxisValue)
    self:AddControllerYawInput(AxisValue)
end

function M:LookUp(AxisValue)
    self:AddControllerPitchInput(AxisValue)
end

function M:MoveForward(AxisValue)
    local Rotation = self:GetControlRotation()
    Rotation:Set(0, Rotation.Yaw, 0)
    local Direction = Rotation:ToVector() -- Rotation:GetForwardVector()
    self:AddMovementInput(Direction, AxisValue)
end

function M:MoveRight(AxisValue)
    local Rotation = self:GetControlRotation()
    Rotation:Set(0, Rotation.Yaw, 0)
    local Direction = Rotation:GetRightVector()
    self:AddMovementInput(Direction, AxisValue)
end

return M
