; ModuleID = 'external.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"%lld R\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"%lld W\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @check_load(i8* %instructionAdress, i64 %instructionValue) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  store i8* %instructionAdress, i8** %1, align 8
  store i64 %instructionValue, i64* %2, align 8
  %3 = load i8** %1, align 8
  %4 = ptrtoint i8* %3 to i64
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i64 %4)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @check_store(i8* %instructionAdress, i64 %instructionValue) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  store i8* %instructionAdress, i8** %1, align 8
  store i64 %instructionValue, i64* %2, align 8
  %3 = load i8** %1, align 8
  %4 = ptrtoint i8* %3 to i64
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i64 %4)
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
