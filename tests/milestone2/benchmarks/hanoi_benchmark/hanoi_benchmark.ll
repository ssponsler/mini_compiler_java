target triple="x86_64"
%struct.plate = type {i64, %struct.plate*}

@peg1 = common global %struct.plate* null, align 8
@peg2 = common global %struct.plate* null, align 8
@peg3 = common global %struct.plate* null, align 8
@numMoves = common global i64 0, align 8

define void @move(i64 %from, i64 %to)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp eq i64 %from, 1
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU6
LU5:
  %u3 = load %struct.plate*, %struct.plate** @peg1
  %u4 = load %struct.plate*, %struct.plate** @peg1
  %u5 = getelementptr %struct.plate, %struct.plate* %u4, i32 0, i32 1
  %u6 = load %struct.plate*, %struct.plate** %u5
  store %struct.plate* %u6, %struct.plate** @peg1
  br label %LU4
LU4:
  %u8 = phi i64 [%to, %LU5], [%u38, %LU7] 
  %u9 = phi %struct.plate* [%u3, %LU5], [%u39, %LU7] 
  %u10 = icmp eq i64 %u8, 1
  %u11 = zext i1 %u10 to i64
  %u12 = trunc i64 %u11 to i1
  br i1 %u12, label %LU12, label %LU13
LU12:
  %u13 = load %struct.plate*, %struct.plate** @peg1
  %u14 = getelementptr %struct.plate, %struct.plate* %u9, i32 0, i32 1
  store %struct.plate* %u13, %struct.plate** %u14
  store %struct.plate* %u9, %struct.plate** @peg1
  br label %LU11
LU11:
  %u18 = load i64, i64* @numMoves
  %u19 = add i64 %u18, 1
  store i64 %u19, i64* @numMoves
  ret void
LU13:
  %u20 = icmp eq i64 %u8, 2
  %u21 = zext i1 %u20 to i64
  %u22 = trunc i64 %u21 to i1
  br i1 %u22, label %LU15, label %LU16
LU15:
  %u23 = load %struct.plate*, %struct.plate** @peg2
  %u24 = getelementptr %struct.plate, %struct.plate* %u9, i32 0, i32 1
  store %struct.plate* %u23, %struct.plate** %u24
  store %struct.plate* %u9, %struct.plate** @peg2
  br label %LU14
LU14:
  br label %LU11
LU16:
  %u28 = load %struct.plate*, %struct.plate** @peg3
  %u29 = getelementptr %struct.plate, %struct.plate* %u9, i32 0, i32 1
  store %struct.plate* %u28, %struct.plate** %u29
  store %struct.plate* %u9, %struct.plate** @peg3
  br label %LU14
LU6:
  %u30 = icmp eq i64 %from, 2
  %u31 = zext i1 %u30 to i64
  %u32 = trunc i64 %u31 to i1
  br i1 %u32, label %LU8, label %LU9
LU8:
  %u33 = load %struct.plate*, %struct.plate** @peg2
  %u34 = load %struct.plate*, %struct.plate** @peg2
  %u35 = getelementptr %struct.plate, %struct.plate* %u34, i32 0, i32 1
  %u36 = load %struct.plate*, %struct.plate** %u35
  store %struct.plate* %u36, %struct.plate** @peg2
  br label %LU7
LU7:
  %u38 = phi i64 [%to, %LU8], [%to, %LU9] 
  %u39 = phi %struct.plate* [%u33, %LU8], [%u40, %LU9] 
  br label %LU4
LU9:
  %u40 = load %struct.plate*, %struct.plate** @peg3
  %u41 = load %struct.plate*, %struct.plate** @peg3
  %u42 = getelementptr %struct.plate, %struct.plate* %u41, i32 0, i32 1
  %u43 = load %struct.plate*, %struct.plate** %u42
  store %struct.plate* %u43, %struct.plate** @peg3
  br label %LU7
}


define void @hanoi(i64 %n, i64 %from, i64 %to, i64 %other)
{
LU21:
  br label %LU22
LU22:
  %u44 = icmp eq i64 %n, 1
  %u45 = zext i1 %u44 to i64
  %u46 = trunc i64 %u45 to i1
  br i1 %u46, label %LU24, label %LU25
LU24:
  call void @move(i64 %from, i64 %to)
  br label %LU23
LU23:
  ret void
LU25:
  %u51 = sub i64 %n, 1
  call void @hanoi(i64 %u51, i64 %from, i64 %other, i64 %to)
  call void @move(i64 %from, i64 %to)
  %u52 = sub i64 %n, 1
  call void @hanoi(i64 %u52, i64 %other, i64 %to, i64 %from)
  br label %LU23
}


define void @printPeg(%struct.plate* %peg)
{
LU31:
  br label %LU32
LU32:
  %u53 = icmp ne %struct.plate* %peg, null
  %u54 = zext i1 %u53 to i64
  %u55 = trunc i64 %u54 to i1
  br i1 %u55, label %LU34, label %LU33
LU34:
  %u56 = phi %struct.plate* [%peg, %LU32], [%u56, %LU34] 
  %u57 = phi %struct.plate* [%peg, %LU32], [%u61, %LU34] 
  %u58 = getelementptr %struct.plate, %struct.plate* %u57, i32 0, i32 0
  %u59 = load i64, i64* %u58
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u59)
  %u60 = getelementptr %struct.plate, %struct.plate* %u57, i32 0, i32 1
  %u61 = load %struct.plate*, %struct.plate** %u60
  %u62 = icmp ne %struct.plate* %u61, null
  %u63 = zext i1 %u62 to i64
  %u64 = trunc i64 %u63 to i1
  br i1 %u64, label %LU34, label %LU33
LU33:
  ret void
}


define i64 @main()
{
LU41:
  br label %LU42
LU42:
  store %struct.plate* null, %struct.plate** @peg1
  store %struct.plate* null, %struct.plate** @peg2
  store %struct.plate* null, %struct.plate** @peg3
  store i64 0, i64* @numMoves
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u67 = load i64, i64* @.read_scratch
  %u68 = icmp sge i64 %u67, 1
  %u69 = zext i1 %u68 to i64
  %u70 = trunc i64 %u69 to i1
  br i1 %u70, label %LU44, label %LU43
LU44:
  %u71 = icmp ne i64 %u67, 0
  %u72 = zext i1 %u71 to i64
  %u73 = trunc i64 %u72 to i1
  br i1 %u73, label %LU46, label %LU45
LU46:
  %u74 = phi i64 [%u67, %LU44], [%u82, %LU46] 
  %u75 = phi i64 [%u67, %LU44], [%u75, %LU46] 
  %u77 = call i8* @malloc(i64 16)
  %u78 = bitcast i8* %u77 to %struct.plate*
  %u79 = getelementptr %struct.plate, %struct.plate* %u78, i32 0, i32 0
  store i64 %u74, i64* %u79
  %u80 = load %struct.plate*, %struct.plate** @peg1
  %u81 = getelementptr %struct.plate, %struct.plate* %u78, i32 0, i32 1
  store %struct.plate* %u80, %struct.plate** %u81
  store %struct.plate* %u78, %struct.plate** @peg1
  %u82 = sub i64 %u74, 1
  %u83 = icmp ne i64 %u82, 0
  %u84 = zext i1 %u83 to i64
  %u85 = trunc i64 %u84 to i1
  br i1 %u85, label %LU46, label %LU45
LU45:
  %u86 = phi i64 [%u82, %LU46], [%u67, %LU44] 
  %u87 = phi i64 [%u75, %LU46], [%u67, %LU44] 
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  %u89 = load %struct.plate*, %struct.plate** @peg1
  call void @printPeg(%struct.plate* %u89)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 2)
  %u90 = load %struct.plate*, %struct.plate** @peg2
  call void @printPeg(%struct.plate* %u90)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 3)
  %u91 = load %struct.plate*, %struct.plate** @peg3
  call void @printPeg(%struct.plate* %u91)
  call void @hanoi(i64 %u87, i64 1, i64 3, i64 2)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  %u92 = load %struct.plate*, %struct.plate** @peg1
  call void @printPeg(%struct.plate* %u92)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 2)
  %u93 = load %struct.plate*, %struct.plate** @peg2
  call void @printPeg(%struct.plate* %u93)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 3)
  %u94 = load %struct.plate*, %struct.plate** @peg3
  call void @printPeg(%struct.plate* %u94)
  %u95 = load i64, i64* @numMoves
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u95)
  %u96 = load %struct.plate*, %struct.plate** @peg3
  %u97 = icmp ne %struct.plate* %u96, null
  %u98 = zext i1 %u97 to i64
  %u99 = trunc i64 %u98 to i1
  br i1 %u99, label %LU50, label %LU49
LU50:
  %u100 = phi i64 [%u86, %LU45], [%u100, %LU50] 
  %u101 = phi i64 [%u87, %LU45], [%u101, %LU50] 
  %u103 = load %struct.plate*, %struct.plate** @peg3
  %u104 = load %struct.plate*, %struct.plate** @peg3
  %u105 = getelementptr %struct.plate, %struct.plate* %u104, i32 0, i32 1
  %u106 = load %struct.plate*, %struct.plate** %u105
  store %struct.plate* %u106, %struct.plate** @peg3
  %u107 = bitcast %struct.plate* %u103 to i8*
  call void @free(i8* %u107)
  %u108 = load %struct.plate*, %struct.plate** @peg3
  %u109 = icmp ne %struct.plate* %u108, null
  %u110 = zext i1 %u109 to i64
  %u111 = trunc i64 %u110 to i1
  br i1 %u111, label %LU50, label %LU49
LU49:
  br label %LU43
LU43:
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
