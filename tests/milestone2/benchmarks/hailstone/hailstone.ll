target triple="x86_64"


define i64 @mod(i64 %a, i64 %b)
{
LU2:
  br label %LU3
LU3:
  %u0 = sdiv i64 %a, %b
  %u1 = mul i64 %u0, %b
  %u2 = sub i64 %a, %u1
  ret i64 %u2
}


define void @hailstone(i64 %n)
{
LU11:
  br label %LU12
LU12:
  %u3 = add i64 0, 1
  %u4 = trunc i64 %u3 to i1
  br i1 %u4, label %LU14, label %LU13
LU14:
  %u5 = phi i64 [%n, %LU12], [%u12, %LU22] 
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u5)
  %u6 = call i64 @mod(i64 %u5, i64 2)
  %u7 = icmp eq i64 %u6, 1
  %u8 = zext i1 %u7 to i64
  %u9 = trunc i64 %u8 to i1
  br i1 %u9, label %LU16, label %LU17
LU16:
  %u10 = mul i64 3, %u5
  %u11 = add i64 %u10, 1
  br label %LU15
LU15:
  %u12 = phi i64 [%u11, %LU16], [%u19, %LU17] 
  br label %LU18
LU18:
  %u13 = icmp sle i64 %u12, 1
  %u14 = zext i1 %u13 to i64
  %u15 = trunc i64 %u14 to i1
  br i1 %u15, label %LU20, label %LU19
LU20:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u12)
  br label %LU21
LU21:
  ret void
LU19:
  br label %LU22
LU22:
  %u16 = add i64 0, 1
  %u17 = trunc i64 %u16 to i1
  br i1 %u17, label %LU14, label %LU13
LU13:
  br label %LU23
LU23:
  ret void
LU17:
  %u19 = sdiv i64 %u5, 2
  br label %LU15
}


define i64 @main()
{
LU31:
  br label %LU32
LU32:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u20 = load i64, i64* @.read_scratch
  call void @hailstone(i64 %u20)
  br label %LU33
LU33:
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
