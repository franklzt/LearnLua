
--Author:Administrator
--Date:2022.10.20-17.20.56


local ActionComponent_C = UnLua.Class()


function ActionComponent_C:UserConstructionScript()
    self:SetIsReplicatedByDefault(true)
 end

--FString()
--function ActionComponent_C:GetModuleName()
--end

--void(UActionBase_C*)
function ActionComponent_C:RemoveAction(ActionToRemove)
    if ActionToRemove == nil or ActionToRemove:IsRuning() then return end
    self.Actions:Remove(ActionToRemove)
end

--void(AActor*, UClass*)
function ActionComponent_C:AddAction(Instigator, ActionClass)
    if ActionClass == nil then return end
    if self:GetOwner():HasAuthority() == false then return end
    local NewAction = UE.NewObject(ActionClass,self:GetOwner(),self:GetOwner())
    if NewAction ~= nil then 
        NewAction:Initialize(self)
        self.Actions:Add(NewAction)
        if NewAction.AutoStart and NewAction:CanStart(Instigator) then
            NewAction:StartAction(Instigator)
        end
    end
end

--void(UClass*)
function ActionComponent_C:GetAction(ActionClass)
    for k,v in self.Actions do
    if v:IsA(ActionClass) then return v end
    end
    return nil
end

--void(AActor*, FName)
function ActionComponent_C:StopActionByName(Instigator, ActionName)
    for k,Action in pairs(self.Actions) do 	
		if  Action.ActionName == ActionName then
			if Action:IsRunning() then 			
				-- Is Client?
				if not self:GetOwner():HasAuthority() then 
					self:ServerStopAction(Instigator, ActionName);
                end
				Action:StopAction(Instigator);
				return true;
			end
		end
	end

	return false;
end

--void(AActor*, FName)
function ActionComponent_C:StartActionByName(Instigator, ActionName)
    for k, Action in pairs( self.Actions) do
        if Action.ActionName == ActionName then 
            if  Action:CanStart(Instigator) then 
                if self:GetOwner():HasAuthority() then 
                    self:ServerStartAction(Instigator, ActionName);
                end
                Action:StartAction(Instigator)
                return true
            end
        end
    end
	return false
end




function ActionComponent_C:ServerStartAction_RPC(Instigator, ActionName)
    self:StartActionByName(Instigator, ActionName);
end

function ActionComponent_C:ServerStopAction_RPC(Instigator, ActionName)
    self:StopActionByName(Instigator, ActionName);
end

--void(float)
--function ActionComponent_C:ReceiveTick(DeltaSeconds)
--end

--void(TEnumAsByte<EEndPlayReason::Type>)
function ActionComponent_C:ReceiveEndPlay(EndPlayReason)

	for k,v in pairs(self.Actions) do
		if  v:IsRunning() then
			v:StopAction(self:GetOwner());
        end
	end

end

--void()
function ActionComponent_C:ReceiveBeginPlay()

    local ActionProjectile = UE.UClass.Load("/Game/Blueprint/Actions/ActionProjectile.ActionProjectile_C")
    local ActionBlackHole = UE.UClass.Load("/Game/Blueprint/Actions/ActionBlackHole.ActionBlackHole_C")
    local ActionDash = UE.UClass.Load("/Game/Blueprint/Actions/ActionDash.ActionDash_C")
    self.DefaultActions:Add(ActionProjectile)
    self.DefaultActions:Add(ActionBlackHole)
    self.DefaultActions:Add(ActionDash)

    if self:GetOwner():HasAuthority() then 
		for k,v in pairs(self.DefaultActions) do
        self:AddAction(self:GetOwner(), v)
        end
    end
end



--void(int32)
--function ActionComponent_C:ExecuteUbergraph(EntryPoint)
--end

return ActionComponent_C