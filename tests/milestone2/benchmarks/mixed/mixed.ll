target triple="x86_64"
%struct.simple = type {i64}
%struct.foo = type {i64, i64, %struct.simple*}

@globalfoo = common global %struct.foo* null, align 8

define void @tailrecursive(i64 %num)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp sle i64 %num, 0
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU4
LU5:
  ret void
LU4:
  br label %LU6
LU6:
  %u3 = sub i64 %num, 1
  call void @tailrecursive(i64 %u3)
  br label %LU7
LU7:
  ret void
}


define i64 @add(i64 %x, i64 %y)
{
LU11:
  br label %LU12
LU12:
  %u4 = add i64 %x, %y
  ret i64 %u4
}


define void @domath(i64 %num)
{
LU21:
  br label %LU22
LU22:
  %u5 = call i8* @malloc(i64 24)
  %u6 = bitcast i8* %u5 to %struct.foo*
  %u7 = call i8* @malloc(i64 8)
  %u8 = bitcast i8* %u7 to %struct.simple*
  %u9 = getelementptr %struct.foo, %struct.foo* %u6, i32 0, i32 2
  store %struct.simple* %u8, %struct.simple** %u9
  %u10 = call i8* @malloc(i64 24)
  %u11 = bitcast i8* %u10 to %struct.foo*
  %u12 = call i8* @malloc(i64 8)
  %u13 = bitcast i8* %u12 to %struct.simple*
  %u14 = getelementptr %struct.foo, %struct.foo* %u11, i32 0, i32 2
  store %struct.simple* %u13, %struct.simple** %u14
  %u15 = getelementptr %struct.foo, %struct.foo* %u6, i32 0, i32 0
  store i64 %num, i64* %u15
  %u16 = getelementptr %struct.foo, %struct.foo* %u11, i32 0, i32 0
  store i64 3, i64* %u16
  %u17 = getelementptr %struct.foo, %struct.foo* %u6, i32 0, i32 0
  %u18 = load i64, i64* %u17
  %u19 = getelementptr %struct.foo, %struct.foo* %u6, i32 0, i32 2
  %u20 = load %struct.simple*, %struct.simple** %u19
  %u21 = getelementptr %struct.simple, %struct.simple* %u20, i32 0, i32 0
  store i64 %u18, i64* %u21
  %u22 = getelementptr %struct.foo, %struct.foo* %u11, i32 0, i32 0
  %u23 = load i64, i64* %u22
  %u24 = getelementptr %struct.foo, %struct.foo* %u11, i32 0, i32 2
  %u25 = load %struct.simple*, %struct.simple** %u24
  %u26 = getelementptr %struct.simple, %struct.simple* %u25, i32 0, i32 0
  store i64 %u23, i64* %u26
  %u27 = icmp sgt i64 %num, 0
  %u28 = zext i1 %u27 to i64
  %u29 = trunc i64 %u28 to i1
  br i1 %u29, label %LU24, label %LU23
LU24:
  %u30 = phi i64 [%num, %LU22], [%u59, %LU25] 
  %u31 = phi %struct.foo* [%u6, %LU22], [%u31, %LU25] 
  %u32 = phi %struct.foo* [%u11, %LU22], [%u32, %LU25] 
  %u33 = phi i64 [0, %LU22], [%u58, %LU25] 
  %u34 = getelementptr %struct.foo, %struct.foo* %u31, i32 0, i32 0
  %u35 = load i64, i64* %u34
  %u36 = getelementptr %struct.foo, %struct.foo* %u32, i32 0, i32 0
  %u37 = load i64, i64* %u36
  %u38 = mul i64 %u35, %u37
  %u39 = getelementptr %struct.foo, %struct.foo* %u31, i32 0, i32 2
  %u40 = load %struct.simple*, %struct.simple** %u39
  %u41 = getelementptr %struct.simple, %struct.simple* %u40, i32 0, i32 0
  %u42 = load i64, i64* %u41
  %u43 = mul i64 %u38, %u42
  %u44 = getelementptr %struct.foo, %struct.foo* %u32, i32 0, i32 0
  %u45 = load i64, i64* %u44
  %u46 = sdiv i64 %u43, %u45
  %u47 = getelementptr %struct.foo, %struct.foo* %u32, i32 0, i32 2
  %u48 = load %struct.simple*, %struct.simple** %u47
  %u49 = getelementptr %struct.simple, %struct.simple* %u48, i32 0, i32 0
  %u50 = load i64, i64* %u49
  %u51 = getelementptr %struct.foo, %struct.foo* %u31, i32 0, i32 0
  %u52 = load i64, i64* %u51
  %u53 = call i64 @add(i64 %u50, i64 %u52)
  %u54 = getelementptr %struct.foo, %struct.foo* %u32, i32 0, i32 0
  %u55 = load i64, i64* %u54
  %u56 = getelementptr %struct.foo, %struct.foo* %u31, i32 0, i32 0
  %u57 = load i64, i64* %u56
  %u58 = sub i64 %u55, %u57
  %u59 = sub i64 %u30, 1
  br label %LU25
LU25:
  %u60 = icmp sgt i64 %u59, 0
  %u61 = zext i1 %u60 to i64
  %u62 = trunc i64 %u61 to i1
  br i1 %u62, label %LU24, label %LU23
LU23:
  %u64 = phi %struct.foo* [%u31, %LU25], [%u6, %LU22] 
  %u65 = phi %struct.foo* [%u32, %LU25], [%u11, %LU22] 
  br label %LU26
LU26:
  %u67 = getelementptr %struct.foo, %struct.foo* %u64, i32 0, i32 2
  %u68 = load %struct.simple*, %struct.simple** %u67
  %u69 = bitcast %struct.simple* %u68 to i8*
  call void @free(i8* %u69)
  %u70 = getelementptr %struct.foo, %struct.foo* %u65, i32 0, i32 2
  %u71 = load %struct.simple*, %struct.simple** %u70
  %u72 = bitcast %struct.simple* %u71 to i8*
  call void @free(i8* %u72)
  %u73 = bitcast %struct.foo* %u64 to i8*
  call void @free(i8* %u73)
  %u74 = bitcast %struct.foo* %u65 to i8*
  call void @free(i8* %u74)
  br label %LU27
LU27:
  ret void
}


define void @objinstantiation(i64 %num)
{
LU31:
  br label %LU32
LU32:
  %u75 = icmp sgt i64 %num, 0
  %u76 = zext i1 %u75 to i64
  %u77 = trunc i64 %u76 to i1
  br i1 %u77, label %LU34, label %LU33
LU34:
  %u78 = phi i64 [%num, %LU32], [%u83, %LU35] 
  %u79 = phi %struct.foo* [null, %LU32], [%u81, %LU35] 
  %u80 = call i8* @malloc(i64 24)
  %u81 = bitcast i8* %u80 to %struct.foo*
  %u82 = bitcast %struct.foo* %u81 to i8*
  call void @free(i8* %u82)
  %u83 = sub i64 %u78, 1
  br label %LU35
LU35:
  %u84 = icmp sgt i64 %u83, 0
  %u85 = zext i1 %u84 to i64
  %u86 = trunc i64 %u85 to i1
  br i1 %u86, label %LU34, label %LU33
LU33:
  br label %LU36
LU36:
  ret void
}


define i64 @ackermann(i64 %m, i64 %n)
{
LU41:
  br label %LU42
LU42:
  %u89 = icmp eq i64 %m, 0
  %u90 = zext i1 %u89 to i64
  %u91 = trunc i64 %u90 to i1
  br i1 %u91, label %LU44, label %LU43
LU44:
  %u92 = add i64 %n, 1
  ret i64 %u92
LU43:
  br label %LU45
LU45:
  %u93 = icmp eq i64 %n, 0
  %u94 = zext i1 %u93 to i64
  %u95 = trunc i64 %u94 to i1
  br i1 %u95, label %LU47, label %LU48
LU47:
  %u96 = sub i64 %m, 1
  %u97 = call i64 @ackermann(i64 %u96, i64 1)
  ret i64 %u97
LU48:
  %u98 = sub i64 %m, 1
  %u99 = sub i64 %n, 1
  %u100 = call i64 @ackermann(i64 %m, i64 %u99)
  %u101 = call i64 @ackermann(i64 %u98, i64 %u100)
  ret i64 %u101
}


define i64 @main()
{
LU51:
  br label %LU52
LU52:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u102 = load i64, i64* @.read_scratch
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u103 = load i64, i64* @.read_scratch
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u104 = load i64, i64* @.read_scratch
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u105 = load i64, i64* @.read_scratch
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u106 = load i64, i64* @.read_scratch
  call void @tailrecursive(i64 %u102)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u102)
  call void @domath(i64 %u103)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u103)
  call void @objinstantiation(i64 %u104)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u104)
  %u107 = call i64 @ackermann(i64 %u105, i64 %u106)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u107)
  br label %LU53
LU53:
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
