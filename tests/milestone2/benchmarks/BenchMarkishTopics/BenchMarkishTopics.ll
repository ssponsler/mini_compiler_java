target triple="x86_64"
%struct.intList = type {i64, %struct.intList*}

@intList = common global i64 0, align 8

define i64 @length(%struct.intList* %list)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp eq %struct.intList* %list, null
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU4
LU5:
  ret i64 0
LU4:
  %u3 = getelementptr %struct.intList, %struct.intList* %list, i32 0, i32 1
  %u4 = load %struct.intList*, %struct.intList** %u3
  %u5 = call i64 @length(%struct.intList* %u4)
  %u6 = add i64 1, %u5
  ret i64 %u6
}


define %struct.intList* @addToFront(%struct.intList* %list, i64 %element)
{
LU11:
  br label %LU12
LU12:
  %u7 = icmp eq %struct.intList* %list, null
  %u8 = zext i1 %u7 to i64
  %u9 = trunc i64 %u8 to i1
  br i1 %u9, label %LU14, label %LU13
LU14:
  %u10 = call i8* @malloc(i64 16)
  %u11 = bitcast i8* %u10 to %struct.intList*
  %u12 = getelementptr %struct.intList, %struct.intList* %u11, i32 0, i32 0
  store i64 %element, i64* %u12
  %u13 = getelementptr %struct.intList, %struct.intList* %u11, i32 0, i32 1
  store %struct.intList* null, %struct.intList** %u13
  ret %struct.intList* %u11
LU13:
  %u14 = call i8* @malloc(i64 16)
  %u15 = bitcast i8* %u14 to %struct.intList*
  %u16 = getelementptr %struct.intList, %struct.intList* %u15, i32 0, i32 0
  store i64 %element, i64* %u16
  %u17 = getelementptr %struct.intList, %struct.intList* %u15, i32 0, i32 1
  store %struct.intList* %list, %struct.intList** %u17
  ret %struct.intList* %u15
}


define %struct.intList* @deleteFirst(%struct.intList* %list)
{
LU21:
  br label %LU22
LU22:
  %u18 = icmp eq %struct.intList* %list, null
  %u19 = zext i1 %u18 to i64
  %u20 = trunc i64 %u19 to i1
  br i1 %u20, label %LU24, label %LU23
LU24:
  ret %struct.intList* null
LU23:
  %u21 = getelementptr %struct.intList, %struct.intList* %list, i32 0, i32 1
  %u22 = load %struct.intList*, %struct.intList** %u21
  %u23 = bitcast %struct.intList* %list to i8*
  call void @free(i8* %u23)
  ret %struct.intList* %u22
}


define i64 @main()
{
LU31:
  br label %LU32
LU32:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u24 = load i64, i64* @.read_scratch
  store i64 %u24, i64* @intList
  %u25 = load i64, i64* @intList
  %u26 = icmp sgt i64 %u25, 0
  %u27 = zext i1 %u26 to i64
  %u28 = trunc i64 %u27 to i1
  br i1 %u28, label %LU34, label %LU33
LU34:
  %u29 = phi %struct.intList* [null, %LU32], [%u32, %LU34] 
  %u30 = phi i64 [0, %LU32], [%u30, %LU34] 
  %u31 = load i64, i64* @intList
  %u32 = call %struct.intList* @addToFront(%struct.intList* %u29, i64 %u31)
  %u33 = getelementptr %struct.intList, %struct.intList* %u32, i32 0, i32 0
  %u34 = load i64, i64* %u33
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u34)
  %u35 = load i64, i64* @intList
  %u36 = sub i64 %u35, 1
  store i64 %u36, i64* @intList
  %u37 = load i64, i64* @intList
  %u38 = icmp sgt i64 %u37, 0
  %u39 = zext i1 %u38 to i64
  %u40 = trunc i64 %u39 to i1
  br i1 %u40, label %LU34, label %LU33
LU33:
  %u41 = phi %struct.intList* [%u32, %LU34], [null, %LU32] 
  %u42 = phi i64 [%u30, %LU34], [0, %LU32] 
  %u43 = call i64 @length(%struct.intList* %u41)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u43)
  %u44 = call i64 @length(%struct.intList* %u41)
  %u45 = icmp sgt i64 %u44, 0
  %u46 = zext i1 %u45 to i64
  %u47 = trunc i64 %u46 to i1
  br i1 %u47, label %LU38, label %LU37
LU38:
  %u48 = phi %struct.intList* [%u41, %LU33], [%u54, %LU38] 
  %u49 = phi i64 [%u42, %LU33], [%u52, %LU38] 
  %u50 = getelementptr %struct.intList, %struct.intList* %u48, i32 0, i32 0
  %u51 = load i64, i64* %u50
  %u52 = add i64 %u49, %u51
  %u53 = call i64 @length(%struct.intList* %u48)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u53)
  %u54 = call %struct.intList* @deleteFirst(%struct.intList* %u48)
  %u55 = call i64 @length(%struct.intList* %u54)
  %u56 = icmp sgt i64 %u55, 0
  %u57 = zext i1 %u56 to i64
  %u58 = trunc i64 %u57 to i1
  br i1 %u58, label %LU38, label %LU37
LU37:
  %u60 = phi i64 [%u52, %LU38], [%u42, %LU33] 
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u60)
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
