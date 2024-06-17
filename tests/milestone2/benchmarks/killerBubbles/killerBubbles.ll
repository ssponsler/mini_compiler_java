target triple="x86_64"
%struct.Node = type {i64, %struct.Node*, %struct.Node*}

@swapped = common global i64 0, align 8

define i64 @compare(%struct.Node* %a, %struct.Node* %b)
{
LU2:
  br label %LU3
LU3:
  %u0 = getelementptr %struct.Node, %struct.Node* %a, i32 0, i32 0
  %u1 = load i64, i64* %u0
  %u2 = getelementptr %struct.Node, %struct.Node* %b, i32 0, i32 0
  %u3 = load i64, i64* %u2
  %u4 = sub i64 %u1, %u3
  ret i64 %u4
}


define void @deathSort(%struct.Node* %head)
{
LU11:
  br label %LU12
LU12:
  %u5 = icmp eq i64 1, 1
  %u6 = zext i1 %u5 to i64
  %u7 = trunc i64 %u6 to i1
  br i1 %u7, label %LU14, label %LU13
LU14:
  %u8 = phi %struct.Node* [%head, %LU12], [%u48, %LU15] 
  %u10 = phi i64 [0, %LU12], [%u50, %LU15] 
  %u12 = getelementptr %struct.Node, %struct.Node* %u8, i32 0, i32 2
  %u13 = load %struct.Node*, %struct.Node** %u12
  %u14 = icmp ne %struct.Node* %u13, %u8
  %u15 = zext i1 %u14 to i64
  %u16 = trunc i64 %u15 to i1
  br i1 %u16, label %LU16, label %LU15
LU16:
  %u17 = phi %struct.Node* [%u8, %LU14], [%u37, %LU17] 
  %u18 = phi i64 [0, %LU14], [%u38, %LU17] 
  %u19 = phi i64 [%u10, %LU14], [%u39, %LU17] 
  %u20 = phi %struct.Node* [%u8, %LU14], [%u42, %LU17] 
  %u21 = getelementptr %struct.Node, %struct.Node* %u20, i32 0, i32 2
  %u22 = load %struct.Node*, %struct.Node** %u21
  %u23 = call i64 @compare(%struct.Node* %u20, %struct.Node* %u22)
  %u24 = icmp sgt i64 %u23, 0
  %u25 = zext i1 %u24 to i64
  %u26 = trunc i64 %u25 to i1
  br i1 %u26, label %LU18, label %LU17
LU18:
  %u27 = getelementptr %struct.Node, %struct.Node* %u20, i32 0, i32 0
  %u28 = load i64, i64* %u27
  %u29 = getelementptr %struct.Node, %struct.Node* %u20, i32 0, i32 2
  %u30 = load %struct.Node*, %struct.Node** %u29
  %u31 = getelementptr %struct.Node, %struct.Node* %u30, i32 0, i32 0
  %u32 = load i64, i64* %u31
  %u33 = getelementptr %struct.Node, %struct.Node* %u20, i32 0, i32 0
  store i64 %u32, i64* %u33
  %u34 = getelementptr %struct.Node, %struct.Node* %u20, i32 0, i32 2
  %u35 = load %struct.Node*, %struct.Node** %u34
  %u36 = getelementptr %struct.Node, %struct.Node* %u35, i32 0, i32 0
  store i64 %u28, i64* %u36
  br label %LU17
LU17:
  %u37 = phi %struct.Node* [%u17, %LU18], [%u17, %LU16] 
  %u38 = phi i64 [1, %LU18], [%u18, %LU16] 
  %u39 = phi i64 [%u28, %LU18], [%u19, %LU16] 
  %u40 = phi %struct.Node* [%u20, %LU18], [%u20, %LU16] 
  %u41 = getelementptr %struct.Node, %struct.Node* %u40, i32 0, i32 2
  %u42 = load %struct.Node*, %struct.Node** %u41
  %u43 = getelementptr %struct.Node, %struct.Node* %u42, i32 0, i32 2
  %u44 = load %struct.Node*, %struct.Node** %u43
  %u45 = icmp ne %struct.Node* %u44, %u37
  %u46 = zext i1 %u45 to i64
  %u47 = trunc i64 %u46 to i1
  br i1 %u47, label %LU16, label %LU15
LU15:
  %u48 = phi %struct.Node* [%u37, %LU17], [%u8, %LU14] 
  %u49 = phi i64 [%u38, %LU17], [0, %LU14] 
  %u50 = phi i64 [%u39, %LU17], [%u10, %LU14] 
  %u52 = icmp eq i64 %u49, 1
  %u53 = zext i1 %u52 to i64
  %u54 = trunc i64 %u53 to i1
  br i1 %u54, label %LU14, label %LU13
LU13:
  ret void
}


define void @printEVILList(%struct.Node* %head)
{
LU31:
  br label %LU32
LU32:
  %u59 = getelementptr %struct.Node, %struct.Node* %head, i32 0, i32 2
  %u60 = load %struct.Node*, %struct.Node** %u59
  %u61 = getelementptr %struct.Node, %struct.Node* %head, i32 0, i32 0
  %u62 = load i64, i64* %u61
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u62)
  %u63 = bitcast %struct.Node* %head to i8*
  call void @free(i8* %u63)
  %u64 = icmp ne %struct.Node* %u60, %head
  %u65 = zext i1 %u64 to i64
  %u66 = trunc i64 %u65 to i1
  br i1 %u66, label %LU34, label %LU33
LU34:
  %u67 = phi %struct.Node* [%head, %LU32], [%u67, %LU34] 
  %u68 = phi %struct.Node* [%u60, %LU32], [%u73, %LU34] 
  %u70 = getelementptr %struct.Node, %struct.Node* %u68, i32 0, i32 0
  %u71 = load i64, i64* %u70
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u71)
  %u72 = getelementptr %struct.Node, %struct.Node* %u68, i32 0, i32 2
  %u73 = load %struct.Node*, %struct.Node** %u72
  %u74 = bitcast %struct.Node* %u68 to i8*
  call void @free(i8* %u74)
  %u75 = icmp ne %struct.Node* %u73, %u67
  %u76 = zext i1 %u75 to i64
  %u77 = trunc i64 %u76 to i1
  br i1 %u77, label %LU34, label %LU33
LU33:
  ret void
}


define i64 @main()
{
LU41:
  br label %LU42
LU42:
  store i64 666, i64* @swapped
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u81 = load i64, i64* @.read_scratch
  %u82 = icmp sle i64 %u81, 0
  %u83 = zext i1 %u82 to i64
  %u84 = trunc i64 %u83 to i1
  br i1 %u84, label %LU44, label %LU43
LU44:
  %u85 = sub i64 0, 1
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u85)
  %u86 = sub i64 0, 1
  ret i64 %u86
LU43:
  %u87 = mul i64 %u81, 1000
  %u88 = call i8* @malloc(i64 24)
  %u89 = bitcast i8* %u88 to %struct.Node*
  %u90 = getelementptr %struct.Node, %struct.Node* %u89, i32 0, i32 0
  store i64 %u87, i64* %u90
  %u91 = getelementptr %struct.Node, %struct.Node* %u89, i32 0, i32 1
  store %struct.Node* %u89, %struct.Node** %u91
  %u92 = getelementptr %struct.Node, %struct.Node* %u89, i32 0, i32 2
  store %struct.Node* %u89, %struct.Node** %u92
  %u93 = sub i64 %u87, 1
  %u94 = icmp sgt i64 %u93, 0
  %u95 = zext i1 %u94 to i64
  %u96 = trunc i64 %u95 to i1
  br i1 %u96, label %LU48, label %LU47
LU48:
  %u97 = phi i64 [%u87, %LU43], [%u97, %LU48] 
  %u98 = phi i64 [%u93, %LU43], [%u108, %LU48] 
  %u100 = phi %struct.Node* [%u89, %LU43], [%u100, %LU48] 
  %u101 = phi %struct.Node* [%u89, %LU43], [%u103, %LU48] 
  %u102 = call i8* @malloc(i64 24)
  %u103 = bitcast i8* %u102 to %struct.Node*
  %u104 = getelementptr %struct.Node, %struct.Node* %u103, i32 0, i32 0
  store i64 %u98, i64* %u104
  %u105 = getelementptr %struct.Node, %struct.Node* %u103, i32 0, i32 1
  store %struct.Node* %u101, %struct.Node** %u105
  %u106 = getelementptr %struct.Node, %struct.Node* %u103, i32 0, i32 2
  store %struct.Node* %u100, %struct.Node** %u106
  %u107 = getelementptr %struct.Node, %struct.Node* %u101, i32 0, i32 2
  store %struct.Node* %u103, %struct.Node** %u107
  %u108 = sub i64 %u98, 1
  %u109 = icmp sgt i64 %u108, 0
  %u110 = zext i1 %u109 to i64
  %u111 = trunc i64 %u110 to i1
  br i1 %u111, label %LU48, label %LU47
LU47:
  %u115 = phi %struct.Node* [%u100, %LU48], [%u89, %LU43] 
  call void @deathSort(%struct.Node* %u115)
  call void @printEVILList(%struct.Node* %u115)
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
