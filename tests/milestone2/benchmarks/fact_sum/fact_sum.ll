target triple="x86_64"


define i64 @sum(i64 %a, i64 %b)
{
LU2:
  br label %LU3
LU3:
  %u0 = add i64 %a, %b
  ret i64 %u0
}


define i64 @fact(i64 %n)
{
LU11:
  br label %LU12
LU12:
  %u1 = icmp eq i64 %n, 1
  %u2 = zext i1 %u1 to i64
  %u3 = icmp eq i64 %n, 0
  %u4 = zext i1 %u3 to i64
  %u5 = or i64 %u2, %u4
  %u6 = trunc i64 %u5 to i1
  br i1 %u6, label %LU14, label %LU13
LU14:
  ret i64 1
LU13:
  br label %LU15
LU15:
  %u7 = icmp sle i64 %n, 1
  %u8 = zext i1 %u7 to i64
  %u9 = trunc i64 %u8 to i1
  br i1 %u9, label %LU17, label %LU16
LU17:
  %u10 = sub i64 0, 1
  %u11 = mul i64 %u10, %n
  %u12 = call i64 @fact(i64 %u11)
  ret i64 %u12
LU16:
  br label %LU18
LU18:
  %u13 = sub i64 %n, 1
  %u14 = call i64 @fact(i64 %u13)
  %u15 = mul i64 %n, %u14
  br label %LU19
LU19:
  ret i64 %u15
}


define i64 @main()
{
LU21:
  br label %LU22
LU22:
  %u16 = sub i64 0, 1
  %u17 = icmp ne i64 0, %u16
  %u18 = zext i1 %u17 to i64
  %u19 = trunc i64 %u18 to i1
  br i1 %u19, label %LU24, label %LU23
LU24:
  %u20 = phi i64 [0, %LU22], [%u25, %LU25] 
  %u21 = phi i64 [0, %LU22], [%u26, %LU25] 
  %u22 = phi i64 [0, %LU22], [%u28, %LU25] 
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u23 = load i64, i64* @.read_scratch
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u24 = load i64, i64* @.read_scratch
  %u25 = call i64 @fact(i64 %u23)
  %u26 = call i64 @fact(i64 %u24)
  %u27 = call i64 @sum(i64 %u25, i64 %u26)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u27)
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u28 = load i64, i64* @.read_scratch
  br label %LU25
LU25:
  %u29 = sub i64 0, 1
  %u30 = icmp ne i64 %u28, %u29
  %u31 = zext i1 %u30 to i64
  %u32 = trunc i64 %u31 to i1
  br i1 %u32, label %LU24, label %LU23
LU23:
  br label %LU26
LU26:
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
