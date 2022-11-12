
--Author:Administrator
--Date:2022.10.20-18.33.26


local ActionBase_C = UnLua.Class()

--FString()
--function ActionBase_C:GetModuleName()
--end

--void(AActor*)
function ActionBase_C:CanStart(Instigator)
    if self:IsRunning() then return false end
    local Comp = self:GetOwningComponent()
    if Comp.ActiveGameplayTags:HasAny(self.BlockedTags) then return false end
    return true;
end

--void(AActor*)
--function ActionBase_C:StopAction(Instigator)
--end

--void()
--function ActionBase_C:IsRunning()
--end

--void(UActionComponent_C*)
--function ActionBase_C:Initialize(NewActionComp)
--end

--void(AActor*)
--function ActionBase_C:StartAction(Instigator)
--end

--void(int32)
--function ActionBase_C:ExecuteUbergraph(EntryPoint)
--end

return ActionBase_C