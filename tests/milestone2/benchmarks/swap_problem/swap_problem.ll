target triple="x86_64"


define i64 @main()
{
LU2:
  br label %LU3
LU3:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u0 = load i64, i64* @.read_scratch
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u1 = load i64, i64* @.read_scratch
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u2 = load i64, i64* @.read_scratch
  %u3 = icmp slt i64 0, %u2
  %u4 = zext i1 %u3 to i64
  %u5 = trunc i64 %u4 to i1
  br i1 %u5, label %LU5, label %LU4
LU5:
  %u6 = phi i64 [%u2, %LU3], [%u6, %LU5] 
  %u7 = phi i64 [%u0, %LU3], [%u8, %LU5] 
  %u8 = phi i64 [%u1, %LU3], [%u7, %LU5] 
  %u10 = phi i64 [0, %LU3], [%u11, %LU5] 
  %u11 = add i64 %u10, 1
  %u12 = icmp slt i64 %u11, %u6
  %u13 = zext i1 %u12 to i64
  %u14 = trunc i64 %u13 to i1
  br i1 %u14, label %LU5, label %LU4
LU4:
  %u16 = phi i64 [%u8, %LU5], [%u0, %LU3] 
  %u17 = phi i64 [%u7, %LU5], [%u1, %LU3] 
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u16)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u17)
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
