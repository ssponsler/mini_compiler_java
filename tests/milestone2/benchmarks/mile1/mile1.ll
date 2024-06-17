target triple="x86_64"
%struct.Power = type {i64, i64}


define i64 @calcPower(i64 %base, i64 %exp)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp sgt i64 %exp, 0
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU4
LU5:
  %u3 = phi i64 [%base, %LU3], [%u3, %LU6] 
  %u4 = phi i64 [%exp, %LU3], [%u7, %LU6] 
  %u5 = phi i64 [1, %LU3], [%u6, %LU6] 
  %u6 = mul i64 %u5, %u3
  %u7 = sub i64 %u4, 1
  br label %LU6
LU6:
  %u8 = icmp sgt i64 %u7, 0
  %u9 = zext i1 %u8 to i64
  %u10 = trunc i64 %u9 to i1
  br i1 %u10, label %LU5, label %LU4
LU4:
  %u13 = phi i64 [%u6, %LU6], [1, %LU3] 
  br label %LU7
LU7:
  ret i64 %u13
}


define i64 @main()
{
LU11:
  br label %LU12
LU12:
  %u14 = call i8* @malloc(i64 16)
  %u15 = bitcast i8* %u14 to %struct.Power*
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u16 = load i64, i64* @.read_scratch
  %u17 = getelementptr %struct.Power, %struct.Power* %u15, i32 0, i32 0
  store i64 %u16, i64* %u17
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u18 = load i64, i64* @.read_scratch
  %u19 = icmp slt i64 %u18, 0
  %u20 = zext i1 %u19 to i64
  %u21 = trunc i64 %u20 to i1
  br i1 %u21, label %LU14, label %LU13
LU14:
  %u22 = sub i64 0, 1
  ret i64 %u22
LU13:
  br label %LU15
LU15:
  %u23 = getelementptr %struct.Power, %struct.Power* %u15, i32 0, i32 1
  store i64 %u18, i64* %u23
  %u24 = icmp slt i64 0, 1000000
  %u25 = zext i1 %u24 to i64
  %u26 = trunc i64 %u25 to i1
  br i1 %u26, label %LU17, label %LU16
LU17:
  %u27 = phi %struct.Power* [%u15, %LU15], [%u27, %LU18] 
  %u28 = phi i64 [%u18, %LU15], [%u28, %LU18] 
  %u29 = phi i64 [0, %LU15], [%u37, %LU18] 
  %u30 = phi i64 [0, %LU15], [%u30, %LU18] 
  %u31 = phi i64 [0, %LU15], [%u32, %LU18] 
  %u32 = add i64 %u31, 1
  %u33 = getelementptr %struct.Power, %struct.Power* %u27, i32 0, i32 0
  %u34 = load i64, i64* %u33
  %u35 = getelementptr %struct.Power, %struct.Power* %u27, i32 0, i32 1
  %u36 = load i64, i64* %u35
  %u37 = call i64 @calcPower(i64 %u34, i64 %u36)
  br label %LU18
LU18:
  %u38 = icmp slt i64 %u32, 1000000
  %u39 = zext i1 %u38 to i64
  %u40 = trunc i64 %u39 to i1
  br i1 %u40, label %LU17, label %LU16
LU16:
  %u43 = phi i64 [%u37, %LU18], [0, %LU15] 
  br label %LU19
LU19:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u43)
  br label %LU20
LU20:
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
