--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_ActionCom_C
local M = UnLua.Class()

 function M:Initialize(Initializer)

 end

 function M:ReceiveBeginPlay()
    local TempObjectClass = UE.UClass.Load("/Game/Blueprint/Actions/ActionBase.ActionBase_C")
    self.ActionsClass:Add(TempObjectClass)
    print("InComComponent")
 end


 function M:InitActions()
    local TempObj = UE.NewObject(self.ActionsClass[1],self:GetOwner(),self:GetOwner())
    --TempObj.AddToRoot()
    self.ActionObject:Add(TempObj)
 end

 function M:ReceiveEndPlay()
  
 end

 function M:ReceiveTick(DeltaSeconds)
  -- local len = self.ActionObject:Num()
  -- for i = 1, len do 
  -- self.ActionObject:Get(i):StartAction()
   --end

   -- for k,v in pairs(self.ActionObject) do 
   --    v:StartAction()
   -- end
 end

return M
