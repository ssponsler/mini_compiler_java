target triple="x86_64"
%struct.IntList = type {i64, %struct.IntList*}


define %struct.IntList* @getIntList()
{
LU2:
  br label %LU3
LU3:
  %u0 = call i8* @malloc(i64 16)
  %u1 = bitcast i8* %u0 to %struct.IntList*
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u2 = load i64, i64* @.read_scratch
  %u3 = sub i64 0, 1
  %u4 = icmp eq i64 %u2, %u3
  %u5 = zext i1 %u4 to i64
  %u6 = trunc i64 %u5 to i1
  br i1 %u6, label %LU5, label %LU7
LU5:
  %u7 = getelementptr %struct.IntList, %struct.IntList* %u1, i32 0, i32 0
  store i64 %u2, i64* %u7
  %u8 = getelementptr %struct.IntList, %struct.IntList* %u1, i32 0, i32 1
  store %struct.IntList* null, %struct.IntList** %u8
  br label %LU6
LU6:
  ret %struct.IntList* %u1
LU7:
  %u9 = getelementptr %struct.IntList, %struct.IntList* %u1, i32 0, i32 0
  store i64 %u2, i64* %u9
  %u10 = call %struct.IntList* @getIntList()
  %u11 = getelementptr %struct.IntList, %struct.IntList* %u1, i32 0, i32 1
  store %struct.IntList* %u10, %struct.IntList** %u11
  br label %LU8
LU8:
  ret %struct.IntList* %u1
}


define i64 @biggest(i64 %num1, i64 %num2)
{
LU11:
  br label %LU12
LU12:
  %u12 = icmp sgt i64 %num1, %num2
  %u13 = zext i1 %u12 to i64
  %u14 = trunc i64 %u13 to i1
  br i1 %u14, label %LU14, label %LU15
LU14:
  ret i64 %num1
LU15:
  ret i64 %num2
}


define i64 @biggestInList(%struct.IntList* %list)
{
LU21:
  br label %LU22
LU22:
  %u15 = getelementptr %struct.IntList, %struct.IntList* %list, i32 0, i32 0
  %u16 = load i64, i64* %u15
  %u17 = getelementptr %struct.IntList, %struct.IntList* %list, i32 0, i32 1
  %u18 = load %struct.IntList*, %struct.IntList** %u17
  %u19 = icmp ne %struct.IntList* %u18, null
  %u20 = zext i1 %u19 to i64
  %u21 = trunc i64 %u20 to i1
  br i1 %u21, label %LU24, label %LU23
LU24:
  %u22 = phi %struct.IntList* [%list, %LU22], [%u28, %LU25] 
  %u23 = phi i64 [%u16, %LU22], [%u26, %LU25] 
  %u24 = getelementptr %struct.IntList, %struct.IntList* %u22, i32 0, i32 0
  %u25 = load i64, i64* %u24
  %u26 = call i64 @biggest(i64 %u23, i64 %u25)
  %u27 = getelementptr %struct.IntList, %struct.IntList* %u22, i32 0, i32 1
  %u28 = load %struct.IntList*, %struct.IntList** %u27
  br label %LU25
LU25:
  %u29 = getelementptr %struct.IntList, %struct.IntList* %u28, i32 0, i32 1
  %u30 = load %struct.IntList*, %struct.IntList** %u29
  %u31 = icmp ne %struct.IntList* %u30, null
  %u32 = zext i1 %u31 to i64
  %u33 = trunc i64 %u32 to i1
  br i1 %u33, label %LU24, label %LU23
LU23:
  %u35 = phi i64 [%u26, %LU25], [%u16, %LU22] 
  br label %LU26
LU26:
  ret i64 %u35
}


define i64 @main()
{
LU31:
  br label %LU32
LU32:
  %u36 = call %struct.IntList* @getIntList()
  %u37 = call i64 @biggestInList(%struct.IntList* %u36)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u37)
  br label %LU33
LU33:
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
