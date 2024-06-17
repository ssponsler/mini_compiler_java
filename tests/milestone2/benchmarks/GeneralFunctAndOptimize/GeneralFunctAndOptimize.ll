target triple="x86_64"
%struct.IntHolder = type {i64}

@interval = common global i64 0, align 8
@end = common global i64 0, align 8

define i64 @multBy4xTimes(%struct.IntHolder* %num, i64 %timesLeft)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp sle i64 %timesLeft, 0
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU4
LU5:
  %u3 = getelementptr %struct.IntHolder, %struct.IntHolder* %num, i32 0, i32 0
  %u4 = load i64, i64* %u3
  ret i64 %u4
LU4:
  %u5 = getelementptr %struct.IntHolder, %struct.IntHolder* %num, i32 0, i32 0
  %u6 = load i64, i64* %u5
  %u7 = mul i64 4, %u6
  %u8 = getelementptr %struct.IntHolder, %struct.IntHolder* %num, i32 0, i32 0
  store i64 %u7, i64* %u8
  %u9 = sub i64 %timesLeft, 1
  call i64 @multBy4xTimes(%struct.IntHolder* %num, i64 %u9)
  %u10 = getelementptr %struct.IntHolder, %struct.IntHolder* %num, i32 0, i32 0
  %u11 = load i64, i64* %u10
  ret i64 %u11
}


define void @divideBy8(%struct.IntHolder* %num)
{
LU11:
  br label %LU12
LU12:
  %u12 = getelementptr %struct.IntHolder, %struct.IntHolder* %num, i32 0, i32 0
  %u13 = load i64, i64* %u12
  %u14 = sdiv i64 %u13, 2
  %u15 = getelementptr %struct.IntHolder, %struct.IntHolder* %num, i32 0, i32 0
  store i64 %u14, i64* %u15
  %u16 = getelementptr %struct.IntHolder, %struct.IntHolder* %num, i32 0, i32 0
  %u17 = load i64, i64* %u16
  %u18 = sdiv i64 %u17, 2
  %u19 = getelementptr %struct.IntHolder, %struct.IntHolder* %num, i32 0, i32 0
  store i64 %u18, i64* %u19
  %u20 = getelementptr %struct.IntHolder, %struct.IntHolder* %num, i32 0, i32 0
  %u21 = load i64, i64* %u20
  %u22 = sdiv i64 %u21, 2
  %u23 = getelementptr %struct.IntHolder, %struct.IntHolder* %num, i32 0, i32 0
  store i64 %u22, i64* %u23
  ret void
}


define i64 @main()
{
LU21:
  br label %LU22
LU22:
  %u24 = call i8* @malloc(i64 8)
  %u25 = bitcast i8* %u24 to %struct.IntHolder*
  store i64 1000000, i64* @end
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u26 = load i64, i64* @.read_scratch
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u27 = load i64, i64* @.read_scratch
  store i64 %u27, i64* @interval
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u26)
  %u28 = load i64, i64* @interval
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u28)
  %u29 = icmp slt i64 0, 50
  %u30 = zext i1 %u29 to i64
  %u31 = trunc i64 %u30 to i1
  br i1 %u31, label %LU24, label %LU23
LU24:
  %u32 = phi i64 [%u26, %LU22], [%u89, %LU25] 
  %u33 = phi i64 [0, %LU22], [%u98, %LU25] 
  %u35 = phi i64 [0, %LU22], [%u92, %LU25] 
  %u36 = phi i64 [0, %LU22], [%u93, %LU25] 
  %u37 = phi i64 [0, %LU22], [%u94, %LU25] 
  %u38 = phi %struct.IntHolder* [%u25, %LU22], [%u95, %LU25] 
  %u39 = phi i64 [0, %LU22], [%u96, %LU25] 
  %u40 = phi i64 [0, %LU22], [%u97, %LU25] 
  %u41 = load i64, i64* @end
  %u42 = icmp sle i64 0, %u41
  %u43 = zext i1 %u42 to i64
  %u44 = trunc i64 %u43 to i1
  br i1 %u44, label %LU26, label %LU25
LU26:
  %u45 = phi i64 [%u32, %LU24], [%u75, %LU27] 
  %u46 = phi i64 [%u33, %LU24], [%u76, %LU27] 
  %u47 = phi i64 [0, %LU24], [%u84, %LU27] 
  %u51 = phi %struct.IntHolder* [%u38, %LU24], [%u81, %LU27] 
  %u53 = phi i64 [%u40, %LU24], [%u83, %LU27] 
  %u54 = mul i64 1, 2
  %u55 = mul i64 %u54, 3
  %u56 = mul i64 %u55, 4
  %u57 = mul i64 %u56, 5
  %u58 = mul i64 %u57, 6
  %u59 = mul i64 %u58, 7
  %u60 = mul i64 %u59, 8
  %u61 = mul i64 %u60, 9
  %u62 = mul i64 %u61, 10
  %u63 = mul i64 %u62, 11
  %u64 = add i64 %u47, 1
  %u65 = getelementptr %struct.IntHolder, %struct.IntHolder* %u51, i32 0, i32 0
  store i64 %u64, i64* %u65
  %u66 = getelementptr %struct.IntHolder, %struct.IntHolder* %u51, i32 0, i32 0
  %u67 = load i64, i64* %u66
  call i64 @multBy4xTimes(%struct.IntHolder* %u51, i64 2)
  call void @divideBy8(%struct.IntHolder* %u51)
  %u68 = load i64, i64* @interval
  %u69 = sub i64 %u68, 1
  %u70 = icmp sle i64 %u69, 0
  %u71 = zext i1 %u70 to i64
  %u72 = icmp sle i64 %u69, 0
  %u73 = zext i1 %u72 to i64
  %u74 = trunc i64 %u73 to i1
  br i1 %u74, label %LU28, label %LU27
LU28:
  br label %LU27
LU27:
  %u75 = phi i64 [%u45, %LU28], [%u45, %LU26] 
  %u76 = phi i64 [%u46, %LU28], [%u46, %LU26] 
  %u77 = phi i64 [%u64, %LU28], [%u64, %LU26] 
  %u78 = phi i64 [%u63, %LU28], [%u63, %LU26] 
  %u79 = phi i64 [%u67, %LU28], [%u67, %LU26] 
  %u80 = phi i64 [1, %LU28], [%u69, %LU26] 
  %u81 = phi %struct.IntHolder* [%u51, %LU28], [%u51, %LU26] 
  %u82 = phi i64 [%u71, %LU28], [%u71, %LU26] 
  %u83 = phi i64 [%u53, %LU28], [%u53, %LU26] 
  %u84 = add i64 %u77, %u80
  %u85 = load i64, i64* @end
  %u86 = icmp sle i64 %u84, %u85
  %u87 = zext i1 %u86 to i64
  %u88 = trunc i64 %u87 to i1
  br i1 %u88, label %LU26, label %LU25
LU25:
  %u89 = phi i64 [%u75, %LU27], [%u32, %LU24] 
  %u90 = phi i64 [%u76, %LU27], [%u33, %LU24] 
  %u91 = phi i64 [%u84, %LU27], [0, %LU24] 
  %u92 = phi i64 [%u78, %LU27], [%u35, %LU24] 
  %u93 = phi i64 [%u79, %LU27], [%u36, %LU24] 
  %u94 = phi i64 [%u80, %LU27], [%u37, %LU24] 
  %u95 = phi %struct.IntHolder* [%u81, %LU27], [%u38, %LU24] 
  %u96 = phi i64 [%u82, %LU27], [%u39, %LU24] 
  %u97 = phi i64 [%u83, %LU27], [%u40, %LU24] 
  %u98 = add i64 %u90, 1
  %u99 = icmp slt i64 %u98, 50
  %u100 = zext i1 %u99 to i64
  %u101 = trunc i64 %u100 to i1
  br i1 %u101, label %LU24, label %LU23
LU23:
  %u104 = phi i64 [%u91, %LU25], [0, %LU22] 
  %u105 = phi i64 [%u92, %LU25], [0, %LU22] 
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u104)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u105)
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
