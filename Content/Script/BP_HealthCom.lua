--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_HealthCom_C
local M = UnLua.Class()

function M:Initialize(Initializer)
    local TempObjectClass = UE.UClass.Load("/Game/Blueprint/Actions/ProjectileAction.ProjectileAction_C")
    --self.ActionClasses = UE.TArray(UE.UClass)
    --self.ActionClasses.Add(TempObjectClass:GetClass())
    self.MaxEnemy = 5   


end

 function M:ReceiveBeginPlay()
    print(self.MaxEnemy)
 end

-- function M:ReceiveEndPlay()
-- end

-- function M:ReceiveTick(DeltaSeconds)
-- end

return M
