target triple="x86_64"


define i64 @function(i64 %n)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp sle i64 %n, 0
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU4
LU5:
  ret i64 0
LU4:
  br label %LU6
LU6:
  %u3 = mul i64 %n, %n
  %u4 = icmp slt i64 0, %u3
  %u5 = zext i1 %u4 to i64
  %u6 = trunc i64 %u5 to i1
  br i1 %u6, label %LU8, label %LU7
LU8:
  %u7 = phi i64 [%n, %LU6], [%u7, %LU9] 
  %u8 = phi i64 [0, %LU6], [%u11, %LU9] 
  %u9 = phi i64 [0, %LU6], [%u10, %LU9] 
  %u10 = add i64 %u8, %u7
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u10)
  %u11 = add i64 %u8, 1
  br label %LU9
LU9:
  %u12 = mul i64 %u7, %u7
  %u13 = icmp slt i64 %u11, %u12
  %u14 = zext i1 %u13 to i64
  %u15 = trunc i64 %u14 to i1
  br i1 %u15, label %LU8, label %LU7
LU7:
  %u16 = phi i64 [%u7, %LU9], [%n, %LU6] 
  br label %LU10
LU10:
  %u19 = sub i64 %u16, 1
  %u20 = call i64 @function(i64 %u19)
  ret i64 %u20
}


define i64 @main()
{
LU21:
  br label %LU22
LU22:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u21 = load i64, i64* @.read_scratch
  call i64 @function(i64 %u21)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU23
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
