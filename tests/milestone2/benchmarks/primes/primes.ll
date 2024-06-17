target triple="x86_64"


define i64 @isqrt(i64 %a)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp sle i64 1, %a
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU4
LU5:
  %u3 = phi i64 [%a, %LU3], [%u3, %LU6] 
  %u4 = phi i64 [1, %LU3], [%u6, %LU6] 
  %u5 = phi i64 [3, %LU3], [%u7, %LU6] 
  %u6 = add i64 %u4, %u5
  %u7 = add i64 %u5, 2
  br label %LU6
LU6:
  %u8 = icmp sle i64 %u6, %u3
  %u9 = zext i1 %u8 to i64
  %u10 = trunc i64 %u9 to i1
  br i1 %u10, label %LU5, label %LU4
LU4:
  %u13 = phi i64 [%u7, %LU6], [3, %LU3] 
  br label %LU7
LU7:
  %u14 = sdiv i64 %u13, 2
  %u15 = sub i64 %u14, 1
  ret i64 %u15
}


define i64 @prime(i64 %a)
{
LU11:
  br label %LU12
LU12:
  %u16 = icmp slt i64 %a, 2
  %u17 = zext i1 %u16 to i64
  %u18 = trunc i64 %u17 to i1
  br i1 %u18, label %LU14, label %LU15
LU14:
  %u19 = add i64 0, 0
  ret i64 %u19
LU15:
  %u20 = call i64 @isqrt(i64 %a)
  %u21 = icmp sle i64 2, %u20
  %u22 = zext i1 %u21 to i64
  %u23 = trunc i64 %u22 to i1
  br i1 %u23, label %LU17, label %LU16
LU17:
  %u24 = phi i64 [%a, %LU15], [%u24, %LU21] 
  %u25 = phi i64 [%u20, %LU15], [%u25, %LU21] 
  %u26 = phi i64 [2, %LU15], [%u35, %LU21] 
  %u27 = phi i64 [0, %LU15], [%u30, %LU21] 
  %u28 = sdiv i64 %u24, %u26
  %u29 = mul i64 %u28, %u26
  %u30 = sub i64 %u24, %u29
  %u31 = icmp eq i64 %u30, 0
  %u32 = zext i1 %u31 to i64
  %u33 = trunc i64 %u32 to i1
  br i1 %u33, label %LU19, label %LU18
LU19:
  %u34 = add i64 0, 0
  ret i64 %u34
LU18:
  br label %LU20
LU20:
  %u35 = add i64 %u26, 1
  br label %LU21
LU21:
  %u36 = icmp sle i64 %u35, %u25
  %u37 = zext i1 %u36 to i64
  %u38 = trunc i64 %u37 to i1
  br i1 %u38, label %LU17, label %LU16
LU16:
  br label %LU22
LU22:
  %u43 = add i64 0, 1
  ret i64 %u43
}


define i64 @main()
{
LU31:
  br label %LU32
LU32:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u44 = load i64, i64* @.read_scratch
  %u45 = icmp sle i64 0, %u44
  %u46 = zext i1 %u45 to i64
  %u47 = trunc i64 %u46 to i1
  br i1 %u47, label %LU34, label %LU33
LU34:
  %u48 = phi i64 [%u44, %LU32], [%u52, %LU38] 
  %u49 = phi i64 [0, %LU32], [%u54, %LU38] 
  %u50 = call i64 @prime(i64 %u49)
  %u51 = trunc i64 %u50 to i1
  br i1 %u51, label %LU36, label %LU35
LU36:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u49)
  br label %LU35
LU35:
  %u52 = phi i64 [%u48, %LU36], [%u48, %LU34] 
  %u53 = phi i64 [%u49, %LU36], [%u49, %LU34] 
  br label %LU37
LU37:
  %u54 = add i64 %u53, 1
  br label %LU38
LU38:
  %u55 = icmp sle i64 %u54, %u52
  %u56 = zext i1 %u55 to i64
  %u57 = trunc i64 %u56 to i1
  br i1 %u57, label %LU34, label %LU33
LU33:
  br label %LU39
LU39:
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
