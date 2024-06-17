target triple="x86_64"
%struct.node = type {i64, %struct.node*}
%struct.tnode = type {i64, %struct.tnode*, %struct.tnode*}
%struct.i = type {i64}
%struct.myCopy = type {i64}

@a = common global i64 0, align 8
@b = common global i64 0, align 8
@i = common global %struct.i* null, align 8

define %struct.node* @concatLists(%struct.node* %first, %struct.node* %second)
{
LU2:
  br label %LU3
LU3:
  %u0 = icmp eq %struct.node* %first, null
  %u1 = zext i1 %u0 to i64
  %u2 = trunc i64 %u1 to i1
  br i1 %u2, label %LU5, label %LU4
LU5:
  ret %struct.node* %second
LU4:
  %u3 = getelementptr %struct.node, %struct.node* %first, i32 0, i32 1
  %u4 = load %struct.node*, %struct.node** %u3
  %u5 = icmp ne %struct.node* %u4, null
  %u6 = zext i1 %u5 to i64
  %u7 = trunc i64 %u6 to i1
  br i1 %u7, label %LU8, label %LU7
LU8:
  %u8 = phi %struct.node* [%first, %LU4], [%u8, %LU8] 
  %u9 = phi %struct.node* [%second, %LU4], [%u9, %LU8] 
  %u10 = phi %struct.node* [%first, %LU4], [%u12, %LU8] 
  %u11 = getelementptr %struct.node, %struct.node* %u10, i32 0, i32 1
  %u12 = load %struct.node*, %struct.node** %u11
  %u13 = getelementptr %struct.node, %struct.node* %u12, i32 0, i32 1
  %u14 = load %struct.node*, %struct.node** %u13
  %u15 = icmp ne %struct.node* %u14, null
  %u16 = zext i1 %u15 to i64
  %u17 = trunc i64 %u16 to i1
  br i1 %u17, label %LU8, label %LU7
LU7:
  %u18 = phi %struct.node* [%u8, %LU8], [%first, %LU4] 
  %u19 = phi %struct.node* [%u9, %LU8], [%second, %LU4] 
  %u20 = phi %struct.node* [%u12, %LU8], [%first, %LU4] 
  %u21 = getelementptr %struct.node, %struct.node* %u20, i32 0, i32 1
  store %struct.node* %u19, %struct.node** %u21
  ret %struct.node* %u18
}


define %struct.node* @add(%struct.node* %list, i64 %toAdd)
{
LU21:
  br label %LU22
LU22:
  %u22 = call i8* @malloc(i64 16)
  %u23 = bitcast i8* %u22 to %struct.node*
  %u24 = getelementptr %struct.node, %struct.node* %u23, i32 0, i32 0
  store i64 %toAdd, i64* %u24
  %u25 = getelementptr %struct.node, %struct.node* %u23, i32 0, i32 1
  store %struct.node* %list, %struct.node** %u25
  ret %struct.node* %u23
}


define i64 @size(%struct.node* %list)
{
LU31:
  br label %LU32
LU32:
  %u26 = icmp eq %struct.node* %list, null
  %u27 = zext i1 %u26 to i64
  %u28 = trunc i64 %u27 to i1
  br i1 %u28, label %LU34, label %LU33
LU34:
  ret i64 0
LU33:
  %u29 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 1
  %u30 = load %struct.node*, %struct.node** %u29
  %u31 = call i64 @size(%struct.node* %u30)
  %u32 = add i64 1, %u31
  ret i64 %u32
}


define i64 @get(%struct.node* %list, i64 %index)
{
LU41:
  br label %LU42
LU42:
  %u33 = icmp eq i64 %index, 0
  %u34 = zext i1 %u33 to i64
  %u35 = trunc i64 %u34 to i1
  br i1 %u35, label %LU44, label %LU43
LU44:
  %u36 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 0
  %u37 = load i64, i64* %u36
  ret i64 %u37
LU43:
  %u38 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 1
  %u39 = load %struct.node*, %struct.node** %u38
  %u40 = sub i64 %index, 1
  %u41 = call i64 @get(%struct.node* %u39, i64 %u40)
  ret i64 %u41
}


define %struct.node* @pop(%struct.node* %list)
{
LU51:
  br label %LU52
LU52:
  %u42 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 1
  %u43 = load %struct.node*, %struct.node** %u42
  ret %struct.node* %u43
}


define void @printList(%struct.node* %list)
{
LU61:
  br label %LU62
LU62:
  %u44 = icmp ne %struct.node* %list, null
  %u45 = zext i1 %u44 to i64
  %u46 = trunc i64 %u45 to i1
  br i1 %u46, label %LU64, label %LU63
LU64:
  %u47 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 0
  %u48 = load i64, i64* %u47
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u48)
  %u49 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 1
  %u50 = load %struct.node*, %struct.node** %u49
  call void @printList(%struct.node* %u50)
  br label %LU63
LU63:
  ret void
}


define void @treeprint(%struct.tnode* %root)
{
LU71:
  br label %LU72
LU72:
  %u52 = icmp ne %struct.tnode* %root, null
  %u53 = zext i1 %u52 to i64
  %u54 = trunc i64 %u53 to i1
  br i1 %u54, label %LU74, label %LU73
LU74:
  %u55 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 1
  %u56 = load %struct.tnode*, %struct.tnode** %u55
  call void @treeprint(%struct.tnode* %u56)
  %u57 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 0
  %u58 = load i64, i64* %u57
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u58)
  %u59 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 2
  %u60 = load %struct.tnode*, %struct.tnode** %u59
  call void @treeprint(%struct.tnode* %u60)
  br label %LU73
LU73:
  ret void
}


define void @freeList(%struct.node* %list)
{
LU81:
  br label %LU82
LU82:
  %u62 = icmp ne %struct.node* %list, null
  %u63 = zext i1 %u62 to i64
  %u64 = trunc i64 %u63 to i1
  br i1 %u64, label %LU84, label %LU83
LU84:
  %u65 = getelementptr %struct.node, %struct.node* %list, i32 0, i32 1
  %u66 = load %struct.node*, %struct.node** %u65
  call void @freeList(%struct.node* %u66)
  %u67 = bitcast %struct.node* %list to i8*
  call void @free(i8* %u67)
  br label %LU83
LU83:
  ret void
}


define void @freeTree(%struct.tnode* %root)
{
LU91:
  br label %LU92
LU92:
  %u69 = icmp eq %struct.tnode* %root, null
  %u70 = zext i1 %u69 to i64
  %u71 = xor i64 1, %u70
  %u72 = trunc i64 %u71 to i1
  br i1 %u72, label %LU94, label %LU93
LU94:
  %u73 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 1
  %u74 = load %struct.tnode*, %struct.tnode** %u73
  call void @freeTree(%struct.tnode* %u74)
  %u75 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 2
  %u76 = load %struct.tnode*, %struct.tnode** %u75
  call void @freeTree(%struct.tnode* %u76)
  %u77 = bitcast %struct.tnode* %root to i8*
  call void @free(i8* %u77)
  br label %LU93
LU93:
  ret void
}


define %struct.node* @postOrder(%struct.tnode* %root)
{
LU101:
  br label %LU102
LU102:
  %u79 = icmp ne %struct.tnode* %root, null
  %u80 = zext i1 %u79 to i64
  %u81 = trunc i64 %u80 to i1
  br i1 %u81, label %LU104, label %LU103
LU104:
  %u82 = call i8* @malloc(i64 16)
  %u83 = bitcast i8* %u82 to %struct.node*
  %u84 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 0
  %u85 = load i64, i64* %u84
  %u86 = getelementptr %struct.node, %struct.node* %u83, i32 0, i32 0
  store i64 %u85, i64* %u86
  %u87 = getelementptr %struct.node, %struct.node* %u83, i32 0, i32 1
  store %struct.node* null, %struct.node** %u87
  %u88 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 1
  %u89 = load %struct.tnode*, %struct.tnode** %u88
  %u90 = call %struct.node* @postOrder(%struct.tnode* %u89)
  %u91 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 2
  %u92 = load %struct.tnode*, %struct.tnode** %u91
  %u93 = call %struct.node* @postOrder(%struct.tnode* %u92)
  %u94 = call %struct.node* @concatLists(%struct.node* %u90, %struct.node* %u93)
  %u95 = call %struct.node* @concatLists(%struct.node* %u94, %struct.node* %u83)
  ret %struct.node* %u95
LU103:
  ret %struct.node* null
}


define %struct.tnode* @treeadd(%struct.tnode* %root, i64 %toAdd)
{
LU111:
  br label %LU112
LU112:
  %u96 = icmp eq %struct.tnode* %root, null
  %u97 = zext i1 %u96 to i64
  %u98 = trunc i64 %u97 to i1
  br i1 %u98, label %LU114, label %LU113
LU114:
  %u99 = call i8* @malloc(i64 24)
  %u100 = bitcast i8* %u99 to %struct.tnode*
  %u101 = getelementptr %struct.tnode, %struct.tnode* %u100, i32 0, i32 0
  store i64 %toAdd, i64* %u101
  %u102 = getelementptr %struct.tnode, %struct.tnode* %u100, i32 0, i32 1
  store %struct.tnode* null, %struct.tnode** %u102
  %u103 = getelementptr %struct.tnode, %struct.tnode* %u100, i32 0, i32 2
  store %struct.tnode* null, %struct.tnode** %u103
  ret %struct.tnode* %u100
LU113:
  %u104 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 0
  %u105 = load i64, i64* %u104
  %u106 = icmp slt i64 %toAdd, %u105
  %u107 = zext i1 %u106 to i64
  %u108 = trunc i64 %u107 to i1
  br i1 %u108, label %LU118, label %LU119
LU118:
  %u109 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 1
  %u110 = load %struct.tnode*, %struct.tnode** %u109
  %u111 = call %struct.tnode* @treeadd(%struct.tnode* %u110, i64 %toAdd)
  %u112 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 1
  store %struct.tnode* %u111, %struct.tnode** %u112
  br label %LU117
LU117:
  %u113 = phi %struct.tnode* [%root, %LU118], [%root, %LU119] 
  ret %struct.tnode* %u113
LU119:
  %u116 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 2
  %u117 = load %struct.tnode*, %struct.tnode** %u116
  %u118 = call %struct.tnode* @treeadd(%struct.tnode* %u117, i64 %toAdd)
  %u119 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 2
  store %struct.tnode* %u118, %struct.tnode** %u119
  br label %LU117
}


define %struct.node* @quickSort(%struct.node* %list)
{
LU131:
  br label %LU132
LU132:
  %u120 = call i64 @size(%struct.node* %list)
  %u121 = icmp sle i64 %u120, 1
  %u122 = zext i1 %u121 to i64
  %u123 = trunc i64 %u122 to i1
  br i1 %u123, label %LU134, label %LU133
LU134:
  ret %struct.node* %list
LU133:
  %u124 = call i64 @get(%struct.node* %list, i64 0)
  %u125 = call i64 @size(%struct.node* %list)
  %u126 = sub i64 %u125, 1
  %u127 = call i64 @get(%struct.node* %list, i64 %u126)
  %u128 = add i64 %u124, %u127
  %u129 = sdiv i64 %u128, 2
  %u130 = icmp ne %struct.node* %list, null
  %u131 = zext i1 %u130 to i64
  %u132 = trunc i64 %u131 to i1
  br i1 %u132, label %LU137, label %LU136
LU137:
  %u133 = phi %struct.node* [%list, %LU133], [%u145, %LU138] 
  %u134 = phi i64 [%u129, %LU133], [%u146, %LU138] 
  %u135 = phi i64 [0, %LU133], [%u153, %LU138] 
  %u136 = phi %struct.node* [null, %LU133], [%u148, %LU138] 
  %u137 = phi %struct.node* [null, %LU133], [%u149, %LU138] 
  %u138 = phi %struct.node* [%list, %LU133], [%u152, %LU138] 
  %u139 = call i64 @get(%struct.node* %u133, i64 %u135)
  %u140 = icmp sgt i64 %u139, %u134
  %u141 = zext i1 %u140 to i64
  %u142 = trunc i64 %u141 to i1
  br i1 %u142, label %LU139, label %LU140
LU139:
  %u143 = call i64 @get(%struct.node* %u133, i64 %u135)
  %u144 = call %struct.node* @add(%struct.node* %u137, i64 %u143)
  br label %LU138
LU138:
  %u145 = phi %struct.node* [%u133, %LU139], [%u133, %LU140] 
  %u146 = phi i64 [%u134, %LU139], [%u134, %LU140] 
  %u147 = phi i64 [%u135, %LU139], [%u135, %LU140] 
  %u148 = phi %struct.node* [%u136, %LU139], [%u167, %LU140] 
  %u149 = phi %struct.node* [%u144, %LU139], [%u137, %LU140] 
  %u150 = phi %struct.node* [%u138, %LU139], [%u138, %LU140] 
  %u151 = getelementptr %struct.node, %struct.node* %u150, i32 0, i32 1
  %u152 = load %struct.node*, %struct.node** %u151
  %u153 = add i64 %u147, 1
  %u154 = icmp ne %struct.node* %u152, null
  %u155 = zext i1 %u154 to i64
  %u156 = trunc i64 %u155 to i1
  br i1 %u156, label %LU137, label %LU136
LU136:
  %u157 = phi %struct.node* [%u145, %LU138], [%list, %LU133] 
  %u160 = phi %struct.node* [%u148, %LU138], [null, %LU133] 
  %u161 = phi %struct.node* [%u149, %LU138], [null, %LU133] 
  call void @freeList(%struct.node* %u157)
  %u163 = call %struct.node* @quickSort(%struct.node* %u160)
  %u164 = call %struct.node* @quickSort(%struct.node* %u161)
  %u165 = call %struct.node* @concatLists(%struct.node* %u163, %struct.node* %u164)
  ret %struct.node* %u165
LU140:
  %u166 = call i64 @get(%struct.node* %u133, i64 %u135)
  %u167 = call %struct.node* @add(%struct.node* %u136, i64 %u166)
  br label %LU138
}


define %struct.node* @quickSortMain(%struct.node* %list)
{
LU151:
  br label %LU152
LU152:
  call void @printList(%struct.node* %list)
  %u168 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u168)
  call void @printList(%struct.node* %list)
  %u169 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u169)
  call void @printList(%struct.node* %list)
  %u170 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u170)
  ret %struct.node* null
}


define i64 @treesearch(%struct.tnode* %root, i64 %target)
{
LU161:
  br label %LU162
LU162:
  %u171 = sub i64 0, 1
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u171)
  %u172 = icmp ne %struct.tnode* %root, null
  %u173 = zext i1 %u172 to i64
  %u174 = trunc i64 %u173 to i1
  br i1 %u174, label %LU164, label %LU163
LU164:
  %u175 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 0
  %u176 = load i64, i64* %u175
  %u177 = icmp eq i64 %u176, %target
  %u178 = zext i1 %u177 to i64
  %u179 = trunc i64 %u178 to i1
  br i1 %u179, label %LU166, label %LU165
LU166:
  ret i64 1
LU165:
  %u180 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 1
  %u181 = load %struct.tnode*, %struct.tnode** %u180
  %u182 = call i64 @treesearch(%struct.tnode* %u181, i64 %target)
  %u183 = icmp eq i64 %u182, 1
  %u184 = zext i1 %u183 to i64
  %u185 = trunc i64 %u184 to i1
  br i1 %u185, label %LU169, label %LU168
LU169:
  ret i64 1
LU168:
  %u186 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 2
  %u187 = load %struct.tnode*, %struct.tnode** %u186
  %u188 = call i64 @treesearch(%struct.tnode* %u187, i64 %target)
  %u189 = icmp eq i64 %u188, 1
  %u190 = zext i1 %u189 to i64
  %u191 = trunc i64 %u190 to i1
  br i1 %u191, label %LU172, label %LU173
LU172:
  ret i64 1
LU173:
  ret i64 0
LU163:
  ret i64 0
}


define %struct.node* @inOrder(%struct.tnode* %root)
{
LU181:
  br label %LU182
LU182:
  %u192 = icmp ne %struct.tnode* %root, null
  %u193 = zext i1 %u192 to i64
  %u194 = trunc i64 %u193 to i1
  br i1 %u194, label %LU184, label %LU186
LU184:
  %u195 = call i8* @malloc(i64 16)
  %u196 = bitcast i8* %u195 to %struct.node*
  %u197 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 0
  %u198 = load i64, i64* %u197
  %u199 = getelementptr %struct.node, %struct.node* %u196, i32 0, i32 0
  store i64 %u198, i64* %u199
  %u200 = getelementptr %struct.node, %struct.node* %u196, i32 0, i32 1
  store %struct.node* null, %struct.node** %u200
  %u201 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 1
  %u202 = load %struct.tnode*, %struct.tnode** %u201
  %u203 = call %struct.node* @inOrder(%struct.tnode* %u202)
  %u204 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 2
  %u205 = load %struct.tnode*, %struct.tnode** %u204
  %u206 = call %struct.node* @inOrder(%struct.tnode* %u205)
  %u207 = call %struct.node* @concatLists(%struct.node* %u196, %struct.node* %u206)
  %u208 = call %struct.node* @concatLists(%struct.node* %u203, %struct.node* %u207)
  ret %struct.node* %u208
LU186:
  ret %struct.node* null
}


define i64 @bintreesearch(%struct.tnode* %root, i64 %target)
{
LU191:
  br label %LU192
LU192:
  %u209 = sub i64 0, 1
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u209)
  %u210 = icmp ne %struct.tnode* %root, null
  %u211 = zext i1 %u210 to i64
  %u212 = trunc i64 %u211 to i1
  br i1 %u212, label %LU194, label %LU193
LU194:
  %u213 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 0
  %u214 = load i64, i64* %u213
  %u215 = icmp eq i64 %u214, %target
  %u216 = zext i1 %u215 to i64
  %u217 = trunc i64 %u216 to i1
  br i1 %u217, label %LU196, label %LU195
LU196:
  ret i64 1
LU195:
  %u218 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 0
  %u219 = load i64, i64* %u218
  %u220 = icmp slt i64 %target, %u219
  %u221 = zext i1 %u220 to i64
  %u222 = trunc i64 %u221 to i1
  br i1 %u222, label %LU199, label %LU200
LU199:
  %u223 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 1
  %u224 = load %struct.tnode*, %struct.tnode** %u223
  %u225 = call i64 @bintreesearch(%struct.tnode* %u224, i64 %target)
  ret i64 %u225
LU200:
  %u226 = getelementptr %struct.tnode, %struct.tnode* %root, i32 0, i32 2
  %u227 = load %struct.tnode*, %struct.tnode** %u226
  %u228 = call i64 @bintreesearch(%struct.tnode* %u227, i64 %target)
  ret i64 %u228
LU193:
  ret i64 0
}


define %struct.tnode* @buildTree(%struct.node* %list)
{
LU211:
  br label %LU212
LU212:
  %u229 = call i64 @size(%struct.node* %list)
  %u230 = icmp slt i64 0, %u229
  %u231 = zext i1 %u230 to i64
  %u232 = trunc i64 %u231 to i1
  br i1 %u232, label %LU214, label %LU213
LU214:
  %u233 = phi %struct.node* [%list, %LU212], [%u233, %LU214] 
  %u234 = phi i64 [0, %LU212], [%u238, %LU214] 
  %u235 = phi %struct.tnode* [null, %LU212], [%u237, %LU214] 
  %u236 = call i64 @get(%struct.node* %u233, i64 %u234)
  %u237 = call %struct.tnode* @treeadd(%struct.tnode* %u235, i64 %u236)
  %u238 = add i64 %u234, 1
  %u239 = call i64 @size(%struct.node* %u233)
  %u240 = icmp slt i64 %u238, %u239
  %u241 = zext i1 %u240 to i64
  %u242 = trunc i64 %u241 to i1
  br i1 %u242, label %LU214, label %LU213
LU213:
  %u245 = phi %struct.tnode* [%u237, %LU214], [null, %LU212] 
  ret %struct.tnode* %u245
}


define void @treeMain(%struct.node* %list)
{
LU221:
  br label %LU222
LU222:
  %u246 = call %struct.tnode* @buildTree(%struct.node* %list)
  call void @treeprint(%struct.tnode* %u246)
  %u247 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u247)
  %u248 = call %struct.node* @inOrder(%struct.tnode* %u246)
  call void @printList(%struct.node* %u248)
  %u249 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u249)
  call void @freeList(%struct.node* %u248)
  %u250 = call %struct.node* @postOrder(%struct.tnode* %u246)
  call void @printList(%struct.node* %u250)
  %u251 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u251)
  call void @freeList(%struct.node* %u250)
  %u252 = call i64 @treesearch(%struct.tnode* %u246, i64 0)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u252)
  %u253 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u253)
  %u254 = call i64 @treesearch(%struct.tnode* %u246, i64 10)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u254)
  %u255 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u255)
  %u256 = sub i64 0, 2
  %u257 = call i64 @treesearch(%struct.tnode* %u246, i64 %u256)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u257)
  %u258 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u258)
  %u259 = call i64 @treesearch(%struct.tnode* %u246, i64 2)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u259)
  %u260 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u260)
  %u261 = call i64 @treesearch(%struct.tnode* %u246, i64 3)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u261)
  %u262 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u262)
  %u263 = call i64 @treesearch(%struct.tnode* %u246, i64 9)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u263)
  %u264 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u264)
  %u265 = call i64 @treesearch(%struct.tnode* %u246, i64 1)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u265)
  %u266 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u266)
  %u267 = call i64 @bintreesearch(%struct.tnode* %u246, i64 0)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u267)
  %u268 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u268)
  %u269 = call i64 @bintreesearch(%struct.tnode* %u246, i64 10)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u269)
  %u270 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u270)
  %u271 = sub i64 0, 2
  %u272 = call i64 @bintreesearch(%struct.tnode* %u246, i64 %u271)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u272)
  %u273 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u273)
  %u274 = call i64 @bintreesearch(%struct.tnode* %u246, i64 2)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u274)
  %u275 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u275)
  %u276 = call i64 @bintreesearch(%struct.tnode* %u246, i64 3)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u276)
  %u277 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u277)
  %u278 = call i64 @bintreesearch(%struct.tnode* %u246, i64 9)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u278)
  %u279 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u279)
  %u280 = call i64 @bintreesearch(%struct.tnode* %u246, i64 1)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u280)
  %u281 = sub i64 0, 999
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u281)
  call void @freeTree(%struct.tnode* %u246)
  ret void
}


define %struct.node* @myCopy(%struct.node* %src)
{
LU231:
  br label %LU232
LU232:
  %u282 = icmp eq %struct.node* %src, null
  %u283 = zext i1 %u282 to i64
  %u284 = trunc i64 %u283 to i1
  br i1 %u284, label %LU234, label %LU233
LU234:
  ret %struct.node* null
LU233:
  %u285 = getelementptr %struct.node, %struct.node* %src, i32 0, i32 0
  %u286 = load i64, i64* %u285
  %u287 = call %struct.node* @add(%struct.node* null, i64 %u286)
  %u288 = getelementptr %struct.node, %struct.node* %src, i32 0, i32 1
  %u289 = load %struct.node*, %struct.node** %u288
  %u290 = call %struct.node* @myCopy(%struct.node* %u289)
  %u291 = call %struct.node* @concatLists(%struct.node* %u287, %struct.node* %u290)
  ret %struct.node* %u291
}


define i64 @main()
{
LU241:
  br label %LU242
LU242:
  %u292 = icmp slt i64 0, 10
  %u293 = zext i1 %u292 to i64
  %u294 = trunc i64 %u293 to i1
  br i1 %u294, label %LU244, label %LU243
LU244:
  %u295 = phi i64 [0, %LU242], [%u306, %LU244] 
  %u297 = phi %struct.node* [null, %LU242], [%u302, %LU244] 
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u301 = load i64, i64* @.read_scratch
  %u302 = call %struct.node* @add(%struct.node* %u297, i64 %u301)
  %u303 = call %struct.node* @myCopy(%struct.node* %u302)
  %u304 = call %struct.node* @myCopy(%struct.node* %u302)
  %u305 = call %struct.node* @quickSortMain(%struct.node* %u303)
  call void @freeList(%struct.node* %u305)
  call void @treeMain(%struct.node* %u304)
  %u306 = add i64 %u295, 1
  %u307 = icmp slt i64 %u306, 10
  %u308 = zext i1 %u307 to i64
  %u309 = trunc i64 %u308 to i1
  br i1 %u309, label %LU244, label %LU243
LU243:
  %u312 = phi %struct.node* [%u302, %LU244], [null, %LU242] 
  %u313 = phi %struct.node* [%u303, %LU244], [null, %LU242] 
  %u314 = phi %struct.node* [%u304, %LU244], [null, %LU242] 
  call void @freeList(%struct.node* %u312)
  call void @freeList(%struct.node* %u313)
  call void @freeList(%struct.node* %u314)
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
