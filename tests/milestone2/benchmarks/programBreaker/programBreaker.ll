target triple="x86_64"

@GLOBAL = common global i64 0, align 8
@count = common global i64 0, align 8

define i64 @fun2(i64 %x, i64 %y)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp eq i64 %x, 0
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU6
LU5:
  ret i64 %y
LU6:
  %u3 = sub i64 %x, 1
  %u4 = call i64 @fun2(i64 %u3, i64 %y)
  ret i64 %u4
}


define i64 @fun1(i64 %x, i64 %y, i64 %z)
{
LU11:
  br label %LU12
LU12:
  %u5 = add i64 5, 6
  %u6 = mul i64 %x, 2
  %u7 = sub i64 %u5, %u6
  %u8 = sdiv i64 4, %y
  %u9 = add i64 %u7, %u8
  %u10 = add i64 %u9, %z
  %u11 = icmp sgt i64 %u10, %y
  %u12 = zext i1 %u11 to i64
  %u13 = trunc i64 %u12 to i1
  br i1 %u13, label %LU14, label %LU15
LU14:
  %u14 = call i64 @fun2(i64 %u10, i64 %x)
  ret i64 %u14
LU15:
  %u15 = icmp slt i64 5, 6
  %u16 = zext i1 %u15 to i64
  %u17 = icmp sle i64 %u10, %y
  %u18 = zext i1 %u17 to i64
  %u19 = and i64 %u16, %u18
  %u20 = trunc i64 %u19 to i1
  br i1 %u20, label %LU17, label %LU16
LU17:
  %u21 = call i64 @fun2(i64 %u10, i64 %y)
  ret i64 %u21
LU16:
  ret i64 %u10
}


define i64 @main()
{
LU21:
  br label %LU22
LU22:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u22 = load i64, i64* @.read_scratch
  %u23 = icmp slt i64 %u22, 10000
  %u24 = zext i1 %u23 to i64
  %u25 = trunc i64 %u24 to i1
  br i1 %u25, label %LU24, label %LU23
LU24:
  %u26 = phi i64 [%u22, %LU22], [%u28, %LU24] 
  %u27 = call i64 @fun1(i64 3, i64 %u26, i64 5)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u27)
  %u28 = add i64 %u26, 1
  %u29 = icmp slt i64 %u28, 10000
  %u30 = zext i1 %u29 to i64
  %u31 = trunc i64 %u30 to i1
  br i1 %u31, label %LU24, label %LU23
LU23:
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
