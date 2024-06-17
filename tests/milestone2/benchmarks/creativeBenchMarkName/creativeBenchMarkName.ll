target triple="x86_64"
%struct.node = type {i64, %struct.node*}


define %struct.node* @buildList()
{
LU2:
  br label %LU3
LU3:
  %u0 = call i8* @malloc(i64 16)
  %u1 = bitcast i8* %u0 to %struct.node*
  %u2 = call i8* @malloc(i64 16)
  %u3 = bitcast i8* %u2 to %struct.node*
  %u4 = call i8* @malloc(i64 16)
  %u5 = bitcast i8* %u4 to %struct.node*
  %u6 = call i8* @malloc(i64 16)
  %u7 = bitcast i8* %u6 to %struct.node*
  %u8 = call i8* @malloc(i64 16)
  %u9 = bitcast i8* %u8 to %struct.node*
  %u10 = call i8* @malloc(i64 16)
  %u11 = bitcast i8* %u10 to %struct.node*
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u12 = getelementptr %struct.node, %struct.node* %u1, i32 0, i32 0
  %u13 = load i64, i64* @.read_scratch
  store i64 %u13, i64* %u12
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u14 = getelementptr %struct.node, %struct.node* %u3, i32 0, i32 0
  %u15 = load i64, i64* @.read_scratch
  store i64 %u15, i64* %u14
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u16 = getelementptr %struct.node, %struct.node* %u5, i32 0, i32 0
  %u17 = load i64, i64* @.read_scratch
  store i64 %u17, i64* %u16
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u18 = getelementptr %struct.node, %struct.node* %u7, i32 0, i32 0
  %u19 = load i64, i64* @.read_scratch
  store i64 %u19, i64* %u18
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u20 = getelementptr %struct.node, %struct.node* %u9, i32 0, i32 0
  %u21 = load i64, i64* @.read_scratch
  store i64 %u21, i64* %u20
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u22 = getelementptr %struct.node, %struct.node* %u11, i32 0, i32 0
  %u23 = load i64, i64* @.read_scratch
  store i64 %u23, i64* %u22
  %u24 = getelementptr %struct.node, %struct.node* %u1, i32 0, i32 1
  store %struct.node* %u3, %struct.node** %u24
  %u25 = getelementptr %struct.node, %struct.node* %u3, i32 0, i32 1
  store %struct.node* %u5, %struct.node** %u25
  %u26 = getelementptr %struct.node, %struct.node* %u5, i32 0, i32 1
  store %struct.node* %u7, %struct.node** %u26
  %u27 = getelementptr %struct.node, %struct.node* %u7, i32 0, i32 1
  store %struct.node* %u9, %struct.node** %u27
  %u28 = getelementptr %struct.node, %struct.node* %u9, i32 0, i32 1
  store %struct.node* %u11, %struct.node** %u28
  %u29 = getelementptr %struct.node, %struct.node* %u11, i32 0, i32 1
  store %struct.node* null, %struct.node** %u29
  ret %struct.node* %u1
}


define i64 @multiple(%struct.node* %list)
{
LU11:
  br label %LU12
LU12:
  %u30 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 0
  %u31 = load i64, i64* %u30
  %u32 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 1
  %u33 = load %struct.node*, %struct.node** %u32
  %u34 = icmp slt i64 0, 5
  %u35 = zext i1 %u34 to i64
  %u36 = trunc i64 %u35 to i1
  br i1 %u36, label %LU14, label %LU13
LU14:
  %u37 = phi %struct.node* [%list, %LU12], [%u37, %LU14] 
  %u38 = phi i64 [0, %LU12], [%u46, %LU14] 
  %u39 = phi i64 [%u31, %LU12], [%u43, %LU14] 
  %u40 = phi %struct.node* [%u33, %LU12], [%u45, %LU14] 
  %u41 = getelementptr %struct.node, %struct.node* %u40, i32 0, i32 0
  %u42 = load i64, i64* %u41
  %u43 = mul i64 %u39, %u42
  %u44 = getelementptr %struct.node, %struct.node* %u40, i32 0, i32 1
  %u45 = load %struct.node*, %struct.node** %u44
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u43)
  %u46 = add i64 %u38, 1
  %u47 = icmp slt i64 %u46, 5
  %u48 = zext i1 %u47 to i64
  %u49 = trunc i64 %u48 to i1
  br i1 %u49, label %LU14, label %LU13
LU13:
  %u52 = phi i64 [%u43, %LU14], [%u31, %LU12] 
  ret i64 %u52
}


define i64 @add(%struct.node* %list)
{
LU21:
  br label %LU22
LU22:
  %u54 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 0
  %u55 = load i64, i64* %u54
  %u56 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 1
  %u57 = load %struct.node*, %struct.node** %u56
  %u58 = icmp slt i64 0, 5
  %u59 = zext i1 %u58 to i64
  %u60 = trunc i64 %u59 to i1
  br i1 %u60, label %LU24, label %LU23
LU24:
  %u61 = phi %struct.node* [%list, %LU22], [%u61, %LU24] 
  %u62 = phi i64 [0, %LU22], [%u70, %LU24] 
  %u63 = phi i64 [%u55, %LU22], [%u67, %LU24] 
  %u64 = phi %struct.node* [%u57, %LU22], [%u69, %LU24] 
  %u65 = getelementptr %struct.node, %struct.node* %u64, i32 0, i32 0
  %u66 = load i64, i64* %u65
  %u67 = add i64 %u63, %u66
  %u68 = getelementptr %struct.node, %struct.node* %u64, i32 0, i32 1
  %u69 = load %struct.node*, %struct.node** %u68
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u67)
  %u70 = add i64 %u62, 1
  %u71 = icmp slt i64 %u70, 5
  %u72 = zext i1 %u71 to i64
  %u73 = trunc i64 %u72 to i1
  br i1 %u73, label %LU24, label %LU23
LU23:
  %u76 = phi i64 [%u67, %LU24], [%u55, %LU22] 
  ret i64 %u76
}


define i64 @recurseList(%struct.node* %list)
{
LU31:
  br label %LU32
LU32:
  %u78 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 1
  %u79 = load %struct.node*, %struct.node** %u78
  %u80 = icmp eq %struct.node* %u79, null
  %u81 = zext i1 %u80 to i64
  %u82 = trunc i64 %u81 to i1
  br i1 %u82, label %LU34, label %LU35
LU34:
  %u83 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 0
  %u84 = load i64, i64* %u83
  ret i64 %u84
LU35:
  %u85 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 0
  %u86 = load i64, i64* %u85
  %u87 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 1
  %u88 = load %struct.node*, %struct.node** %u87
  %u89 = call i64 @recurseList(%struct.node* %u88)
  %u90 = mul i64 %u86, %u89
  ret i64 %u90
}


define i64 @main()
{
LU41:
  br label %LU42
LU42:
  %u91 = call %struct.node* @buildList()
  %u92 = call i64 @multiple(%struct.node* %u91)
  %u93 = call i64 @add(%struct.node* %u91)
  %u94 = sdiv i64 %u93, 2
  %u95 = sub i64 %u92, %u94
  %u96 = icmp slt i64 0, 2
  %u97 = zext i1 %u96 to i64
  %u98 = trunc i64 %u97 to i1
  br i1 %u98, label %LU44, label %LU43
LU44:
  %u99 = phi %struct.node* [%u91, %LU42], [%u99, %LU44] 
  %u100 = phi i64 [%u92, %LU42], [%u100, %LU44] 
  %u101 = phi i64 [%u93, %LU42], [%u101, %LU44] 
  %u102 = phi i64 [%u95, %LU42], [%u102, %LU44] 
  %u103 = phi i64 [0, %LU42], [%u106, %LU44] 
  %u104 = phi i64 [0, %LU42], [%u107, %LU44] 
  %u105 = call i64 @recurseList(%struct.node* %u99)
  %u106 = add i64 %u103, %u105
  %u107 = add i64 %u104, 1
  %u108 = icmp slt i64 %u107, 2
  %u109 = zext i1 %u108 to i64
  %u110 = trunc i64 %u109 to i1
  br i1 %u110, label %LU44, label %LU43
LU43:
  %u111 = phi %struct.node* [%u99, %LU44], [%u91, %LU42] 
  %u112 = phi i64 [%u100, %LU44], [%u92, %LU42] 
  %u113 = phi i64 [%u101, %LU44], [%u93, %LU42] 
  %u114 = phi i64 [%u102, %LU44], [%u95, %LU42] 
  %u115 = phi i64 [%u106, %LU44], [0, %LU42] 
  %u116 = phi i64 [%u107, %LU44], [0, %LU42] 
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u115)
  %u117 = icmp ne i64 %u115, 0
  %u118 = zext i1 %u117 to i64
  %u119 = trunc i64 %u118 to i1
  br i1 %u119, label %LU48, label %LU47
LU48:
  %u120 = phi %struct.node* [%u111, %LU43], [%u120, %LU48] 
  %u121 = phi i64 [%u112, %LU43], [%u121, %LU48] 
  %u122 = phi i64 [%u113, %LU43], [%u122, %LU48] 
  %u123 = phi i64 [%u114, %LU43], [%u123, %LU48] 
  %u124 = phi i64 [%u115, %LU43], [%u126, %LU48] 
  %u125 = phi i64 [%u116, %LU43], [%u125, %LU48] 
  %u126 = sub i64 %u124, 1
  %u127 = icmp ne i64 %u126, 0
  %u128 = zext i1 %u127 to i64
  %u129 = trunc i64 %u128 to i1
  br i1 %u129, label %LU48, label %LU47
LU47:
  %u133 = phi i64 [%u123, %LU48], [%u114, %LU43] 
  %u134 = phi i64 [%u126, %LU48], [%u115, %LU43] 
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u133)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u134)
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
