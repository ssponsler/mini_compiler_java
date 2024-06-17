target triple="x86_64"


define i64 @main()
{
LU2:
  br label %LU3
LU3:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u0 = load i64, i64* @.read_scratch
  %u1 = icmp slt i64 1, %u0
  %u2 = zext i1 %u1 to i64
  %u3 = trunc i64 %u2 to i1
  br i1 %u3, label %LU5, label %LU4
LU5:
  %u4 = phi i64 [%u0, %LU3], [%u4, %LU5] 
  %u6 = phi i64 [1, %LU3], [%u7, %LU5] 
  %u7 = add i64 %u6, 1
  %u8 = icmp slt i64 %u7, %u4
  %u9 = zext i1 %u8 to i64
  %u10 = trunc i64 %u9 to i1
  br i1 %u10, label %LU5, label %LU4
LU4:
  %u12 = phi i64 [%u6, %LU5], [0, %LU3] 
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
