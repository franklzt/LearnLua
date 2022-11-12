// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Kismet/BlueprintFunctionLibrary.h"
#include "ShaderToyLibrary.generated.h"

/**
 * 
 */
UCLASS()
class LEARNLUA_API UShaderToyLibrary : public UBlueprintFunctionLibrary
{
	GENERATED_BODY()

public:

	UFUNCTION(BlueprintPure,BlueprintCallable)
	static  float GetGlobalFPS();
};