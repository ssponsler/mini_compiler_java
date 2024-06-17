target triple="x86_64"


define i64 @wait(i64 %waitTime)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp sgt i64 %waitTime, 0
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU4
LU5:
  %u3 = phi i64 [%waitTime, %LU3], [%u4, %LU5] 
  %u4 = sub i64 %u3, 1
  %u5 = icmp sgt i64 %u4, 0
  %u6 = zext i1 %u5 to i64
  %u7 = trunc i64 %u6 to i1
  br i1 %u7, label %LU5, label %LU4
LU4:
  ret i64 0
}


define i64 @power(i64 %base, i64 %exponent)
{
LU11:
  br label %LU12
LU12:
  %u9 = icmp sgt i64 %exponent, 0
  %u10 = zext i1 %u9 to i64
  %u11 = trunc i64 %u10 to i1
  br i1 %u11, label %LU14, label %LU13
LU14:
  %u12 = phi i64 [%base, %LU12], [%u12, %LU14] 
  %u13 = phi i64 [%exponent, %LU12], [%u16, %LU14] 
  %u14 = phi i64 [1, %LU12], [%u15, %LU14] 
  %u15 = mul i64 %u14, %u12
  %u16 = sub i64 %u13, 1
  %u17 = icmp sgt i64 %u16, 0
  %u18 = zext i1 %u17 to i64
  %u19 = trunc i64 %u18 to i1
  br i1 %u19, label %LU14, label %LU13
LU13:
  %u22 = phi i64 [%u15, %LU14], [1, %LU12] 
  ret i64 %u22
}


define i64 @recursiveDecimalSum(i64 %binaryNum, i64 %decimalSum, i64 %recursiveDepth)
{
LU21:
  br label %LU22
LU22:
  %u23 = icmp sgt i64 %binaryNum, 0
  %u24 = zext i1 %u23 to i64
  %u25 = trunc i64 %u24 to i1
  br i1 %u25, label %LU24, label %LU23
LU24:
  %u26 = sdiv i64 %binaryNum, 10
  %u27 = mul i64 %u26, 10
  %u28 = sub i64 %binaryNum, %u27
  %u29 = icmp eq i64 %u28, 1
  %u30 = zext i1 %u29 to i64
  %u31 = trunc i64 %u30 to i1
  br i1 %u31, label %LU26, label %LU25
LU26:
  %u32 = call i64 @power(i64 2, i64 %recursiveDepth)
  %u33 = add i64 %decimalSum, %u32
  br label %LU25
LU25:
  %u34 = phi i64 [%binaryNum, %LU26], [%binaryNum, %LU24] 
  %u35 = phi i64 [%u33, %LU26], [%decimalSum, %LU24] 
  %u36 = phi i64 [%recursiveDepth, %LU26], [%recursiveDepth, %LU24] 
  %u40 = sdiv i64 %u34, 10
  %u41 = add i64 %u36, 1
  %u42 = call i64 @recursiveDecimalSum(i64 %u40, i64 %u35, i64 %u41)
  ret i64 %u42
LU23:
  ret i64 %decimalSum
}


define i64 @convertToDecimal(i64 %binaryNum)
{
LU31:
  br label %LU32
LU32:
  %u43 = call i64 @recursiveDecimalSum(i64 %binaryNum, i64 0, i64 0)
  ret i64 %u43
}


define i64 @main()
{
LU41:
  br label %LU42
LU42:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u44 = load i64, i64* @.read_scratch
  %u45 = call i64 @convertToDecimal(i64 %u44)
  %u46 = mul i64 %u45, %u45
  %u47 = icmp sgt i64 %u46, 0
  %u48 = zext i1 %u47 to i64
  %u49 = trunc i64 %u48 to i1
  br i1 %u49, label %LU44, label %LU43
LU44:
  %u50 = phi i64 [%u45, %LU42], [%u50, %LU44] 
  %u51 = phi i64 [%u46, %LU42], [%u52, %LU44] 
  call i64 @wait(i64 %u51)
  %u52 = sub i64 %u51, 1
  %u53 = icmp sgt i64 %u52, 0
  %u54 = zext i1 %u53 to i64
  %u55 = trunc i64 %u54 to i1
  br i1 %u55, label %LU44, label %LU43
LU43:
  %u56 = phi i64 [%u50, %LU44], [%u45, %LU42] 
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u56)
  ret i64 0
}


declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8
