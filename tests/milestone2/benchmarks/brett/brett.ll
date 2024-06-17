target triple="x86_64"
%struct.thing = type {i64, i64, %struct.thing*}

@gi1 = common global i64 0, align 8
@gb1 = common global i64 0, align 8
@gs1 = common global %struct.thing* null, align 8
@counter = common global i64 0, align 8

define void @printgroup(i64 %groupnum)
{
LU2:
  br label %LU3
LU3:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 1)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 1)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 1)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %groupnum)
  br label %LU4
LU4:
  ret void
}


define i64 @setcounter(i64 %val)
{
LU11:
  br label %LU12
LU12:
  store i64 %val, i64* @counter
  br label %LU13
LU13:
  %u0 = add i64 0, 1
  ret i64 %u0
}


define void @takealltypes(i64 %i, i64 %b, %struct.thing* %s)
{
LU21:
  br label %LU22
LU22:
  %u1 = icmp eq i64 %i, 3
  %u2 = zext i1 %u1 to i64
  %u3 = trunc i64 %u2 to i1
  br i1 %u3, label %LU24, label %LU25
LU24:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU23
LU23:
  %u4 = phi i64 [%i, %LU24], [%i, %LU25] 
  %u5 = phi i64 [%b, %LU24], [%b, %LU25] 
  %u6 = phi %struct.thing* [%s, %LU24], [%s, %LU25] 
  br label %LU26
LU26:
  %u7 = trunc i64 %u5 to i1
  br i1 %u7, label %LU28, label %LU29
LU28:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU27
LU27:
  %u8 = phi i64 [%u4, %LU28], [%u4, %LU29] 
  %u9 = phi i64 [%u5, %LU28], [%u5, %LU29] 
  %u10 = phi %struct.thing* [%u6, %LU28], [%u6, %LU29] 
  br label %LU30
LU30:
  %u11 = getelementptr %struct.thing, %struct.thing* %u10, i32 0, i32 1
  %u12 = load i64, i64* %u11
  %u13 = trunc i64 %u12 to i1
  br i1 %u13, label %LU32, label %LU33
LU32:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU31
LU31:
  br label %LU34
LU34:
  ret void
LU33:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU31
LU29:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU27
LU25:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU23
}


define void @tonofargs(i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, i64 %a8)
{
LU41:
  br label %LU42
LU42:
  %u17 = icmp eq i64 %a5, 5
  %u18 = zext i1 %u17 to i64
  %u19 = trunc i64 %u18 to i1
  br i1 %u19, label %LU44, label %LU45
LU44:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU43
LU43:
  %u20 = phi i64 [%a1, %LU44], [%a1, %LU45] 
  %u21 = phi i64 [%a2, %LU44], [%a2, %LU45] 
  %u22 = phi i64 [%a3, %LU44], [%a3, %LU45] 
  %u23 = phi i64 [%a4, %LU44], [%a4, %LU45] 
  %u24 = phi i64 [%a5, %LU44], [%a5, %LU45] 
  %u25 = phi i64 [%a6, %LU44], [%a6, %LU45] 
  %u26 = phi i64 [%a7, %LU44], [%a7, %LU45] 
  %u27 = phi i64 [%a8, %LU44], [%a8, %LU45] 
  br label %LU46
LU46:
  %u28 = icmp eq i64 %u25, 6
  %u29 = zext i1 %u28 to i64
  %u30 = trunc i64 %u29 to i1
  br i1 %u30, label %LU48, label %LU49
LU48:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU47
LU47:
  %u31 = phi i64 [%u20, %LU48], [%u20, %LU49] 
  %u32 = phi i64 [%u21, %LU48], [%u21, %LU49] 
  %u33 = phi i64 [%u22, %LU48], [%u22, %LU49] 
  %u34 = phi i64 [%u23, %LU48], [%u23, %LU49] 
  %u35 = phi i64 [%u24, %LU48], [%u24, %LU49] 
  %u36 = phi i64 [%u25, %LU48], [%u25, %LU49] 
  %u37 = phi i64 [%u26, %LU48], [%u26, %LU49] 
  %u38 = phi i64 [%u27, %LU48], [%u27, %LU49] 
  br label %LU50
LU50:
  %u39 = icmp eq i64 %u37, 7
  %u40 = zext i1 %u39 to i64
  %u41 = trunc i64 %u40 to i1
  br i1 %u41, label %LU52, label %LU53
LU52:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU51
LU51:
  %u42 = phi i64 [%u31, %LU52], [%u31, %LU53] 
  %u43 = phi i64 [%u32, %LU52], [%u32, %LU53] 
  %u44 = phi i64 [%u33, %LU52], [%u33, %LU53] 
  %u45 = phi i64 [%u34, %LU52], [%u34, %LU53] 
  %u46 = phi i64 [%u35, %LU52], [%u35, %LU53] 
  %u47 = phi i64 [%u36, %LU52], [%u36, %LU53] 
  %u48 = phi i64 [%u37, %LU52], [%u37, %LU53] 
  %u49 = phi i64 [%u38, %LU52], [%u38, %LU53] 
  br label %LU54
LU54:
  %u50 = icmp eq i64 %u49, 8
  %u51 = zext i1 %u50 to i64
  %u52 = trunc i64 %u51 to i1
  br i1 %u52, label %LU56, label %LU57
LU56:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU55
LU55:
  br label %LU58
LU58:
  ret void
LU57:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u49)
  br label %LU55
LU53:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u37)
  br label %LU51
LU49:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u25)
  br label %LU47
LU45:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %a5)
  br label %LU43
}


define i64 @returnint(i64 %ret)
{
LU61:
  br label %LU62
LU62:
  ret i64 %ret
}


define i64 @returnbool(i64 %ret)
{
LU71:
  br label %LU72
LU72:
  ret i64 %ret
}


define %struct.thing* @returnstruct(%struct.thing* %ret)
{
LU81:
  br label %LU82
LU82:
  ret %struct.thing* %ret
}


define i64 @main()
{
LU91:
  br label %LU92
LU92:
  store i64 0, i64* @counter
  call void @printgroup(i64 1)
  %u61 = add i64 0, 0
  %u62 = add i64 0, 0
  %u63 = and i64 %u61, %u62
  %u64 = trunc i64 %u63 to i1
  br i1 %u64, label %LU94, label %LU95
LU94:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU93
LU93:
  %u65 = phi i64 [%u61, %LU94], [%u61, %LU95] 
  %u66 = phi i64 [%u62, %LU94], [%u62, %LU95] 
  %u67 = phi i64 [0, %LU94], [0, %LU95] 
  %u68 = phi i64 [0, %LU94], [0, %LU95] 
  %u69 = phi i64 [0, %LU94], [0, %LU95] 
  %u70 = phi %struct.thing* [null, %LU94], [null, %LU95] 
  %u71 = phi %struct.thing* [null, %LU94], [null, %LU95] 
  br label %LU96
LU96:
  %u72 = add i64 0, 1
  %u73 = add i64 0, 0
  %u74 = and i64 %u72, %u73
  %u75 = trunc i64 %u74 to i1
  br i1 %u75, label %LU98, label %LU99
LU98:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU97
LU97:
  %u76 = phi i64 [%u72, %LU98], [%u72, %LU99] 
  %u77 = phi i64 [%u73, %LU98], [%u73, %LU99] 
  %u78 = phi i64 [%u67, %LU98], [%u67, %LU99] 
  %u79 = phi i64 [%u68, %LU98], [%u68, %LU99] 
  %u80 = phi i64 [%u69, %LU98], [%u69, %LU99] 
  %u81 = phi %struct.thing* [%u70, %LU98], [%u70, %LU99] 
  %u82 = phi %struct.thing* [%u71, %LU98], [%u71, %LU99] 
  br label %LU100
LU100:
  %u83 = add i64 0, 0
  %u84 = add i64 0, 1
  %u85 = and i64 %u83, %u84
  %u86 = trunc i64 %u85 to i1
  br i1 %u86, label %LU102, label %LU103
LU102:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU101
LU101:
  %u87 = phi i64 [%u83, %LU102], [%u83, %LU103] 
  %u88 = phi i64 [%u84, %LU102], [%u84, %LU103] 
  %u89 = phi i64 [%u78, %LU102], [%u78, %LU103] 
  %u90 = phi i64 [%u79, %LU102], [%u79, %LU103] 
  %u91 = phi i64 [%u80, %LU102], [%u80, %LU103] 
  %u92 = phi %struct.thing* [%u81, %LU102], [%u81, %LU103] 
  %u93 = phi %struct.thing* [%u82, %LU102], [%u82, %LU103] 
  br label %LU104
LU104:
  %u94 = add i64 0, 1
  %u95 = add i64 0, 1
  %u96 = and i64 %u94, %u95
  %u97 = trunc i64 %u96 to i1
  br i1 %u97, label %LU106, label %LU107
LU106:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU105
LU105:
  %u98 = phi i64 [%u94, %LU106], [%u94, %LU107] 
  %u99 = phi i64 [%u95, %LU106], [%u95, %LU107] 
  %u100 = phi i64 [%u89, %LU106], [%u89, %LU107] 
  %u101 = phi i64 [%u90, %LU106], [%u90, %LU107] 
  %u102 = phi i64 [%u91, %LU106], [%u91, %LU107] 
  %u103 = phi %struct.thing* [%u92, %LU106], [%u92, %LU107] 
  %u104 = phi %struct.thing* [%u93, %LU106], [%u93, %LU107] 
  br label %LU108
LU108:
  store i64 0, i64* @counter
  call void @printgroup(i64 2)
  %u105 = add i64 0, 1
  %u106 = add i64 0, 1
  %u107 = or i64 %u105, %u106
  %u108 = trunc i64 %u107 to i1
  br i1 %u108, label %LU110, label %LU111
LU110:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU109
LU109:
  %u109 = phi i64 [%u105, %LU110], [%u105, %LU111] 
  %u110 = phi i64 [%u106, %LU110], [%u106, %LU111] 
  %u111 = phi i64 [%u100, %LU110], [%u100, %LU111] 
  %u112 = phi i64 [%u101, %LU110], [%u101, %LU111] 
  %u113 = phi i64 [%u102, %LU110], [%u102, %LU111] 
  %u114 = phi %struct.thing* [%u103, %LU110], [%u103, %LU111] 
  %u115 = phi %struct.thing* [%u104, %LU110], [%u104, %LU111] 
  br label %LU112
LU112:
  %u116 = add i64 0, 1
  %u117 = add i64 0, 0
  %u118 = or i64 %u116, %u117
  %u119 = trunc i64 %u118 to i1
  br i1 %u119, label %LU114, label %LU115
LU114:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU113
LU113:
  %u120 = phi i64 [%u116, %LU114], [%u116, %LU115] 
  %u121 = phi i64 [%u117, %LU114], [%u117, %LU115] 
  %u122 = phi i64 [%u111, %LU114], [%u111, %LU115] 
  %u123 = phi i64 [%u112, %LU114], [%u112, %LU115] 
  %u124 = phi i64 [%u113, %LU114], [%u113, %LU115] 
  %u125 = phi %struct.thing* [%u114, %LU114], [%u114, %LU115] 
  %u126 = phi %struct.thing* [%u115, %LU114], [%u115, %LU115] 
  br label %LU116
LU116:
  %u127 = add i64 0, 0
  %u128 = add i64 0, 1
  %u129 = or i64 %u127, %u128
  %u130 = trunc i64 %u129 to i1
  br i1 %u130, label %LU118, label %LU119
LU118:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU117
LU117:
  %u131 = phi i64 [%u127, %LU118], [%u127, %LU119] 
  %u132 = phi i64 [%u128, %LU118], [%u128, %LU119] 
  %u133 = phi i64 [%u122, %LU118], [%u122, %LU119] 
  %u134 = phi i64 [%u123, %LU118], [%u123, %LU119] 
  %u135 = phi i64 [%u124, %LU118], [%u124, %LU119] 
  %u136 = phi %struct.thing* [%u125, %LU118], [%u125, %LU119] 
  %u137 = phi %struct.thing* [%u126, %LU118], [%u126, %LU119] 
  br label %LU120
LU120:
  %u138 = add i64 0, 0
  %u139 = add i64 0, 0
  %u140 = or i64 %u138, %u139
  %u141 = trunc i64 %u140 to i1
  br i1 %u141, label %LU122, label %LU123
LU122:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU121
LU121:
  %u142 = phi i64 [%u138, %LU122], [%u138, %LU123] 
  %u143 = phi i64 [%u139, %LU122], [%u139, %LU123] 
  %u144 = phi i64 [%u133, %LU122], [%u133, %LU123] 
  %u145 = phi i64 [%u134, %LU122], [%u134, %LU123] 
  %u146 = phi i64 [%u135, %LU122], [%u135, %LU123] 
  %u147 = phi %struct.thing* [%u136, %LU122], [%u136, %LU123] 
  %u148 = phi %struct.thing* [%u137, %LU122], [%u137, %LU123] 
  br label %LU124
LU124:
  call void @printgroup(i64 3)
  %u149 = icmp sgt i64 42, 1
  %u150 = zext i1 %u149 to i64
  %u151 = trunc i64 %u150 to i1
  br i1 %u151, label %LU126, label %LU127
LU126:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU125
LU125:
  %u152 = phi i64 [%u142, %LU126], [%u142, %LU127] 
  %u153 = phi i64 [%u143, %LU126], [%u143, %LU127] 
  %u154 = phi i64 [%u144, %LU126], [%u144, %LU127] 
  %u155 = phi i64 [%u145, %LU126], [%u145, %LU127] 
  %u156 = phi i64 [%u146, %LU126], [%u146, %LU127] 
  %u157 = phi %struct.thing* [%u147, %LU126], [%u147, %LU127] 
  %u158 = phi %struct.thing* [%u148, %LU126], [%u148, %LU127] 
  br label %LU128
LU128:
  %u159 = icmp sge i64 42, 1
  %u160 = zext i1 %u159 to i64
  %u161 = trunc i64 %u160 to i1
  br i1 %u161, label %LU130, label %LU131
LU130:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU129
LU129:
  %u162 = phi i64 [%u152, %LU130], [%u152, %LU131] 
  %u163 = phi i64 [%u153, %LU130], [%u153, %LU131] 
  %u164 = phi i64 [%u154, %LU130], [%u154, %LU131] 
  %u165 = phi i64 [%u155, %LU130], [%u155, %LU131] 
  %u166 = phi i64 [%u156, %LU130], [%u156, %LU131] 
  %u167 = phi %struct.thing* [%u157, %LU130], [%u157, %LU131] 
  %u168 = phi %struct.thing* [%u158, %LU130], [%u158, %LU131] 
  br label %LU132
LU132:
  %u169 = icmp slt i64 42, 1
  %u170 = zext i1 %u169 to i64
  %u171 = trunc i64 %u170 to i1
  br i1 %u171, label %LU134, label %LU135
LU134:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU133
LU133:
  %u172 = phi i64 [%u162, %LU134], [%u162, %LU135] 
  %u173 = phi i64 [%u163, %LU134], [%u163, %LU135] 
  %u174 = phi i64 [%u164, %LU134], [%u164, %LU135] 
  %u175 = phi i64 [%u165, %LU134], [%u165, %LU135] 
  %u176 = phi i64 [%u166, %LU134], [%u166, %LU135] 
  %u177 = phi %struct.thing* [%u167, %LU134], [%u167, %LU135] 
  %u178 = phi %struct.thing* [%u168, %LU134], [%u168, %LU135] 
  br label %LU136
LU136:
  %u179 = icmp sle i64 42, 1
  %u180 = zext i1 %u179 to i64
  %u181 = trunc i64 %u180 to i1
  br i1 %u181, label %LU138, label %LU139
LU138:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU137
LU137:
  %u182 = phi i64 [%u172, %LU138], [%u172, %LU139] 
  %u183 = phi i64 [%u173, %LU138], [%u173, %LU139] 
  %u184 = phi i64 [%u174, %LU138], [%u174, %LU139] 
  %u185 = phi i64 [%u175, %LU138], [%u175, %LU139] 
  %u186 = phi i64 [%u176, %LU138], [%u176, %LU139] 
  %u187 = phi %struct.thing* [%u177, %LU138], [%u177, %LU139] 
  %u188 = phi %struct.thing* [%u178, %LU138], [%u178, %LU139] 
  br label %LU140
LU140:
  %u189 = icmp eq i64 42, 1
  %u190 = zext i1 %u189 to i64
  %u191 = trunc i64 %u190 to i1
  br i1 %u191, label %LU142, label %LU143
LU142:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU141
LU141:
  %u192 = phi i64 [%u182, %LU142], [%u182, %LU143] 
  %u193 = phi i64 [%u183, %LU142], [%u183, %LU143] 
  %u194 = phi i64 [%u184, %LU142], [%u184, %LU143] 
  %u195 = phi i64 [%u185, %LU142], [%u185, %LU143] 
  %u196 = phi i64 [%u186, %LU142], [%u186, %LU143] 
  %u197 = phi %struct.thing* [%u187, %LU142], [%u187, %LU143] 
  %u198 = phi %struct.thing* [%u188, %LU142], [%u188, %LU143] 
  br label %LU144
LU144:
  %u199 = icmp ne i64 42, 1
  %u200 = zext i1 %u199 to i64
  %u201 = trunc i64 %u200 to i1
  br i1 %u201, label %LU146, label %LU147
LU146:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU145
LU145:
  %u202 = phi i64 [%u192, %LU146], [%u192, %LU147] 
  %u203 = phi i64 [%u193, %LU146], [%u193, %LU147] 
  %u204 = phi i64 [%u194, %LU146], [%u194, %LU147] 
  %u205 = phi i64 [%u195, %LU146], [%u195, %LU147] 
  %u206 = phi i64 [%u196, %LU146], [%u196, %LU147] 
  %u207 = phi %struct.thing* [%u197, %LU146], [%u197, %LU147] 
  %u208 = phi %struct.thing* [%u198, %LU146], [%u198, %LU147] 
  br label %LU148
LU148:
  %u209 = add i64 0, 1
  %u210 = trunc i64 %u209 to i1
  br i1 %u210, label %LU150, label %LU151
LU150:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU149
LU149:
  %u211 = phi i64 [%u202, %LU150], [%u202, %LU151] 
  %u212 = phi i64 [%u203, %LU150], [%u203, %LU151] 
  %u213 = phi i64 [%u204, %LU150], [%u204, %LU151] 
  %u214 = phi i64 [%u205, %LU150], [%u205, %LU151] 
  %u215 = phi i64 [%u206, %LU150], [%u206, %LU151] 
  %u216 = phi %struct.thing* [%u207, %LU150], [%u207, %LU151] 
  %u217 = phi %struct.thing* [%u208, %LU150], [%u208, %LU151] 
  br label %LU152
LU152:
  %u218 = add i64 0, 1
  %u219 = xor i64 1, %u218
  %u220 = trunc i64 %u219 to i1
  br i1 %u220, label %LU154, label %LU155
LU154:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU153
LU153:
  %u221 = phi i64 [%u211, %LU154], [%u211, %LU155] 
  %u222 = phi i64 [%u212, %LU154], [%u212, %LU155] 
  %u223 = phi i64 [%u213, %LU154], [%u213, %LU155] 
  %u224 = phi i64 [%u214, %LU154], [%u214, %LU155] 
  %u225 = phi i64 [%u215, %LU154], [%u215, %LU155] 
  %u226 = phi %struct.thing* [%u216, %LU154], [%u216, %LU155] 
  %u227 = phi %struct.thing* [%u217, %LU154], [%u217, %LU155] 
  br label %LU156
LU156:
  %u228 = add i64 0, 0
  %u229 = trunc i64 %u228 to i1
  br i1 %u229, label %LU158, label %LU159
LU158:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU157
LU157:
  %u230 = phi i64 [%u221, %LU158], [%u221, %LU159] 
  %u231 = phi i64 [%u222, %LU158], [%u222, %LU159] 
  %u232 = phi i64 [%u223, %LU158], [%u223, %LU159] 
  %u233 = phi i64 [%u224, %LU158], [%u224, %LU159] 
  %u234 = phi i64 [%u225, %LU158], [%u225, %LU159] 
  %u235 = phi %struct.thing* [%u226, %LU158], [%u226, %LU159] 
  %u236 = phi %struct.thing* [%u227, %LU158], [%u227, %LU159] 
  br label %LU160
LU160:
  %u237 = add i64 0, 0
  %u238 = xor i64 1, %u237
  %u239 = trunc i64 %u238 to i1
  br i1 %u239, label %LU162, label %LU163
LU162:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU161
LU161:
  %u240 = phi i64 [%u230, %LU162], [%u230, %LU163] 
  %u241 = phi i64 [%u231, %LU162], [%u231, %LU163] 
  %u242 = phi i64 [%u232, %LU162], [%u232, %LU163] 
  %u243 = phi i64 [%u233, %LU162], [%u233, %LU163] 
  %u244 = phi i64 [%u234, %LU162], [%u234, %LU163] 
  %u245 = phi %struct.thing* [%u235, %LU162], [%u235, %LU163] 
  %u246 = phi %struct.thing* [%u236, %LU162], [%u236, %LU163] 
  br label %LU164
LU164:
  %u247 = add i64 0, 0
  %u248 = xor i64 1, %u247
  %u249 = trunc i64 %u248 to i1
  br i1 %u249, label %LU166, label %LU167
LU166:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU165
LU165:
  %u250 = phi i64 [%u240, %LU166], [%u240, %LU167] 
  %u251 = phi i64 [%u241, %LU166], [%u241, %LU167] 
  %u252 = phi i64 [%u242, %LU166], [%u242, %LU167] 
  %u253 = phi i64 [%u243, %LU166], [%u243, %LU167] 
  %u254 = phi i64 [%u244, %LU166], [%u244, %LU167] 
  %u255 = phi %struct.thing* [%u245, %LU166], [%u245, %LU167] 
  %u256 = phi %struct.thing* [%u246, %LU166], [%u246, %LU167] 
  br label %LU168
LU168:
  call void @printgroup(i64 4)
  %u257 = add i64 2, 3
  %u258 = icmp eq i64 %u257, 5
  %u259 = zext i1 %u258 to i64
  %u260 = trunc i64 %u259 to i1
  br i1 %u260, label %LU170, label %LU171
LU170:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU169
LU169:
  %u261 = phi i64 [%u250, %LU170], [%u250, %LU171] 
  %u262 = phi i64 [%u251, %LU170], [%u251, %LU171] 
  %u263 = phi i64 [%u252, %LU170], [%u252, %LU171] 
  %u264 = phi i64 [%u253, %LU170], [%u253, %LU171] 
  %u265 = phi i64 [%u254, %LU170], [%u254, %LU171] 
  %u266 = phi %struct.thing* [%u255, %LU170], [%u255, %LU171] 
  %u267 = phi %struct.thing* [%u256, %LU170], [%u256, %LU171] 
  br label %LU172
LU172:
  %u268 = mul i64 2, 3
  %u269 = icmp eq i64 %u268, 6
  %u270 = zext i1 %u269 to i64
  %u271 = trunc i64 %u270 to i1
  br i1 %u271, label %LU174, label %LU175
LU174:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU173
LU173:
  %u272 = phi i64 [%u261, %LU174], [%u261, %LU175] 
  %u273 = phi i64 [%u262, %LU174], [%u262, %LU175] 
  %u274 = phi i64 [%u263, %LU174], [%u263, %LU175] 
  %u275 = phi i64 [%u264, %LU174], [%u264, %LU175] 
  %u276 = phi i64 [%u265, %LU174], [%u265, %LU175] 
  %u277 = phi %struct.thing* [%u266, %LU174], [%u266, %LU175] 
  %u278 = phi %struct.thing* [%u267, %LU174], [%u267, %LU175] 
  br label %LU176
LU176:
  %u279 = sub i64 3, 2
  %u280 = icmp eq i64 %u279, 1
  %u281 = zext i1 %u280 to i64
  %u282 = trunc i64 %u281 to i1
  br i1 %u282, label %LU178, label %LU179
LU178:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU177
LU177:
  %u283 = phi i64 [%u272, %LU178], [%u272, %LU179] 
  %u284 = phi i64 [%u273, %LU178], [%u273, %LU179] 
  %u285 = phi i64 [%u274, %LU178], [%u274, %LU179] 
  %u286 = phi i64 [%u275, %LU178], [%u275, %LU179] 
  %u287 = phi i64 [%u276, %LU178], [%u276, %LU179] 
  %u288 = phi %struct.thing* [%u277, %LU178], [%u277, %LU179] 
  %u289 = phi %struct.thing* [%u278, %LU178], [%u278, %LU179] 
  br label %LU180
LU180:
  %u290 = sdiv i64 6, 3
  %u291 = icmp eq i64 %u290, 2
  %u292 = zext i1 %u291 to i64
  %u293 = trunc i64 %u292 to i1
  br i1 %u293, label %LU182, label %LU183
LU182:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU181
LU181:
  %u294 = phi i64 [%u283, %LU182], [%u283, %LU183] 
  %u295 = phi i64 [%u284, %LU182], [%u284, %LU183] 
  %u296 = phi i64 [%u285, %LU182], [%u285, %LU183] 
  %u297 = phi i64 [%u286, %LU182], [%u286, %LU183] 
  %u298 = phi i64 [%u287, %LU182], [%u287, %LU183] 
  %u299 = phi %struct.thing* [%u288, %LU182], [%u288, %LU183] 
  %u300 = phi %struct.thing* [%u289, %LU182], [%u289, %LU183] 
  br label %LU184
LU184:
  %u301 = sub i64 0, 6
  %u302 = icmp slt i64 %u301, 0
  %u303 = zext i1 %u302 to i64
  %u304 = trunc i64 %u303 to i1
  br i1 %u304, label %LU186, label %LU187
LU186:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU185
LU185:
  %u305 = phi i64 [%u294, %LU186], [%u294, %LU187] 
  %u306 = phi i64 [%u295, %LU186], [%u295, %LU187] 
  %u307 = phi i64 [%u296, %LU186], [%u296, %LU187] 
  %u308 = phi i64 [%u297, %LU186], [%u297, %LU187] 
  %u309 = phi i64 [%u298, %LU186], [%u298, %LU187] 
  %u310 = phi %struct.thing* [%u299, %LU186], [%u299, %LU187] 
  %u311 = phi %struct.thing* [%u300, %LU186], [%u300, %LU187] 
  br label %LU188
LU188:
  call void @printgroup(i64 5)
  %u312 = icmp eq i64 42, 42
  %u313 = zext i1 %u312 to i64
  %u314 = trunc i64 %u313 to i1
  br i1 %u314, label %LU190, label %LU191
LU190:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU189
LU189:
  %u315 = phi i64 [%u305, %LU190], [%u305, %LU191] 
  %u316 = phi i64 [%u306, %LU190], [%u306, %LU191] 
  %u317 = phi i64 [42, %LU190], [42, %LU191] 
  %u318 = phi i64 [%u308, %LU190], [%u308, %LU191] 
  %u319 = phi i64 [%u309, %LU190], [%u309, %LU191] 
  %u320 = phi %struct.thing* [%u310, %LU190], [%u310, %LU191] 
  %u321 = phi %struct.thing* [%u311, %LU190], [%u311, %LU191] 
  br label %LU192
LU192:
  %u322 = add i64 3, 2
  %u323 = icmp eq i64 %u322, 5
  %u324 = zext i1 %u323 to i64
  %u325 = trunc i64 %u324 to i1
  br i1 %u325, label %LU194, label %LU195
LU194:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU193
LU193:
  %u326 = phi i64 [%u315, %LU194], [%u315, %LU195] 
  %u327 = phi i64 [%u316, %LU194], [%u316, %LU195] 
  %u328 = phi i64 [3, %LU194], [3, %LU195] 
  %u329 = phi i64 [2, %LU194], [2, %LU195] 
  %u330 = phi i64 [%u322, %LU194], [%u322, %LU195] 
  %u331 = phi %struct.thing* [%u320, %LU194], [%u320, %LU195] 
  %u332 = phi %struct.thing* [%u321, %LU194], [%u321, %LU195] 
  br label %LU196
LU196:
  %u333 = add i64 0, 1
  %u334 = trunc i64 %u333 to i1
  br i1 %u334, label %LU198, label %LU199
LU198:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU197
LU197:
  %u335 = phi i64 [%u333, %LU198], [%u333, %LU199] 
  %u336 = phi i64 [%u327, %LU198], [%u327, %LU199] 
  %u337 = phi i64 [%u328, %LU198], [%u328, %LU199] 
  %u338 = phi i64 [%u329, %LU198], [%u329, %LU199] 
  %u339 = phi i64 [%u330, %LU198], [%u330, %LU199] 
  %u340 = phi %struct.thing* [%u331, %LU198], [%u331, %LU199] 
  %u341 = phi %struct.thing* [%u332, %LU198], [%u332, %LU199] 
  br label %LU200
LU200:
  %u342 = xor i64 1, %u335
  %u343 = trunc i64 %u342 to i1
  br i1 %u343, label %LU202, label %LU203
LU202:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU201
LU201:
  %u344 = phi i64 [%u335, %LU202], [%u335, %LU203] 
  %u345 = phi i64 [%u336, %LU202], [%u336, %LU203] 
  %u346 = phi i64 [%u337, %LU202], [%u337, %LU203] 
  %u347 = phi i64 [%u338, %LU202], [%u338, %LU203] 
  %u348 = phi i64 [%u339, %LU202], [%u339, %LU203] 
  %u349 = phi %struct.thing* [%u340, %LU202], [%u340, %LU203] 
  %u350 = phi %struct.thing* [%u341, %LU202], [%u341, %LU203] 
  br label %LU204
LU204:
  %u351 = add i64 0, 0
  %u352 = trunc i64 %u351 to i1
  br i1 %u352, label %LU206, label %LU207
LU206:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU205
LU205:
  %u353 = phi i64 [%u351, %LU206], [%u351, %LU207] 
  %u354 = phi i64 [%u345, %LU206], [%u345, %LU207] 
  %u355 = phi i64 [%u346, %LU206], [%u346, %LU207] 
  %u356 = phi i64 [%u347, %LU206], [%u347, %LU207] 
  %u357 = phi i64 [%u348, %LU206], [%u348, %LU207] 
  %u358 = phi %struct.thing* [%u349, %LU206], [%u349, %LU207] 
  %u359 = phi %struct.thing* [%u350, %LU206], [%u350, %LU207] 
  br label %LU208
LU208:
  %u360 = xor i64 1, %u353
  %u361 = trunc i64 %u360 to i1
  br i1 %u361, label %LU210, label %LU211
LU210:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU209
LU209:
  %u362 = phi i64 [%u353, %LU210], [%u353, %LU211] 
  %u363 = phi i64 [%u354, %LU210], [%u354, %LU211] 
  %u364 = phi i64 [%u355, %LU210], [%u355, %LU211] 
  %u365 = phi i64 [%u356, %LU210], [%u356, %LU211] 
  %u366 = phi i64 [%u357, %LU210], [%u357, %LU211] 
  %u367 = phi %struct.thing* [%u358, %LU210], [%u358, %LU211] 
  %u368 = phi %struct.thing* [%u359, %LU210], [%u359, %LU211] 
  br label %LU212
LU212:
  %u369 = trunc i64 %u362 to i1
  br i1 %u369, label %LU214, label %LU215
LU214:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU213
LU213:
  %u370 = phi i64 [%u362, %LU214], [%u362, %LU215] 
  %u371 = phi i64 [%u363, %LU214], [%u363, %LU215] 
  %u372 = phi i64 [%u364, %LU214], [%u364, %LU215] 
  %u373 = phi i64 [%u365, %LU214], [%u365, %LU215] 
  %u374 = phi i64 [%u366, %LU214], [%u366, %LU215] 
  %u375 = phi %struct.thing* [%u367, %LU214], [%u367, %LU215] 
  %u376 = phi %struct.thing* [%u368, %LU214], [%u368, %LU215] 
  br label %LU216
LU216:
  call void @printgroup(i64 6)
  %u377 = icmp slt i64 0, 5
  %u378 = zext i1 %u377 to i64
  %u379 = trunc i64 %u378 to i1
  br i1 %u379, label %LU218, label %LU217
LU218:
  %u380 = phi i64 [%u370, %LU216], [%u390, %LU222] 
  %u381 = phi i64 [%u371, %LU216], [%u391, %LU222] 
  %u382 = phi i64 [0, %LU216], [%u397, %LU222] 
  %u383 = phi i64 [%u373, %LU216], [%u393, %LU222] 
  %u384 = phi i64 [%u374, %LU216], [%u394, %LU222] 
  %u385 = phi %struct.thing* [%u375, %LU216], [%u395, %LU222] 
  %u386 = phi %struct.thing* [%u376, %LU216], [%u396, %LU222] 
  %u387 = icmp sge i64 %u382, 5
  %u388 = zext i1 %u387 to i64
  %u389 = trunc i64 %u388 to i1
  br i1 %u389, label %LU220, label %LU219
LU220:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU219
LU219:
  %u390 = phi i64 [%u380, %LU220], [%u380, %LU218] 
  %u391 = phi i64 [%u381, %LU220], [%u381, %LU218] 
  %u392 = phi i64 [%u382, %LU220], [%u382, %LU218] 
  %u393 = phi i64 [%u383, %LU220], [%u383, %LU218] 
  %u394 = phi i64 [%u384, %LU220], [%u384, %LU218] 
  %u395 = phi %struct.thing* [%u385, %LU220], [%u385, %LU218] 
  %u396 = phi %struct.thing* [%u386, %LU220], [%u386, %LU218] 
  br label %LU221
LU221:
  %u397 = add i64 %u392, 5
  br label %LU222
LU222:
  %u398 = icmp slt i64 %u397, 5
  %u399 = zext i1 %u398 to i64
  %u400 = trunc i64 %u399 to i1
  br i1 %u400, label %LU218, label %LU217
LU217:
  %u401 = phi i64 [%u390, %LU222], [%u370, %LU216] 
  %u402 = phi i64 [%u391, %LU222], [%u371, %LU216] 
  %u403 = phi i64 [%u397, %LU222], [0, %LU216] 
  %u404 = phi i64 [%u393, %LU222], [%u373, %LU216] 
  %u405 = phi i64 [%u394, %LU222], [%u374, %LU216] 
  %u406 = phi %struct.thing* [%u395, %LU222], [%u375, %LU216] 
  %u407 = phi %struct.thing* [%u396, %LU222], [%u376, %LU216] 
  br label %LU223
LU223:
  %u408 = icmp eq i64 %u403, 5
  %u409 = zext i1 %u408 to i64
  %u410 = trunc i64 %u409 to i1
  br i1 %u410, label %LU225, label %LU226
LU225:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU224
LU224:
  %u411 = phi i64 [%u401, %LU225], [%u401, %LU226] 
  %u412 = phi i64 [%u402, %LU225], [%u402, %LU226] 
  %u413 = phi i64 [%u403, %LU225], [%u403, %LU226] 
  %u414 = phi i64 [%u404, %LU225], [%u404, %LU226] 
  %u415 = phi i64 [%u405, %LU225], [%u405, %LU226] 
  %u416 = phi %struct.thing* [%u406, %LU225], [%u406, %LU226] 
  %u417 = phi %struct.thing* [%u407, %LU225], [%u407, %LU226] 
  br label %LU227
LU227:
  call void @printgroup(i64 7)
  %u418 = call i8* @malloc(i64 24)
  %u419 = bitcast i8* %u418 to %struct.thing*
  %u420 = getelementptr %struct.thing, %struct.thing* %u419, i32 0, i32 0
  store i64 42, i64* %u420
  %u421 = add i64 0, 1
  %u422 = getelementptr %struct.thing, %struct.thing* %u419, i32 0, i32 1
  store i64 %u421, i64* %u422
  %u423 = getelementptr %struct.thing, %struct.thing* %u419, i32 0, i32 0
  %u424 = load i64, i64* %u423
  %u425 = icmp eq i64 %u424, 42
  %u426 = zext i1 %u425 to i64
  %u427 = trunc i64 %u426 to i1
  br i1 %u427, label %LU229, label %LU230
LU229:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU228
LU228:
  %u428 = phi i64 [%u411, %LU229], [%u411, %LU230] 
  %u429 = phi i64 [%u412, %LU229], [%u412, %LU230] 
  %u430 = phi i64 [%u413, %LU229], [%u413, %LU230] 
  %u431 = phi i64 [%u414, %LU229], [%u414, %LU230] 
  %u432 = phi i64 [%u415, %LU229], [%u415, %LU230] 
  %u433 = phi %struct.thing* [%u419, %LU229], [%u419, %LU230] 
  %u434 = phi %struct.thing* [%u417, %LU229], [%u417, %LU230] 
  br label %LU231
LU231:
  %u435 = getelementptr %struct.thing, %struct.thing* %u433, i32 0, i32 1
  %u436 = load i64, i64* %u435
  %u437 = trunc i64 %u436 to i1
  br i1 %u437, label %LU233, label %LU234
LU233:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU232
LU232:
  %u438 = phi i64 [%u428, %LU233], [%u428, %LU234] 
  %u439 = phi i64 [%u429, %LU233], [%u429, %LU234] 
  %u440 = phi i64 [%u430, %LU233], [%u430, %LU234] 
  %u441 = phi i64 [%u431, %LU233], [%u431, %LU234] 
  %u442 = phi i64 [%u432, %LU233], [%u432, %LU234] 
  %u443 = phi %struct.thing* [%u433, %LU233], [%u433, %LU234] 
  %u444 = phi %struct.thing* [%u434, %LU233], [%u434, %LU234] 
  br label %LU235
LU235:
  %u445 = call i8* @malloc(i64 24)
  %u446 = bitcast i8* %u445 to %struct.thing*
  %u447 = getelementptr %struct.thing, %struct.thing* %u443, i32 0, i32 2
  store %struct.thing* %u446, %struct.thing** %u447
  %u448 = getelementptr %struct.thing, %struct.thing* %u443, i32 0, i32 2
  %u449 = load %struct.thing*, %struct.thing** %u448
  %u450 = getelementptr %struct.thing, %struct.thing* %u449, i32 0, i32 0
  store i64 13, i64* %u450
  %u451 = add i64 0, 0
  %u452 = getelementptr %struct.thing, %struct.thing* %u443, i32 0, i32 2
  %u453 = load %struct.thing*, %struct.thing** %u452
  %u454 = getelementptr %struct.thing, %struct.thing* %u453, i32 0, i32 1
  store i64 %u451, i64* %u454
  %u455 = getelementptr %struct.thing, %struct.thing* %u443, i32 0, i32 2
  %u456 = load %struct.thing*, %struct.thing** %u455
  %u457 = getelementptr %struct.thing, %struct.thing* %u456, i32 0, i32 0
  %u458 = load i64, i64* %u457
  %u459 = icmp eq i64 %u458, 13
  %u460 = zext i1 %u459 to i64
  %u461 = trunc i64 %u460 to i1
  br i1 %u461, label %LU237, label %LU238
LU237:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU236
LU236:
  %u462 = phi i64 [%u438, %LU237], [%u438, %LU238] 
  %u463 = phi i64 [%u439, %LU237], [%u439, %LU238] 
  %u464 = phi i64 [%u440, %LU237], [%u440, %LU238] 
  %u465 = phi i64 [%u441, %LU237], [%u441, %LU238] 
  %u466 = phi i64 [%u442, %LU237], [%u442, %LU238] 
  %u467 = phi %struct.thing* [%u443, %LU237], [%u443, %LU238] 
  %u468 = phi %struct.thing* [%u444, %LU237], [%u444, %LU238] 
  br label %LU239
LU239:
  %u469 = getelementptr %struct.thing, %struct.thing* %u467, i32 0, i32 2
  %u470 = load %struct.thing*, %struct.thing** %u469
  %u471 = getelementptr %struct.thing, %struct.thing* %u470, i32 0, i32 1
  %u472 = load i64, i64* %u471
  %u473 = xor i64 1, %u472
  %u474 = trunc i64 %u473 to i1
  br i1 %u474, label %LU241, label %LU242
LU241:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU240
LU240:
  %u475 = phi i64 [%u462, %LU241], [%u462, %LU242] 
  %u476 = phi i64 [%u463, %LU241], [%u463, %LU242] 
  %u477 = phi i64 [%u464, %LU241], [%u464, %LU242] 
  %u478 = phi i64 [%u465, %LU241], [%u465, %LU242] 
  %u479 = phi i64 [%u466, %LU241], [%u466, %LU242] 
  %u480 = phi %struct.thing* [%u467, %LU241], [%u467, %LU242] 
  %u481 = phi %struct.thing* [%u468, %LU241], [%u468, %LU242] 
  br label %LU243
LU243:
  %u482 = icmp eq %struct.thing* %u480, %u480
  %u483 = zext i1 %u482 to i64
  %u484 = trunc i64 %u483 to i1
  br i1 %u484, label %LU245, label %LU246
LU245:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU244
LU244:
  %u485 = phi i64 [%u475, %LU245], [%u475, %LU246] 
  %u486 = phi i64 [%u476, %LU245], [%u476, %LU246] 
  %u487 = phi i64 [%u477, %LU245], [%u477, %LU246] 
  %u488 = phi i64 [%u478, %LU245], [%u478, %LU246] 
  %u489 = phi i64 [%u479, %LU245], [%u479, %LU246] 
  %u490 = phi %struct.thing* [%u480, %LU245], [%u480, %LU246] 
  %u491 = phi %struct.thing* [%u481, %LU245], [%u481, %LU246] 
  br label %LU247
LU247:
  %u492 = getelementptr %struct.thing, %struct.thing* %u490, i32 0, i32 2
  %u493 = load %struct.thing*, %struct.thing** %u492
  %u494 = icmp ne %struct.thing* %u490, %u493
  %u495 = zext i1 %u494 to i64
  %u496 = trunc i64 %u495 to i1
  br i1 %u496, label %LU249, label %LU250
LU249:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU248
LU248:
  %u497 = phi i64 [%u485, %LU249], [%u485, %LU250] 
  %u498 = phi i64 [%u486, %LU249], [%u486, %LU250] 
  %u499 = phi i64 [%u487, %LU249], [%u487, %LU250] 
  %u500 = phi i64 [%u488, %LU249], [%u488, %LU250] 
  %u501 = phi i64 [%u489, %LU249], [%u489, %LU250] 
  %u502 = phi %struct.thing* [%u490, %LU249], [%u490, %LU250] 
  %u503 = phi %struct.thing* [%u491, %LU249], [%u491, %LU250] 
  br label %LU251
LU251:
  %u504 = getelementptr %struct.thing, %struct.thing* %u502, i32 0, i32 2
  %u505 = load %struct.thing*, %struct.thing** %u504
  %u506 = bitcast %struct.thing* %u505 to i8*
  call void @free(i8* %u506)
  %u507 = bitcast %struct.thing* %u502 to i8*
  call void @free(i8* %u507)
  call void @printgroup(i64 8)
  store i64 7, i64* @gi1
  %u508 = load i64, i64* @gi1
  %u509 = icmp eq i64 %u508, 7
  %u510 = zext i1 %u509 to i64
  %u511 = trunc i64 %u510 to i1
  br i1 %u511, label %LU253, label %LU254
LU253:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU252
LU252:
  %u512 = phi i64 [%u497, %LU253], [%u497, %LU254] 
  %u513 = phi i64 [%u498, %LU253], [%u498, %LU254] 
  %u514 = phi i64 [%u499, %LU253], [%u499, %LU254] 
  %u515 = phi i64 [%u500, %LU253], [%u500, %LU254] 
  %u516 = phi i64 [%u501, %LU253], [%u501, %LU254] 
  %u517 = phi %struct.thing* [%u502, %LU253], [%u502, %LU254] 
  %u518 = phi %struct.thing* [%u503, %LU253], [%u503, %LU254] 
  br label %LU255
LU255:
  %u519 = add i64 0, 1
  store i64 %u519, i64* @gb1
  %u520 = load i64, i64* @gb1
  %u521 = trunc i64 %u520 to i1
  br i1 %u521, label %LU257, label %LU258
LU257:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU256
LU256:
  %u522 = phi i64 [%u512, %LU257], [%u512, %LU258] 
  %u523 = phi i64 [%u513, %LU257], [%u513, %LU258] 
  %u524 = phi i64 [%u514, %LU257], [%u514, %LU258] 
  %u525 = phi i64 [%u515, %LU257], [%u515, %LU258] 
  %u526 = phi i64 [%u516, %LU257], [%u516, %LU258] 
  %u527 = phi %struct.thing* [%u517, %LU257], [%u517, %LU258] 
  %u528 = phi %struct.thing* [%u518, %LU257], [%u518, %LU258] 
  br label %LU259
LU259:
  %u529 = call i8* @malloc(i64 24)
  %u530 = bitcast i8* %u529 to %struct.thing*
  store %struct.thing* %u530, %struct.thing** @gs1
  %u531 = load %struct.thing*, %struct.thing** @gs1
  %u532 = getelementptr %struct.thing, %struct.thing* %u531, i32 0, i32 0
  store i64 34, i64* %u532
  %u533 = add i64 0, 0
  %u534 = load %struct.thing*, %struct.thing** @gs1
  %u535 = getelementptr %struct.thing, %struct.thing* %u534, i32 0, i32 1
  store i64 %u533, i64* %u535
  %u536 = load %struct.thing*, %struct.thing** @gs1
  %u537 = getelementptr %struct.thing, %struct.thing* %u536, i32 0, i32 0
  %u538 = load i64, i64* %u537
  %u539 = icmp eq i64 %u538, 34
  %u540 = zext i1 %u539 to i64
  %u541 = trunc i64 %u540 to i1
  br i1 %u541, label %LU261, label %LU262
LU261:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU260
LU260:
  %u542 = phi i64 [%u522, %LU261], [%u522, %LU262] 
  %u543 = phi i64 [%u523, %LU261], [%u523, %LU262] 
  %u544 = phi i64 [%u524, %LU261], [%u524, %LU262] 
  %u545 = phi i64 [%u525, %LU261], [%u525, %LU262] 
  %u546 = phi i64 [%u526, %LU261], [%u526, %LU262] 
  %u547 = phi %struct.thing* [%u527, %LU261], [%u527, %LU262] 
  %u548 = phi %struct.thing* [%u528, %LU261], [%u528, %LU262] 
  br label %LU263
LU263:
  %u549 = load %struct.thing*, %struct.thing** @gs1
  %u550 = getelementptr %struct.thing, %struct.thing* %u549, i32 0, i32 1
  %u551 = load i64, i64* %u550
  %u552 = xor i64 1, %u551
  %u553 = trunc i64 %u552 to i1
  br i1 %u553, label %LU265, label %LU266
LU265:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU264
LU264:
  %u554 = phi i64 [%u542, %LU265], [%u542, %LU266] 
  %u555 = phi i64 [%u543, %LU265], [%u543, %LU266] 
  %u556 = phi i64 [%u544, %LU265], [%u544, %LU266] 
  %u557 = phi i64 [%u545, %LU265], [%u545, %LU266] 
  %u558 = phi i64 [%u546, %LU265], [%u546, %LU266] 
  %u559 = phi %struct.thing* [%u547, %LU265], [%u547, %LU266] 
  %u560 = phi %struct.thing* [%u548, %LU265], [%u548, %LU266] 
  br label %LU267
LU267:
  %u561 = call i8* @malloc(i64 24)
  %u562 = bitcast i8* %u561 to %struct.thing*
  %u563 = load %struct.thing*, %struct.thing** @gs1
  %u564 = getelementptr %struct.thing, %struct.thing* %u563, i32 0, i32 2
  store %struct.thing* %u562, %struct.thing** %u564
  %u565 = load %struct.thing*, %struct.thing** @gs1
  %u566 = getelementptr %struct.thing, %struct.thing* %u565, i32 0, i32 2
  %u567 = load %struct.thing*, %struct.thing** %u566
  %u568 = getelementptr %struct.thing, %struct.thing* %u567, i32 0, i32 0
  store i64 16, i64* %u568
  %u569 = add i64 0, 1
  %u570 = load %struct.thing*, %struct.thing** @gs1
  %u571 = getelementptr %struct.thing, %struct.thing* %u570, i32 0, i32 2
  %u572 = load %struct.thing*, %struct.thing** %u571
  %u573 = getelementptr %struct.thing, %struct.thing* %u572, i32 0, i32 1
  store i64 %u569, i64* %u573
  %u574 = load %struct.thing*, %struct.thing** @gs1
  %u575 = getelementptr %struct.thing, %struct.thing* %u574, i32 0, i32 2
  %u576 = load %struct.thing*, %struct.thing** %u575
  %u577 = getelementptr %struct.thing, %struct.thing* %u576, i32 0, i32 0
  %u578 = load i64, i64* %u577
  %u579 = icmp eq i64 %u578, 16
  %u580 = zext i1 %u579 to i64
  %u581 = trunc i64 %u580 to i1
  br i1 %u581, label %LU269, label %LU270
LU269:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU268
LU268:
  %u582 = phi i64 [%u554, %LU269], [%u554, %LU270] 
  %u583 = phi i64 [%u555, %LU269], [%u555, %LU270] 
  %u584 = phi i64 [%u556, %LU269], [%u556, %LU270] 
  %u585 = phi i64 [%u557, %LU269], [%u557, %LU270] 
  %u586 = phi i64 [%u558, %LU269], [%u558, %LU270] 
  %u587 = phi %struct.thing* [%u559, %LU269], [%u559, %LU270] 
  %u588 = phi %struct.thing* [%u560, %LU269], [%u560, %LU270] 
  br label %LU271
LU271:
  %u589 = load %struct.thing*, %struct.thing** @gs1
  %u590 = getelementptr %struct.thing, %struct.thing* %u589, i32 0, i32 2
  %u591 = load %struct.thing*, %struct.thing** %u590
  %u592 = getelementptr %struct.thing, %struct.thing* %u591, i32 0, i32 1
  %u593 = load i64, i64* %u592
  %u594 = trunc i64 %u593 to i1
  br i1 %u594, label %LU273, label %LU274
LU273:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU272
LU272:
  %u595 = phi i64 [%u582, %LU273], [%u582, %LU274] 
  %u596 = phi i64 [%u583, %LU273], [%u583, %LU274] 
  %u597 = phi i64 [%u584, %LU273], [%u584, %LU274] 
  %u598 = phi i64 [%u585, %LU273], [%u585, %LU274] 
  %u599 = phi i64 [%u586, %LU273], [%u586, %LU274] 
  %u600 = phi %struct.thing* [%u587, %LU273], [%u587, %LU274] 
  %u601 = phi %struct.thing* [%u588, %LU273], [%u588, %LU274] 
  br label %LU275
LU275:
  %u602 = load %struct.thing*, %struct.thing** @gs1
  %u603 = getelementptr %struct.thing, %struct.thing* %u602, i32 0, i32 2
  %u604 = load %struct.thing*, %struct.thing** %u603
  %u605 = bitcast %struct.thing* %u604 to i8*
  call void @free(i8* %u605)
  %u606 = load %struct.thing*, %struct.thing** @gs1
  %u607 = bitcast %struct.thing* %u606 to i8*
  call void @free(i8* %u607)
  call void @printgroup(i64 9)
  %u608 = call i8* @malloc(i64 24)
  %u609 = bitcast i8* %u608 to %struct.thing*
  %u610 = add i64 0, 1
  %u611 = getelementptr %struct.thing, %struct.thing* %u609, i32 0, i32 1
  store i64 %u610, i64* %u611
  %u612 = add i64 0, 1
  call void @takealltypes(i64 3, i64 %u612, %struct.thing* %u609)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 2)
  call void @tonofargs(i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 3)
  %u613 = call i64 @returnint(i64 3)
  %u614 = icmp eq i64 %u613, 3
  %u615 = zext i1 %u614 to i64
  %u616 = trunc i64 %u615 to i1
  br i1 %u616, label %LU277, label %LU278
LU277:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU276
LU276:
  %u617 = phi i64 [%u595, %LU277], [%u595, %LU278] 
  %u618 = phi i64 [%u596, %LU277], [%u596, %LU278] 
  %u619 = phi i64 [%u613, %LU277], [%u613, %LU278] 
  %u620 = phi i64 [%u598, %LU277], [%u598, %LU278] 
  %u621 = phi i64 [%u599, %LU277], [%u599, %LU278] 
  %u622 = phi %struct.thing* [%u609, %LU277], [%u609, %LU278] 
  %u623 = phi %struct.thing* [%u601, %LU277], [%u601, %LU278] 
  br label %LU279
LU279:
  %u624 = add i64 0, 1
  %u625 = call i64 @returnbool(i64 %u624)
  %u626 = trunc i64 %u625 to i1
  br i1 %u626, label %LU281, label %LU282
LU281:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU280
LU280:
  %u627 = phi i64 [%u625, %LU281], [%u625, %LU282] 
  %u628 = phi i64 [%u618, %LU281], [%u618, %LU282] 
  %u629 = phi i64 [%u619, %LU281], [%u619, %LU282] 
  %u630 = phi i64 [%u620, %LU281], [%u620, %LU282] 
  %u631 = phi i64 [%u621, %LU281], [%u621, %LU282] 
  %u632 = phi %struct.thing* [%u622, %LU281], [%u622, %LU282] 
  %u633 = phi %struct.thing* [%u623, %LU281], [%u623, %LU282] 
  br label %LU283
LU283:
  %u634 = call i8* @malloc(i64 24)
  %u635 = bitcast i8* %u634 to %struct.thing*
  %u636 = call %struct.thing* @returnstruct(%struct.thing* %u635)
  %u637 = icmp eq %struct.thing* %u635, %u636
  %u638 = zext i1 %u637 to i64
  %u639 = trunc i64 %u638 to i1
  br i1 %u639, label %LU285, label %LU286
LU285:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU284
LU284:
  br label %LU287
LU287:
  call void @printgroup(i64 10)
  br label %LU288
LU288:
  ret i64 0
LU286:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU284
LU282:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU280
LU278:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u613)
  br label %LU276
LU274:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU272
LU270:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  %u647 = load %struct.thing*, %struct.thing** @gs1
  %u648 = getelementptr %struct.thing, %struct.thing* %u647, i32 0, i32 2
  %u649 = load %struct.thing*, %struct.thing** %u648
  %u650 = getelementptr %struct.thing, %struct.thing* %u649, i32 0, i32 0
  %u651 = load i64, i64* %u650
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u651)
  br label %LU268
LU266:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU264
LU262:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  %u652 = load %struct.thing*, %struct.thing** @gs1
  %u653 = getelementptr %struct.thing, %struct.thing* %u652, i32 0, i32 0
  %u654 = load i64, i64* %u653
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u654)
  br label %LU260
LU258:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU256
LU254:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  %u655 = load i64, i64* @gi1
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u655)
  br label %LU252
LU250:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU248
LU246:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU244
LU242:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU240
LU238:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  %u656 = getelementptr %struct.thing, %struct.thing* %u443, i32 0, i32 2
  %u657 = load %struct.thing*, %struct.thing** %u656
  %u658 = getelementptr %struct.thing, %struct.thing* %u657, i32 0, i32 0
  %u659 = load i64, i64* %u658
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u659)
  br label %LU236
LU234:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU232
LU230:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  %u660 = getelementptr %struct.thing, %struct.thing* %u419, i32 0, i32 0
  %u661 = load i64, i64* %u660
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u661)
  br label %LU228
LU226:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u403)
  br label %LU224
LU215:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU213
LU211:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU209
LU207:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU205
LU203:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU201
LU199:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU197
LU195:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU193
LU191:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU189
LU187:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU185
LU183:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  %u662 = sdiv i64 6, 3
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u662)
  br label %LU181
LU179:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  %u663 = sub i64 3, 2
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u663)
  br label %LU177
LU175:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  %u664 = mul i64 2, 3
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u664)
  br label %LU173
LU171:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 0)
  %u665 = add i64 2, 3
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u665)
  br label %LU169
LU167:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU165
LU163:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU161
LU159:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU157
LU155:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU153
LU151:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU149
LU147:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU145
LU143:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU141
LU139:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU137
LU135:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU133
LU131:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU129
LU127:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU125
LU123:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU121
LU119:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU117
LU115:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU113
LU111:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU109
LU107:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 0)
  br label %LU105
LU103:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU101
LU99:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU97
LU95:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 1)
  br label %LU93
}


declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8
