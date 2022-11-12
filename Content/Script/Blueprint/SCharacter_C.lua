
--Author:Administrator
--Date:2022.10.20-17.36.56


local SCharacter_C = UnLua.Class()

--void(bool)
--function SCharacter_C:BI_Jumping(CallFunc_IsFalling_ReturnValue)
--end

--void()
--function SCharacter_C:BI_CharacterMovement()
--end

--FString()
--function SCharacter_C:GetModuleName()
--end

--void()
--function SCharacter_C:GetCamera()
--end

--void()
--function SCharacter_C:OnLanded()
--end

--void(float)
--function SCharacter_C:OnWalkingOffLedge(TimeDelta)
--end

--void(FVector, bool, bool)
--function SCharacter_C:OnLaunched(LaunchVelocity, bXYOverride, bZOverride)
--end

--void()
--function SCharacter_C:OnLanded()
--end

--void()
--function SCharacter_C:OnJumped()
--end

--void(float)
--function SCharacter_C:K2_UpdateCustomMovement(DeltaTime)
--end

--void(float, float)
--function SCharacter_C:K2_OnStartCrouch(HalfHeightAdjust, ScaledHalfHeightAdjust)
--end

--void(TEnumAsByte<EMovementMode>, TEnumAsByte<EMovementMode>, uint8, uint8)
--function SCharacter_C:K2_OnMovementModeChanged(PrevMovementMode, NewMovementMode, PrevCustomMode, NewCustomMode)
--end

--void(float, float)
--function SCharacter_C:K2_OnEndCrouch(HalfHeightAdjust, ScaledHalfHeightAdjust)
--end

--bool()
--function SCharacter_C:CanJumpInternal()
--end

--void(AController*)
--function SCharacter_C:ReceiveUnpossessed(OldController)
--end

--void()
--function SCharacter_C:ReceiveRestarted()
--end

--void(AController*)
--function SCharacter_C:ReceivePossessed(NewController)
--end

--void(AController*, AController*)
--function SCharacter_C:ReceiveControllerChanged(OldController, NewController)
--end

--void()
function SCharacter_C:UserConstructionScript()
    self.bUseControllerRotationYaw = false
    self.CharacterMovement.bOrientRotationToMovement = true;
    self.SpringArm.bUsePawnControlRotation = true
    self.AttributeComp.CurrentHealth = 100
end

--void(float)
--function SCharacter_C:ReceiveTick(DeltaSeconds)
--end

--void(float, UDamageType*, FVector, AController*, AActor*)
--function SCharacter_C:ReceiveRadialDamage(DamageReceived, DamageType, Origin, InstigatedBy, DamageCauser)
--end

--void(float, UDamageType*, FVector, FVector, UPrimitiveComponent*, FName, FVector, AController*, AActor*)
--function SCharacter_C:ReceivePointDamage(Damage, DamageType, HitLocation, HitNormal, HitComponent, BoneName, ShotFromDirection, InstigatedBy, DamageCauser)
--end

--void(UPrimitiveComponent*, AActor*, UPrimitiveComponent*, bool, FVector, FVector, FVector)
--function SCharacter_C:ReceiveHit(MyComp, Other, OtherComp, bSelfMoved, HitLocation, HitNormal, NormalImpulse)
--end

--void(TEnumAsByte<EEndPlayReason::Type>)
--function SCharacter_C:ReceiveEndPlay(EndPlayReason)
--end

--void()
--function SCharacter_C:ReceiveDestroyed()
--end

--void()
--function SCharacter_C:ReceiveBeginPlay()
--end

--void(float, UDamageType*, AController*, AActor*)
--function SCharacter_C:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
--end

--void(FKey)
--function SCharacter_C:ReceiveActorOnReleased(ButtonReleased)
--end

--void(TEnumAsByte<ETouchIndex::Type>)
--function SCharacter_C:ReceiveActorOnInputTouchLeave(FingerIndex)
--end

--void(TEnumAsByte<ETouchIndex::Type>)
--function SCharacter_C:ReceiveActorOnInputTouchEnter(FingerIndex)
--end

--void(TEnumAsByte<ETouchIndex::Type>)
--function SCharacter_C:ReceiveActorOnInputTouchEnd(FingerIndex)
--end

--void(TEnumAsByte<ETouchIndex::Type>)
--function SCharacter_C:ReceiveActorOnInputTouchBegin(FingerIndex)
--end

--void(FKey)
--function SCharacter_C:ReceiveActorOnClicked(ButtonPressed)
--end

--void(AActor*)
--function SCharacter_C:ReceiveActorEndOverlap(OtherActor)
--end

--void()
--function SCharacter_C:ReceiveActorEndCursorOver()
--end

--void(AActor*)
--function SCharacter_C:ReceiveActorBeginOverlap(OtherActor)
--end

--void()
--function SCharacter_C:ReceiveActorBeginCursorOver()
--end

--void()
--function SCharacter_C:K2_OnReset()
--end

--void(APlayerController*)
--function SCharacter_C:K2_OnEndViewTarget(PC)
--end

--void(APlayerController*)
--function SCharacter_C:K2_OnBecomeViewTarget(PC)
--end

--void(int32)
--function SCharacter_C:ExecuteUbergraph(EntryPoint)
--end

function SCharacter_C:PrimaryAttack_Pressed()
    self.ActionComp:StartActionByName(self, "PrimaryAttack");
 end

 function SCharacter_C:PrimaryInteract_Pressed()
    self.InteractionComp:PrimaryInteract();
 end

 function SCharacter_C:SecondaryAttack_Pressed()
    self.ActionComp:StartActionByName(self, "Blackhole");
 end

 function SCharacter_C:Dash_Pressed()
    self.ActionComp:StartActionByName(self, "Dash");
 end

 function SCharacter_C: Sprint_Pressed()
    self.ActionComp:StartActionByName(self, "Sprint");
 end

 function SCharacter_C: Sprint_Released()
    self.ActionComp:StopActionByName(self, "Sprint");
 end

function SCharacter_C:Jump_Pressed()
    self:Jump()
 end
 
 function SCharacter_C:Turn(AxisValue)
     self:AddControllerYawInput(AxisValue)
 end
 
 function SCharacter_C:LookUp(AxisValue)
     self:AddControllerPitchInput(AxisValue)
 end
 
 function SCharacter_C:MoveForward(AxisValue)
     local Rotation = self:GetControlRotation()
     Rotation:Set(0, Rotation.Yaw, 0)
     local Direction = Rotation:ToVector() -- Rotation:GetForwardVector()
     self:AddMovementInput(Direction, AxisValue)
 end
 
 function SCharacter_C:MoveRight(AxisValue)
     local Rotation = self:GetControlRotation()
     Rotation:Set(0, Rotation.Yaw, 0)
     local Direction = Rotation:GetRightVector()
     self:AddMovementInput(Direction, AxisValue)
 end

return SCharacter_C