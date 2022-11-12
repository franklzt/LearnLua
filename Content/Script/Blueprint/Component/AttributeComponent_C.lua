
--Author:Administrator
--Date:2022.10.20-17.21.06


local AttributeComponent_C = UnLua.Class()

--FString()
--function AttributeComponent_C:GetModuleName()
--end

--void(float)
--function AttributeComponent_C:ReceiveTick(DeltaSeconds)
--end

--void(TEnumAsByte<EEndPlayReason::Type>)
--function AttributeComponent_C:ReceiveEndPlay(EndPlayReason)
--end

--void()
function AttributeComponent_C:ReceiveBeginPlay()
    print("ReceiveBeginPlay BP_HealthCom_C")
    local TempObjectClass = UE.UClass.Load("/Game/Blueprint/Actions/ProjectileAction.ProjectileAction_C")
    --self.ActionClasses = UE.TArray(UE.UClass)
    --self.ActionClasses.Add(TempObjectClass:GetClass())
    self.MaxEnemy = 5   

    print(self.MaxEnemy)
end

--void(int32)
--function AttributeComponent_C:ExecuteUbergraph(EntryPoint)
--end

return AttributeComponent_C