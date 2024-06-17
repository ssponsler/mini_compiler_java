target triple="x86_64"


define i64 @computeFib(i64 %input)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp eq i64 %input, 0
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU6
LU5:
  ret i64 0
LU6:
  %u3 = icmp sle i64 %input, 2
  %u4 = zext i1 %u3 to i64
  %u5 = trunc i64 %u4 to i1
  br i1 %u5, label %LU8, label %LU9
LU8:
  ret i64 1
LU9:
  %u6 = sub i64 %input, 1
  %u7 = call i64 @computeFib(i64 %u6)
  %u8 = sub i64 %input, 2
  %u9 = call i64 @computeFib(i64 %u8)
  %u10 = add i64 %u7, %u9
  ret i64 %u10
}


define i64 @main()
{
LU11:
  br label %LU12
LU12:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u11 = load i64, i64* @.read_scratch
  %u12 = call i64 @computeFib(i64 %u11)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u12)
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
