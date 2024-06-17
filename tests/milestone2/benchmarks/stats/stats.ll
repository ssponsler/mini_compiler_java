target triple="x86_64"
%struct.linkedNums = type {i64, %struct.linkedNums*}


define %struct.linkedNums* @getRands(i64 %seed, i64 %num)
{
LU2:
  br label %LU3
LU3:
  %u0 = mul i64 %seed, %seed
  %u1 = call i8* @malloc(i64 16)
  %u2 = bitcast i8* %u1 to %struct.linkedNums*
  %u3 = getelementptr %struct.linkedNums, %struct.linkedNums* %u2, i32 0, i32 0
  store i64 %u0, i64* %u3
  %u4 = getelementptr %struct.linkedNums, %struct.linkedNums* %u2, i32 0, i32 1
  store %struct.linkedNums* null, %struct.linkedNums** %u4
  %u5 = sub i64 %num, 1
  %u6 = icmp sgt i64 %u5, 0
  %u7 = zext i1 %u6 to i64
  %u8 = trunc i64 %u7 to i1
  br i1 %u8, label %LU5, label %LU4
LU5:
  %u9 = phi i64 [%seed, %LU3], [%u9, %LU5] 
  %u10 = phi i64 [%u5, %LU3], [%u27, %LU5] 
  %u12 = phi i64 [%u0, %LU3], [%u22, %LU5] 
  %u14 = phi %struct.linkedNums* [%u2, %LU3], [%u24, %LU5] 
  %u15 = mul i64 %u12, %u12
  %u16 = sdiv i64 %u15, %u9
  %u17 = sdiv i64 %u9, 2
  %u18 = mul i64 %u16, %u17
  %u19 = add i64 %u18, 1
  %u20 = sdiv i64 %u19, 1000000000
  %u21 = mul i64 %u20, 1000000000
  %u22 = sub i64 %u19, %u21
  %u23 = call i8* @malloc(i64 16)
  %u24 = bitcast i8* %u23 to %struct.linkedNums*
  %u25 = getelementptr %struct.linkedNums, %struct.linkedNums* %u24, i32 0, i32 0
  store i64 %u22, i64* %u25
  %u26 = getelementptr %struct.linkedNums, %struct.linkedNums* %u24, i32 0, i32 1
  store %struct.linkedNums* %u14, %struct.linkedNums** %u26
  %u27 = sub i64 %u10, 1
  %u28 = icmp sgt i64 %u27, 0
  %u29 = zext i1 %u28 to i64
  %u30 = trunc i64 %u29 to i1
  br i1 %u30, label %LU5, label %LU4
LU4:
  %u35 = phi %struct.linkedNums* [%u24, %LU5], [null, %LU3] 
  ret %struct.linkedNums* %u35
}


define i64 @calcMean(%struct.linkedNums* %nums)
{
LU11:
  br label %LU12
LU12:
  %u37 = icmp ne %struct.linkedNums* %nums, null
  %u38 = zext i1 %u37 to i64
  %u39 = trunc i64 %u38 to i1
  br i1 %u39, label %LU14, label %LU13
LU14:
  %u40 = phi %struct.linkedNums* [%nums, %LU12], [%u49, %LU14] 
  %u41 = phi i64 [0, %LU12], [%u47, %LU14] 
  %u42 = phi i64 [0, %LU12], [%u44, %LU14] 
  %u43 = phi i64 [0, %LU12], [%u43, %LU14] 
  %u44 = add i64 %u42, 1
  %u45 = getelementptr %struct.linkedNums, %struct.linkedNums* %u40, i32 0, i32 0
  %u46 = load i64, i64* %u45
  %u47 = add i64 %u41, %u46
  %u48 = getelementptr %struct.linkedNums, %struct.linkedNums* %u40, i32 0, i32 1
  %u49 = load %struct.linkedNums*, %struct.linkedNums** %u48
  %u50 = icmp ne %struct.linkedNums* %u49, null
  %u51 = zext i1 %u50 to i64
  %u52 = trunc i64 %u51 to i1
  br i1 %u52, label %LU14, label %LU13
LU13:
  %u54 = phi i64 [%u47, %LU14], [0, %LU12] 
  %u55 = phi i64 [%u44, %LU14], [0, %LU12] 
  %u56 = phi i64 [%u43, %LU14], [0, %LU12] 
  %u57 = icmp ne i64 %u55, 0
  %u58 = zext i1 %u57 to i64
  %u59 = trunc i64 %u58 to i1
  br i1 %u59, label %LU18, label %LU17
LU18:
  %u60 = sdiv i64 %u54, %u55
  br label %LU17
LU17:
  %u64 = phi i64 [%u60, %LU18], [%u56, %LU13] 
  ret i64 %u64
}


define i64 @approxSqrt(i64 %num)
{
LU21:
  br label %LU22
LU22:
  %u65 = icmp slt i64 0, %num
  %u66 = zext i1 %u65 to i64
  %u67 = trunc i64 %u66 to i1
  br i1 %u67, label %LU24, label %LU23
LU24:
  %u68 = phi i64 [%num, %LU22], [%u68, %LU24] 
  %u69 = phi i64 [1, %LU22], [%u73, %LU24] 
  %u72 = mul i64 %u69, %u69
  %u73 = add i64 %u69, 1
  %u74 = icmp slt i64 %u72, %u68
  %u75 = zext i1 %u74 to i64
  %u76 = trunc i64 %u75 to i1
  br i1 %u76, label %LU24, label %LU23
LU23:
  %u80 = phi i64 [%u69, %LU24], [1, %LU22] 
  ret i64 %u80
}


define void @approxSqrtAll(%struct.linkedNums* %nums)
{
LU31:
  br label %LU32
LU32:
  %u81 = icmp ne %struct.linkedNums* %nums, null
  %u82 = zext i1 %u81 to i64
  %u83 = trunc i64 %u82 to i1
  br i1 %u83, label %LU34, label %LU33
LU34:
  %u84 = phi %struct.linkedNums* [%nums, %LU32], [%u89, %LU34] 
  %u85 = getelementptr %struct.linkedNums, %struct.linkedNums* %u84, i32 0, i32 0
  %u86 = load i64, i64* %u85
  %u87 = call i64 @approxSqrt(i64 %u86)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u87)
  %u88 = getelementptr %struct.linkedNums, %struct.linkedNums* %u84, i32 0, i32 1
  %u89 = load %struct.linkedNums*, %struct.linkedNums** %u88
  %u90 = icmp ne %struct.linkedNums* %u89, null
  %u91 = zext i1 %u90 to i64
  %u92 = trunc i64 %u91 to i1
  br i1 %u92, label %LU34, label %LU33
LU33:
  ret void
}


define void @range(%struct.linkedNums* %nums)
{
LU41:
  br label %LU42
LU42:
  %u94 = add i64 0, 1
  %u95 = icmp ne %struct.linkedNums* %nums, null
  %u96 = zext i1 %u95 to i64
  %u97 = trunc i64 %u96 to i1
  br i1 %u97, label %LU44, label %LU43
LU44:
  %u98 = phi %struct.linkedNums* [%nums, %LU42], [%u113, %LU45] 
  %u99 = phi i64 [0, %LU42], [%u109, %LU45] 
  %u100 = phi i64 [0, %LU42], [%u110, %LU45] 
  %u101 = phi i64 [%u94, %LU42], [%u111, %LU45] 
  %u102 = trunc i64 %u101 to i1
  br i1 %u102, label %LU46, label %LU47
LU46:
  %u103 = getelementptr %struct.linkedNums, %struct.linkedNums* %u98, i32 0, i32 0
  %u104 = load i64, i64* %u103
  %u105 = getelementptr %struct.linkedNums, %struct.linkedNums* %u98, i32 0, i32 0
  %u106 = load i64, i64* %u105
  %u107 = add i64 0, 0
  br label %LU45
LU45:
  %u108 = phi %struct.linkedNums* [%u98, %LU46], [%u128, %LU48] 
  %u109 = phi i64 [%u104, %LU46], [%u129, %LU48] 
  %u110 = phi i64 [%u106, %LU46], [%u130, %LU48] 
  %u111 = phi i64 [%u107, %LU46], [%u131, %LU48] 
  %u112 = getelementptr %struct.linkedNums, %struct.linkedNums* %u108, i32 0, i32 1
  %u113 = load %struct.linkedNums*, %struct.linkedNums** %u112
  %u114 = icmp ne %struct.linkedNums* %u113, null
  %u115 = zext i1 %u114 to i64
  %u116 = trunc i64 %u115 to i1
  br i1 %u116, label %LU44, label %LU43
LU43:
  %u118 = phi i64 [%u109, %LU45], [0, %LU42] 
  %u119 = phi i64 [%u110, %LU45], [0, %LU42] 
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u118)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u119)
  ret void
LU47:
  %u121 = getelementptr %struct.linkedNums, %struct.linkedNums* %u98, i32 0, i32 0
  %u122 = load i64, i64* %u121
  %u123 = icmp slt i64 %u122, %u99
  %u124 = zext i1 %u123 to i64
  %u125 = trunc i64 %u124 to i1
  br i1 %u125, label %LU49, label %LU50
LU49:
  %u126 = getelementptr %struct.linkedNums, %struct.linkedNums* %u98, i32 0, i32 0
  %u127 = load i64, i64* %u126
  br label %LU48
LU48:
  %u128 = phi %struct.linkedNums* [%u98, %LU49], [%u139, %LU51] 
  %u129 = phi i64 [%u127, %LU49], [%u140, %LU51] 
  %u130 = phi i64 [%u100, %LU49], [%u141, %LU51] 
  %u131 = phi i64 [%u101, %LU49], [%u142, %LU51] 
  br label %LU45
LU50:
  %u132 = getelementptr %struct.linkedNums, %struct.linkedNums* %u98, i32 0, i32 0
  %u133 = load i64, i64* %u132
  %u134 = icmp sgt i64 %u133, %u100
  %u135 = zext i1 %u134 to i64
  %u136 = trunc i64 %u135 to i1
  br i1 %u136, label %LU52, label %LU51
LU52:
  %u137 = getelementptr %struct.linkedNums, %struct.linkedNums* %u98, i32 0, i32 0
  %u138 = load i64, i64* %u137
  br label %LU51
LU51:
  %u139 = phi %struct.linkedNums* [%u98, %LU52], [%u98, %LU50] 
  %u140 = phi i64 [%u99, %LU52], [%u99, %LU50] 
  %u141 = phi i64 [%u138, %LU52], [%u100, %LU50] 
  %u142 = phi i64 [%u101, %LU52], [%u101, %LU50] 
  br label %LU48
}


define i64 @main()
{
LU61:
  br label %LU62
LU62:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u143 = load i64, i64* @.read_scratch
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u144 = load i64, i64* @.read_scratch
  %u145 = call %struct.linkedNums* @getRands(i64 %u143, i64 %u144)
  %u146 = call i64 @calcMean(%struct.linkedNums* %u145)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u146)
  call void @range(%struct.linkedNums* %u145)
  call void @approxSqrtAll(%struct.linkedNums* %u145)
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
