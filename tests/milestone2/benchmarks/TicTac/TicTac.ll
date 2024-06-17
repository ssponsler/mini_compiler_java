target triple="x86_64"
%struct.gameBoard = type {i64, i64, i64, i64, i64, i64, i64, i64, i64}


define void @cleanBoard(%struct.gameBoard* %board)
{
LU2:
  br label %LU3
LU3:
  %u0 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 0
  store i64 0, i64* %u0
  %u1 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 1
  store i64 0, i64* %u1
  %u2 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 2
  store i64 0, i64* %u2
  %u3 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 3
  store i64 0, i64* %u3
  %u4 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 4
  store i64 0, i64* %u4
  %u5 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 5
  store i64 0, i64* %u5
  %u6 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 6
  store i64 0, i64* %u6
  %u7 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 7
  store i64 0, i64* %u7
  %u8 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 8
  store i64 0, i64* %u8
  br label %LU4
LU4:
  ret void
}


define void @printBoard(%struct.gameBoard* %board)
{
LU11:
  br label %LU12
LU12:
  %u9 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 0
  %u10 = load i64, i64* %u9
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u10)
  %u11 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 1
  %u12 = load i64, i64* %u11
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u12)
  %u13 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 2
  %u14 = load i64, i64* %u13
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u14)
  %u15 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 3
  %u16 = load i64, i64* %u15
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u16)
  %u17 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 4
  %u18 = load i64, i64* %u17
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u18)
  %u19 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 5
  %u20 = load i64, i64* %u19
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u20)
  %u21 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 6
  %u22 = load i64, i64* %u21
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u22)
  %u23 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 7
  %u24 = load i64, i64* %u23
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i64 %u24)
  %u25 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 8
  %u26 = load i64, i64* %u25
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u26)
  br label %LU13
LU13:
  ret void
}


define void @printMoveBoard()
{
LU21:
  br label %LU22
LU22:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 123)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 456)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 789)
  br label %LU23
LU23:
  ret void
}


define void @placePiece(%struct.gameBoard* %board, i64 %turn, i64 %placement)
{
LU31:
  br label %LU32
LU32:
  %u27 = icmp eq i64 %placement, 1
  %u28 = zext i1 %u27 to i64
  %u29 = trunc i64 %u28 to i1
  br i1 %u29, label %LU34, label %LU35
LU34:
  %u30 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 0
  store i64 %turn, i64* %u30
  br label %LU33
LU33:
  br label %LU59
LU59:
  ret void
LU35:
  %u34 = icmp eq i64 %placement, 2
  %u35 = zext i1 %u34 to i64
  %u36 = trunc i64 %u35 to i1
  br i1 %u36, label %LU37, label %LU38
LU37:
  %u37 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 1
  store i64 %turn, i64* %u37
  br label %LU36
LU36:
  %u38 = phi %struct.gameBoard* [%board, %LU37], [%u45, %LU39] 
  %u39 = phi i64 [%turn, %LU37], [%u46, %LU39] 
  %u40 = phi i64 [%placement, %LU37], [%u47, %LU39] 
  br label %LU33
LU38:
  %u41 = icmp eq i64 %placement, 3
  %u42 = zext i1 %u41 to i64
  %u43 = trunc i64 %u42 to i1
  br i1 %u43, label %LU40, label %LU41
LU40:
  %u44 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 2
  store i64 %turn, i64* %u44
  br label %LU39
LU39:
  %u45 = phi %struct.gameBoard* [%board, %LU40], [%u52, %LU42] 
  %u46 = phi i64 [%turn, %LU40], [%u53, %LU42] 
  %u47 = phi i64 [%placement, %LU40], [%u54, %LU42] 
  br label %LU36
LU41:
  %u48 = icmp eq i64 %placement, 4
  %u49 = zext i1 %u48 to i64
  %u50 = trunc i64 %u49 to i1
  br i1 %u50, label %LU43, label %LU44
LU43:
  %u51 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 3
  store i64 %turn, i64* %u51
  br label %LU42
LU42:
  %u52 = phi %struct.gameBoard* [%board, %LU43], [%u59, %LU45] 
  %u53 = phi i64 [%turn, %LU43], [%u60, %LU45] 
  %u54 = phi i64 [%placement, %LU43], [%u61, %LU45] 
  br label %LU39
LU44:
  %u55 = icmp eq i64 %placement, 5
  %u56 = zext i1 %u55 to i64
  %u57 = trunc i64 %u56 to i1
  br i1 %u57, label %LU46, label %LU47
LU46:
  %u58 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 4
  store i64 %turn, i64* %u58
  br label %LU45
LU45:
  %u59 = phi %struct.gameBoard* [%board, %LU46], [%u66, %LU48] 
  %u60 = phi i64 [%turn, %LU46], [%u67, %LU48] 
  %u61 = phi i64 [%placement, %LU46], [%u68, %LU48] 
  br label %LU42
LU47:
  %u62 = icmp eq i64 %placement, 6
  %u63 = zext i1 %u62 to i64
  %u64 = trunc i64 %u63 to i1
  br i1 %u64, label %LU49, label %LU50
LU49:
  %u65 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 5
  store i64 %turn, i64* %u65
  br label %LU48
LU48:
  %u66 = phi %struct.gameBoard* [%board, %LU49], [%u73, %LU51] 
  %u67 = phi i64 [%turn, %LU49], [%u74, %LU51] 
  %u68 = phi i64 [%placement, %LU49], [%u75, %LU51] 
  br label %LU45
LU50:
  %u69 = icmp eq i64 %placement, 7
  %u70 = zext i1 %u69 to i64
  %u71 = trunc i64 %u70 to i1
  br i1 %u71, label %LU52, label %LU53
LU52:
  %u72 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 6
  store i64 %turn, i64* %u72
  br label %LU51
LU51:
  %u73 = phi %struct.gameBoard* [%board, %LU52], [%u80, %LU54] 
  %u74 = phi i64 [%turn, %LU52], [%u81, %LU54] 
  %u75 = phi i64 [%placement, %LU52], [%u82, %LU54] 
  br label %LU48
LU53:
  %u76 = icmp eq i64 %placement, 8
  %u77 = zext i1 %u76 to i64
  %u78 = trunc i64 %u77 to i1
  br i1 %u78, label %LU55, label %LU56
LU55:
  %u79 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 7
  store i64 %turn, i64* %u79
  br label %LU54
LU54:
  %u80 = phi %struct.gameBoard* [%board, %LU55], [%u87, %LU57] 
  %u81 = phi i64 [%turn, %LU55], [%u88, %LU57] 
  %u82 = phi i64 [%placement, %LU55], [%u89, %LU57] 
  br label %LU51
LU56:
  %u83 = icmp eq i64 %placement, 9
  %u84 = zext i1 %u83 to i64
  %u85 = trunc i64 %u84 to i1
  br i1 %u85, label %LU58, label %LU57
LU58:
  %u86 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 8
  store i64 %turn, i64* %u86
  br label %LU57
LU57:
  %u87 = phi %struct.gameBoard* [%board, %LU58], [%board, %LU56] 
  %u88 = phi i64 [%turn, %LU58], [%turn, %LU56] 
  %u89 = phi i64 [%placement, %LU58], [%placement, %LU56] 
  br label %LU54
}


define i64 @checkWinner(%struct.gameBoard* %board)
{
LU61:
  br label %LU62
LU62:
  %u90 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 0
  %u91 = load i64, i64* %u90
  %u92 = icmp eq i64 %u91, 1
  %u93 = zext i1 %u92 to i64
  %u94 = trunc i64 %u93 to i1
  br i1 %u94, label %LU64, label %LU63
LU64:
  %u95 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 1
  %u96 = load i64, i64* %u95
  %u97 = icmp eq i64 %u96, 1
  %u98 = zext i1 %u97 to i64
  %u99 = trunc i64 %u98 to i1
  br i1 %u99, label %LU66, label %LU65
LU66:
  %u100 = getelementptr %struct.gameBoard, %struct.gameBoard* %board, i32 0, i32 2
  %u101 = load i64, i64* %u100
  %u102 = icmp eq i64 %u101, 1
  %u103 = zext i1 %u102 to i64
  %u104 = trunc i64 %u103 to i1
  br i1 %u104, label %LU68, label %LU67
LU68:
  ret i64 0
LU67:
  br label %LU65
LU65:
  %u105 = phi %struct.gameBoard* [%board, %LU67], [%board, %LU64] 
  br label %LU63
LU63:
  %u106 = phi %struct.gameBoard* [%u105, %LU65], [%board, %LU62] 
  br label %LU69
LU69:
  %u107 = getelementptr %struct.gameBoard, %struct.gameBoard* %u106, i32 0, i32 0
  %u108 = load i64, i64* %u107
  %u109 = icmp eq i64 %u108, 2
  %u110 = zext i1 %u109 to i64
  %u111 = trunc i64 %u110 to i1
  br i1 %u111, label %LU71, label %LU70
LU71:
  %u112 = getelementptr %struct.gameBoard, %struct.gameBoard* %u106, i32 0, i32 1
  %u113 = load i64, i64* %u112
  %u114 = icmp eq i64 %u113, 2
  %u115 = zext i1 %u114 to i64
  %u116 = trunc i64 %u115 to i1
  br i1 %u116, label %LU73, label %LU72
LU73:
  %u117 = getelementptr %struct.gameBoard, %struct.gameBoard* %u106, i32 0, i32 2
  %u118 = load i64, i64* %u117
  %u119 = icmp eq i64 %u118, 2
  %u120 = zext i1 %u119 to i64
  %u121 = trunc i64 %u120 to i1
  br i1 %u121, label %LU75, label %LU74
LU75:
  ret i64 1
LU74:
  br label %LU72
LU72:
  %u122 = phi %struct.gameBoard* [%u106, %LU74], [%u106, %LU71] 
  br label %LU70
LU70:
  %u123 = phi %struct.gameBoard* [%u122, %LU72], [%u106, %LU69] 
  br label %LU76
LU76:
  %u124 = getelementptr %struct.gameBoard, %struct.gameBoard* %u123, i32 0, i32 3
  %u125 = load i64, i64* %u124
  %u126 = icmp eq i64 %u125, 1
  %u127 = zext i1 %u126 to i64
  %u128 = trunc i64 %u127 to i1
  br i1 %u128, label %LU78, label %LU77
LU78:
  %u129 = getelementptr %struct.gameBoard, %struct.gameBoard* %u123, i32 0, i32 4
  %u130 = load i64, i64* %u129
  %u131 = icmp eq i64 %u130, 1
  %u132 = zext i1 %u131 to i64
  %u133 = trunc i64 %u132 to i1
  br i1 %u133, label %LU80, label %LU79
LU80:
  %u134 = getelementptr %struct.gameBoard, %struct.gameBoard* %u123, i32 0, i32 5
  %u135 = load i64, i64* %u134
  %u136 = icmp eq i64 %u135, 1
  %u137 = zext i1 %u136 to i64
  %u138 = trunc i64 %u137 to i1
  br i1 %u138, label %LU82, label %LU81
LU82:
  ret i64 0
LU81:
  br label %LU79
LU79:
  %u139 = phi %struct.gameBoard* [%u123, %LU81], [%u123, %LU78] 
  br label %LU77
LU77:
  %u140 = phi %struct.gameBoard* [%u139, %LU79], [%u123, %LU76] 
  br label %LU83
LU83:
  %u141 = getelementptr %struct.gameBoard, %struct.gameBoard* %u140, i32 0, i32 3
  %u142 = load i64, i64* %u141
  %u143 = icmp eq i64 %u142, 2
  %u144 = zext i1 %u143 to i64
  %u145 = trunc i64 %u144 to i1
  br i1 %u145, label %LU85, label %LU84
LU85:
  %u146 = getelementptr %struct.gameBoard, %struct.gameBoard* %u140, i32 0, i32 4
  %u147 = load i64, i64* %u146
  %u148 = icmp eq i64 %u147, 2
  %u149 = zext i1 %u148 to i64
  %u150 = trunc i64 %u149 to i1
  br i1 %u150, label %LU87, label %LU86
LU87:
  %u151 = getelementptr %struct.gameBoard, %struct.gameBoard* %u140, i32 0, i32 5
  %u152 = load i64, i64* %u151
  %u153 = icmp eq i64 %u152, 2
  %u154 = zext i1 %u153 to i64
  %u155 = trunc i64 %u154 to i1
  br i1 %u155, label %LU89, label %LU88
LU89:
  ret i64 1
LU88:
  br label %LU86
LU86:
  %u156 = phi %struct.gameBoard* [%u140, %LU88], [%u140, %LU85] 
  br label %LU84
LU84:
  %u157 = phi %struct.gameBoard* [%u156, %LU86], [%u140, %LU83] 
  br label %LU90
LU90:
  %u158 = getelementptr %struct.gameBoard, %struct.gameBoard* %u157, i32 0, i32 6
  %u159 = load i64, i64* %u158
  %u160 = icmp eq i64 %u159, 1
  %u161 = zext i1 %u160 to i64
  %u162 = trunc i64 %u161 to i1
  br i1 %u162, label %LU92, label %LU91
LU92:
  %u163 = getelementptr %struct.gameBoard, %struct.gameBoard* %u157, i32 0, i32 7
  %u164 = load i64, i64* %u163
  %u165 = icmp eq i64 %u164, 1
  %u166 = zext i1 %u165 to i64
  %u167 = trunc i64 %u166 to i1
  br i1 %u167, label %LU94, label %LU93
LU94:
  %u168 = getelementptr %struct.gameBoard, %struct.gameBoard* %u157, i32 0, i32 8
  %u169 = load i64, i64* %u168
  %u170 = icmp eq i64 %u169, 1
  %u171 = zext i1 %u170 to i64
  %u172 = trunc i64 %u171 to i1
  br i1 %u172, label %LU96, label %LU95
LU96:
  ret i64 0
LU95:
  br label %LU93
LU93:
  %u173 = phi %struct.gameBoard* [%u157, %LU95], [%u157, %LU92] 
  br label %LU91
LU91:
  %u174 = phi %struct.gameBoard* [%u173, %LU93], [%u157, %LU90] 
  br label %LU97
LU97:
  %u175 = getelementptr %struct.gameBoard, %struct.gameBoard* %u174, i32 0, i32 6
  %u176 = load i64, i64* %u175
  %u177 = icmp eq i64 %u176, 2
  %u178 = zext i1 %u177 to i64
  %u179 = trunc i64 %u178 to i1
  br i1 %u179, label %LU99, label %LU98
LU99:
  %u180 = getelementptr %struct.gameBoard, %struct.gameBoard* %u174, i32 0, i32 7
  %u181 = load i64, i64* %u180
  %u182 = icmp eq i64 %u181, 2
  %u183 = zext i1 %u182 to i64
  %u184 = trunc i64 %u183 to i1
  br i1 %u184, label %LU101, label %LU100
LU101:
  %u185 = getelementptr %struct.gameBoard, %struct.gameBoard* %u174, i32 0, i32 8
  %u186 = load i64, i64* %u185
  %u187 = icmp eq i64 %u186, 2
  %u188 = zext i1 %u187 to i64
  %u189 = trunc i64 %u188 to i1
  br i1 %u189, label %LU103, label %LU102
LU103:
  ret i64 1
LU102:
  br label %LU100
LU100:
  %u190 = phi %struct.gameBoard* [%u174, %LU102], [%u174, %LU99] 
  br label %LU98
LU98:
  %u191 = phi %struct.gameBoard* [%u190, %LU100], [%u174, %LU97] 
  br label %LU104
LU104:
  %u192 = getelementptr %struct.gameBoard, %struct.gameBoard* %u191, i32 0, i32 0
  %u193 = load i64, i64* %u192
  %u194 = icmp eq i64 %u193, 1
  %u195 = zext i1 %u194 to i64
  %u196 = trunc i64 %u195 to i1
  br i1 %u196, label %LU106, label %LU105
LU106:
  %u197 = getelementptr %struct.gameBoard, %struct.gameBoard* %u191, i32 0, i32 3
  %u198 = load i64, i64* %u197
  %u199 = icmp eq i64 %u198, 1
  %u200 = zext i1 %u199 to i64
  %u201 = trunc i64 %u200 to i1
  br i1 %u201, label %LU108, label %LU107
LU108:
  %u202 = getelementptr %struct.gameBoard, %struct.gameBoard* %u191, i32 0, i32 6
  %u203 = load i64, i64* %u202
  %u204 = icmp eq i64 %u203, 1
  %u205 = zext i1 %u204 to i64
  %u206 = trunc i64 %u205 to i1
  br i1 %u206, label %LU110, label %LU109
LU110:
  ret i64 0
LU109:
  br label %LU107
LU107:
  %u207 = phi %struct.gameBoard* [%u191, %LU109], [%u191, %LU106] 
  br label %LU105
LU105:
  %u208 = phi %struct.gameBoard* [%u207, %LU107], [%u191, %LU104] 
  br label %LU111
LU111:
  %u209 = getelementptr %struct.gameBoard, %struct.gameBoard* %u208, i32 0, i32 0
  %u210 = load i64, i64* %u209
  %u211 = icmp eq i64 %u210, 2
  %u212 = zext i1 %u211 to i64
  %u213 = trunc i64 %u212 to i1
  br i1 %u213, label %LU113, label %LU112
LU113:
  %u214 = getelementptr %struct.gameBoard, %struct.gameBoard* %u208, i32 0, i32 3
  %u215 = load i64, i64* %u214
  %u216 = icmp eq i64 %u215, 2
  %u217 = zext i1 %u216 to i64
  %u218 = trunc i64 %u217 to i1
  br i1 %u218, label %LU115, label %LU114
LU115:
  %u219 = getelementptr %struct.gameBoard, %struct.gameBoard* %u208, i32 0, i32 6
  %u220 = load i64, i64* %u219
  %u221 = icmp eq i64 %u220, 2
  %u222 = zext i1 %u221 to i64
  %u223 = trunc i64 %u222 to i1
  br i1 %u223, label %LU117, label %LU116
LU117:
  ret i64 1
LU116:
  br label %LU114
LU114:
  %u224 = phi %struct.gameBoard* [%u208, %LU116], [%u208, %LU113] 
  br label %LU112
LU112:
  %u225 = phi %struct.gameBoard* [%u224, %LU114], [%u208, %LU111] 
  br label %LU118
LU118:
  %u226 = getelementptr %struct.gameBoard, %struct.gameBoard* %u225, i32 0, i32 1
  %u227 = load i64, i64* %u226
  %u228 = icmp eq i64 %u227, 1
  %u229 = zext i1 %u228 to i64
  %u230 = trunc i64 %u229 to i1
  br i1 %u230, label %LU120, label %LU119
LU120:
  %u231 = getelementptr %struct.gameBoard, %struct.gameBoard* %u225, i32 0, i32 4
  %u232 = load i64, i64* %u231
  %u233 = icmp eq i64 %u232, 1
  %u234 = zext i1 %u233 to i64
  %u235 = trunc i64 %u234 to i1
  br i1 %u235, label %LU122, label %LU121
LU122:
  %u236 = getelementptr %struct.gameBoard, %struct.gameBoard* %u225, i32 0, i32 7
  %u237 = load i64, i64* %u236
  %u238 = icmp eq i64 %u237, 1
  %u239 = zext i1 %u238 to i64
  %u240 = trunc i64 %u239 to i1
  br i1 %u240, label %LU124, label %LU123
LU124:
  ret i64 0
LU123:
  br label %LU121
LU121:
  %u241 = phi %struct.gameBoard* [%u225, %LU123], [%u225, %LU120] 
  br label %LU119
LU119:
  %u242 = phi %struct.gameBoard* [%u241, %LU121], [%u225, %LU118] 
  br label %LU125
LU125:
  %u243 = getelementptr %struct.gameBoard, %struct.gameBoard* %u242, i32 0, i32 1
  %u244 = load i64, i64* %u243
  %u245 = icmp eq i64 %u244, 2
  %u246 = zext i1 %u245 to i64
  %u247 = trunc i64 %u246 to i1
  br i1 %u247, label %LU127, label %LU126
LU127:
  %u248 = getelementptr %struct.gameBoard, %struct.gameBoard* %u242, i32 0, i32 4
  %u249 = load i64, i64* %u248
  %u250 = icmp eq i64 %u249, 2
  %u251 = zext i1 %u250 to i64
  %u252 = trunc i64 %u251 to i1
  br i1 %u252, label %LU129, label %LU128
LU129:
  %u253 = getelementptr %struct.gameBoard, %struct.gameBoard* %u242, i32 0, i32 7
  %u254 = load i64, i64* %u253
  %u255 = icmp eq i64 %u254, 2
  %u256 = zext i1 %u255 to i64
  %u257 = trunc i64 %u256 to i1
  br i1 %u257, label %LU131, label %LU130
LU131:
  ret i64 1
LU130:
  br label %LU128
LU128:
  %u258 = phi %struct.gameBoard* [%u242, %LU130], [%u242, %LU127] 
  br label %LU126
LU126:
  %u259 = phi %struct.gameBoard* [%u258, %LU128], [%u242, %LU125] 
  br label %LU132
LU132:
  %u260 = getelementptr %struct.gameBoard, %struct.gameBoard* %u259, i32 0, i32 2
  %u261 = load i64, i64* %u260
  %u262 = icmp eq i64 %u261, 1
  %u263 = zext i1 %u262 to i64
  %u264 = trunc i64 %u263 to i1
  br i1 %u264, label %LU134, label %LU133
LU134:
  %u265 = getelementptr %struct.gameBoard, %struct.gameBoard* %u259, i32 0, i32 5
  %u266 = load i64, i64* %u265
  %u267 = icmp eq i64 %u266, 1
  %u268 = zext i1 %u267 to i64
  %u269 = trunc i64 %u268 to i1
  br i1 %u269, label %LU136, label %LU135
LU136:
  %u270 = getelementptr %struct.gameBoard, %struct.gameBoard* %u259, i32 0, i32 8
  %u271 = load i64, i64* %u270
  %u272 = icmp eq i64 %u271, 1
  %u273 = zext i1 %u272 to i64
  %u274 = trunc i64 %u273 to i1
  br i1 %u274, label %LU138, label %LU137
LU138:
  ret i64 0
LU137:
  br label %LU135
LU135:
  %u275 = phi %struct.gameBoard* [%u259, %LU137], [%u259, %LU134] 
  br label %LU133
LU133:
  %u276 = phi %struct.gameBoard* [%u275, %LU135], [%u259, %LU132] 
  br label %LU139
LU139:
  %u277 = getelementptr %struct.gameBoard, %struct.gameBoard* %u276, i32 0, i32 2
  %u278 = load i64, i64* %u277
  %u279 = icmp eq i64 %u278, 2
  %u280 = zext i1 %u279 to i64
  %u281 = trunc i64 %u280 to i1
  br i1 %u281, label %LU141, label %LU140
LU141:
  %u282 = getelementptr %struct.gameBoard, %struct.gameBoard* %u276, i32 0, i32 5
  %u283 = load i64, i64* %u282
  %u284 = icmp eq i64 %u283, 2
  %u285 = zext i1 %u284 to i64
  %u286 = trunc i64 %u285 to i1
  br i1 %u286, label %LU143, label %LU142
LU143:
  %u287 = getelementptr %struct.gameBoard, %struct.gameBoard* %u276, i32 0, i32 8
  %u288 = load i64, i64* %u287
  %u289 = icmp eq i64 %u288, 2
  %u290 = zext i1 %u289 to i64
  %u291 = trunc i64 %u290 to i1
  br i1 %u291, label %LU145, label %LU144
LU145:
  ret i64 1
LU144:
  br label %LU142
LU142:
  %u292 = phi %struct.gameBoard* [%u276, %LU144], [%u276, %LU141] 
  br label %LU140
LU140:
  br label %LU146
LU146:
  %u294 = sub i64 0, 1
  ret i64 %u294
}


define i64 @main()
{
LU151:
  br label %LU152
LU152:
  %u295 = sub i64 0, 1
  %u296 = call i8* @malloc(i64 72)
  %u297 = bitcast i8* %u296 to %struct.gameBoard*
  call void @cleanBoard(%struct.gameBoard* %u297)
  %u298 = icmp slt i64 %u295, 0
  %u299 = zext i1 %u298 to i64
  %u300 = icmp ne i64 0, 8
  %u301 = zext i1 %u300 to i64
  %u302 = and i64 %u299, %u301
  %u303 = trunc i64 %u302 to i1
  br i1 %u303, label %LU154, label %LU153
LU154:
  %u304 = phi i64 [0, %LU152], [%u315, %LU159] 
  %u305 = phi i64 [0, %LU152], [%u316, %LU159] 
  %u306 = phi i64 [0, %LU152], [%u317, %LU159] 
  %u307 = phi i64 [%u295, %LU152], [%u321, %LU159] 
  %u308 = phi i64 [0, %LU152], [%u322, %LU159] 
  %u309 = phi %struct.gameBoard* [%u297, %LU152], [%u320, %LU159] 
  call void @printBoard(%struct.gameBoard* %u309)
  %u310 = icmp eq i64 %u304, 0
  %u311 = zext i1 %u310 to i64
  %u312 = trunc i64 %u311 to i1
  br i1 %u312, label %LU156, label %LU157
LU156:
  %u313 = add i64 %u304, 1
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u314 = load i64, i64* @.read_scratch
  call void @placePiece(%struct.gameBoard* %u309, i64 1, i64 %u314)
  br label %LU155
LU155:
  %u315 = phi i64 [%u313, %LU156], [%u336, %LU157] 
  %u316 = phi i64 [%u314, %LU156], [%u305, %LU157] 
  %u317 = phi i64 [%u306, %LU156], [%u337, %LU157] 
  %u318 = phi i64 [%u307, %LU156], [%u307, %LU157] 
  %u319 = phi i64 [%u308, %LU156], [%u308, %LU157] 
  %u320 = phi %struct.gameBoard* [%u309, %LU156], [%u309, %LU157] 
  br label %LU158
LU158:
  %u321 = call i64 @checkWinner(%struct.gameBoard* %u320)
  %u322 = add i64 %u319, 1
  br label %LU159
LU159:
  %u323 = icmp slt i64 %u321, 0
  %u324 = zext i1 %u323 to i64
  %u325 = icmp ne i64 %u322, 8
  %u326 = zext i1 %u325 to i64
  %u327 = and i64 %u324, %u326
  %u328 = trunc i64 %u327 to i1
  br i1 %u328, label %LU154, label %LU153
LU153:
  %u332 = phi i64 [%u321, %LU159], [%u295, %LU152] 
  br label %LU160
LU160:
  %u335 = add i64 %u332, 1
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u335)
  br label %LU161
LU161:
  ret i64 0
LU157:
  %u336 = sub i64 %u304, 1
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u337 = load i64, i64* @.read_scratch
  call void @placePiece(%struct.gameBoard* %u309, i64 2, i64 %u337)
  br label %LU155
}


declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8
