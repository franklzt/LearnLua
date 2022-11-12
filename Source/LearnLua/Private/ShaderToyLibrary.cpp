// Fill out your copyright notice in the Description page of Project Settings.


#include "ShaderToyLibrary.h"

float UShaderToyLibrary::GetGlobalFPS()
{
	extern ENGINE_API float GAverageFPS;;
	return GAverageFPS;
}
