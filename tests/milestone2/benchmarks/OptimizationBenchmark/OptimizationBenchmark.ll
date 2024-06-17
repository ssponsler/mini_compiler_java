target triple="x86_64"

@global1 = common global i64 0, align 8
@global2 = common global i64 0, align 8
@global3 = common global i64 0, align 8

define i64 @constantFolding()
{
LU2:
  br label %LU3
LU3:
  %u0 = mul i64 8, 9
  %u1 = sdiv i64 %u0, 4
  %u2 = add i64 %u1, 2
  %u3 = mul i64 5, 8
  %u4 = sub i64 %u2, %u3
  %u5 = add i64 %u4, 9
  %u6 = sub i64 %u5, 12
  %u7 = add i64 %u6, 6
  %u8 = sub i64 %u7, 9
  %u9 = sub i64 %u8, 18
  %u10 = mul i64 23, 3
  %u11 = sdiv i64 %u10, 23
  %u12 = mul i64 %u11, 90
  %u13 = add i64 %u9, %u12
  ret i64 %u13
}


define i64 @constantPropagation()
{
LU11:
  br label %LU12
LU12:
  %u14 = add i64 4, 7
  %u15 = add i64 8, 5
  %u16 = add i64 11, 21
  %u17 = add i64 %u14, %u15
  %u18 = mul i64 %u16, %u17
  %u19 = mul i64 %u15, %u16
  %u20 = add i64 11, %u19
  %u21 = sub i64 %u20, %u18
  %u22 = mul i64 %u16, %u17
  %u23 = sub i64 %u15, %u22
  %u24 = sdiv i64 %u18, %u21
  %u25 = add i64 %u23, %u24
  %u26 = add i64 11, 21
  %u27 = add i64 %u26, %u14
  %u28 = add i64 %u27, %u15
  %u29 = add i64 %u28, %u16
  %u30 = sub i64 %u29, %u17
  %u31 = sub i64 %u30, %u25
  %u32 = add i64 %u31, %u15
  %u33 = sub i64 %u32, 4
  %u34 = sub i64 %u33, 7
  %u35 = add i64 %u18, %u21
  %u36 = sub i64 %u35, %u14
  %u37 = sub i64 %u36, %u15
  %u41 = mul i64 %u21, 8
  %u42 = mul i64 %u41, 5
  %u43 = add i64 %u42, %u34
  %u44 = mul i64 7, 4
  %u45 = mul i64 %u44, 8
  %u46 = sdiv i64 %u45, 11
  %u47 = sub i64 %u46, %u34
  %u48 = add i64 %u16, %u18
  %u49 = add i64 %u48, 8
  %u50 = sub i64 %u49, %u37
  %u54 = mul i64 4, 7
  %u55 = sub i64 %u54, %u18
  %u56 = sub i64 %u55, %u21
  %u57 = sub i64 %u56, %u47
  %u58 = mul i64 %u43, 5
  %u59 = sub i64 %u57, %u58
  %u60 = sub i64 %u34, %u59
  %u61 = sub i64 %u60, %u56
  %u62 = sub i64 %u61, %u30
  %u63 = mul i64 %u37, %u62
  %u64 = add i64 %u63, %u50
  %u65 = sub i64 %u64, %u59
  %u66 = sub i64 %u59, %u62
  %u67 = add i64 %u66, %u65
  %u68 = add i64 %u67, %u18
  ret i64 %u68
}


define i64 @deadCodeElimination()
{
LU21:
  br label %LU22
LU22:
  store i64 11, i64* @global1
  store i64 5, i64* @global1
  store i64 9, i64* @global1
  %u69 = add i64 8, 8
  %u70 = add i64 %u69, 9
  %u71 = add i64 %u70, 3
  %u72 = add i64 %u71, 10
  ret i64 %u72
}


define i64 @sum(i64 %number)
{
LU31:
  br label %LU32
LU32:
  %u73 = icmp sgt i64 %number, 0
  %u74 = zext i1 %u73 to i64
  %u75 = trunc i64 %u74 to i1
  br i1 %u75, label %LU34, label %LU33
LU34:
  %u76 = phi i64 [%number, %LU32], [%u79, %LU34] 
  %u77 = phi i64 [0, %LU32], [%u78, %LU34] 
  %u78 = add i64 %u77, %u76
  %u79 = sub i64 %u76, 1
  %u80 = icmp sgt i64 %u79, 0
  %u81 = zext i1 %u80 to i64
  %u82 = trunc i64 %u81 to i1
  br i1 %u82, label %LU34, label %LU33
LU33:
  %u84 = phi i64 [%u78, %LU34], [0, %LU32] 
  ret i64 %u84
}


define i64 @doesntModifyGlobals()
{
LU41:
  br label %LU42
LU42:
  %u85 = add i64 1, 2
  ret i64 %u85
}


define i64 @interProceduralOptimization()
{
LU51:
  br label %LU52
LU52:
  store i64 1, i64* @global1
  store i64 0, i64* @global2
  store i64 0, i64* @global3
  %u86 = call i64 @sum(i64 100)
  %u87 = load i64, i64* @global1
  %u88 = icmp eq i64 %u87, 1
  %u89 = zext i1 %u88 to i64
  %u90 = trunc i64 %u89 to i1
  br i1 %u90, label %LU54, label %LU55
LU54:
  %u91 = call i64 @sum(i64 10000)
  br label %LU53
LU53:
  %u92 = phi i64 [%u91, %LU54], [%u104, %LU59] 
  ret i64 %u92
LU55:
  %u93 = load i64, i64* @global2
  %u94 = icmp eq i64 %u93, 2
  %u95 = zext i1 %u94 to i64
  %u96 = trunc i64 %u95 to i1
  br i1 %u96, label %LU57, label %LU56
LU57:
  %u97 = call i64 @sum(i64 20000)
  br label %LU56
LU56:
  %u98 = phi i64 [%u97, %LU57], [%u86, %LU55] 
  %u99 = load i64, i64* @global3
  %u100 = icmp eq i64 %u99, 3
  %u101 = zext i1 %u100 to i64
  %u102 = trunc i64 %u101 to i1
  br i1 %u102, label %LU60, label %LU59
LU60:
  %u103 = call i64 @sum(i64 30000)
  br label %LU59
LU59:
  %u104 = phi i64 [%u103, %LU60], [%u98, %LU56] 
  br label %LU53
}


define i64 @commonSubexpressionElimination()
{
LU71:
  br label %LU72
LU72:
  %u105 = mul i64 11, 22
  %u106 = sdiv i64 33, 44
  %u107 = mul i64 55, 66
  %u108 = mul i64 11, 22
  %u109 = sdiv i64 33, 44
  %u110 = add i64 %u108, %u109
  %u111 = mul i64 55, 66
  %u112 = sub i64 %u110, %u111
  %u113 = add i64 %u112, 77
  %u114 = mul i64 11, 22
  %u115 = sdiv i64 33, 44
  %u116 = add i64 %u114, %u115
  %u117 = mul i64 55, 66
  %u118 = sub i64 %u116, %u117
  %u119 = add i64 %u118, 77
  %u120 = mul i64 11, 22
  %u121 = sdiv i64 33, 44
  %u122 = add i64 %u120, %u121
  %u123 = mul i64 55, 66
  %u124 = sub i64 %u122, %u123
  %u125 = add i64 %u124, 77
  %u126 = mul i64 11, 22
  %u127 = sdiv i64 33, 44
  %u128 = add i64 %u126, %u127
  %u129 = mul i64 55, 66
  %u130 = sub i64 %u128, %u129
  %u131 = add i64 %u130, 77
  %u132 = mul i64 11, 22
  %u133 = sdiv i64 33, 44
  %u134 = add i64 %u132, %u133
  %u135 = mul i64 55, 66
  %u136 = sub i64 %u134, %u135
  %u137 = add i64 %u136, 77
  %u138 = mul i64 11, 22
  %u139 = sdiv i64 33, 44
  %u140 = add i64 %u138, %u139
  %u141 = mul i64 55, 66
  %u142 = sub i64 %u140, %u141
  %u143 = add i64 %u142, 77
  %u144 = mul i64 11, 22
  %u145 = sdiv i64 33, 44
  %u146 = add i64 %u144, %u145
  %u147 = mul i64 55, 66
  %u148 = sub i64 %u146, %u147
  %u149 = add i64 %u148, 77
  %u150 = mul i64 11, 22
  %u151 = sdiv i64 33, 44
  %u152 = add i64 %u150, %u151
  %u153 = mul i64 55, 66
  %u154 = sub i64 %u152, %u153
  %u155 = add i64 %u154, 77
  %u156 = mul i64 11, 22
  %u157 = sdiv i64 33, 44
  %u158 = add i64 %u156, %u157
  %u159 = mul i64 55, 66
  %u160 = sub i64 %u158, %u159
  %u161 = add i64 %u160, 77
  %u162 = mul i64 11, 22
  %u163 = sdiv i64 33, 44
  %u164 = add i64 %u162, %u163
  %u165 = mul i64 55, 66
  %u166 = sub i64 %u164, %u165
  %u167 = add i64 %u166, 77
  %u168 = mul i64 11, 22
  %u169 = sdiv i64 33, 44
  %u170 = add i64 %u168, %u169
  %u171 = mul i64 55, 66
  %u172 = sub i64 %u170, %u171
  %u173 = add i64 %u172, 77
  %u174 = mul i64 22, 11
  %u175 = sdiv i64 33, 44
  %u176 = add i64 %u174, %u175
  %u177 = mul i64 55, 66
  %u178 = sub i64 %u176, %u177
  %u179 = add i64 %u178, 77
  %u180 = mul i64 11, 22
  %u181 = sdiv i64 33, 44
  %u182 = add i64 %u180, %u181
  %u183 = mul i64 66, 55
  %u184 = sub i64 %u182, %u183
  %u185 = add i64 %u184, 77
  %u186 = mul i64 11, 22
  %u187 = add i64 77, %u186
  %u188 = sdiv i64 33, 44
  %u189 = add i64 %u187, %u188
  %u190 = mul i64 55, 66
  %u191 = sub i64 %u189, %u190
  %u192 = mul i64 11, 22
  %u193 = sdiv i64 33, 44
  %u194 = add i64 %u192, %u193
  %u195 = mul i64 55, 66
  %u196 = sub i64 %u194, %u195
  %u197 = add i64 %u196, 77
  %u198 = sdiv i64 33, 44
  %u199 = mul i64 11, 22
  %u200 = add i64 %u198, %u199
  %u201 = mul i64 55, 66
  %u202 = sub i64 %u200, %u201
  %u203 = add i64 %u202, 77
  %u204 = add i64 11, 22
  %u205 = add i64 %u204, 33
  %u206 = add i64 %u205, 44
  %u207 = add i64 %u206, 55
  %u208 = add i64 %u207, 66
  %u209 = add i64 %u208, 77
  %u210 = add i64 %u209, %u105
  %u211 = add i64 %u210, %u106
  %u212 = add i64 %u211, %u107
  %u213 = add i64 %u212, %u113
  %u214 = add i64 %u213, %u119
  %u215 = add i64 %u214, %u125
  %u216 = add i64 %u215, %u131
  %u217 = add i64 %u216, %u137
  %u218 = add i64 %u217, %u143
  %u219 = add i64 %u218, %u149
  %u220 = add i64 %u219, %u155
  %u221 = add i64 %u220, %u161
  %u222 = add i64 %u221, %u167
  %u223 = add i64 %u222, %u173
  %u224 = add i64 %u223, %u179
  %u225 = add i64 %u224, %u185
  %u226 = add i64 %u225, %u191
  %u227 = add i64 %u226, %u197
  %u228 = add i64 %u227, %u203
  ret i64 %u228
}


define i64 @hoisting()
{
LU81:
  br label %LU82
LU82:
  %u229 = icmp slt i64 0, 1000000
  %u230 = zext i1 %u229 to i64
  %u231 = trunc i64 %u230 to i1
  br i1 %u231, label %LU84, label %LU83
LU84:
  %u232 = phi i64 [1, %LU82], [%u232, %LU84] 
  %u233 = phi i64 [2, %LU82], [%u233, %LU84] 
  %u234 = phi i64 [3, %LU82], [%u234, %LU84] 
  %u235 = phi i64 [4, %LU82], [%u235, %LU84] 
  %u237 = phi i64 [0, %LU82], [%u237, %LU84] 
  %u240 = phi i64 [0, %LU82], [%u245, %LU84] 
  %u245 = add i64 %u240, 1
  %u246 = icmp slt i64 %u245, 1000000
  %u247 = zext i1 %u246 to i64
  %u248 = trunc i64 %u247 to i1
  br i1 %u248, label %LU84, label %LU83
LU83:
  %u250 = phi i64 [%u233, %LU84], [2, %LU82] 
  ret i64 %u250
}


define i64 @doubleIf()
{
LU91:
  br label %LU92
LU92:
  %u258 = icmp eq i64 1, 1
  %u259 = zext i1 %u258 to i64
  %u260 = trunc i64 %u259 to i1
  br i1 %u260, label %LU94, label %LU93
LU94:
  %u261 = icmp eq i64 1, 1
  %u262 = zext i1 %u261 to i64
  %u263 = trunc i64 %u262 to i1
  br i1 %u263, label %LU96, label %LU97
LU96:
  br label %LU95
LU95:
  br label %LU93
LU93:
  %u271 = phi i64 [50, %LU95], [0, %LU92] 
  ret i64 %u271
LU97:
  br label %LU95
}


define i64 @integerDivide()
{
LU101:
  br label %LU102
LU102:
  %u272 = sdiv i64 3000, 2
  %u273 = mul i64 %u272, 4
  %u274 = sdiv i64 %u273, 8
  %u275 = sdiv i64 %u274, 16
  %u276 = mul i64 %u275, 32
  %u277 = sdiv i64 %u276, 64
  %u278 = mul i64 %u277, 128
  %u279 = sdiv i64 %u278, 4
  ret i64 %u279
}


define i64 @association()
{
LU111:
  br label %LU112
LU112:
  %u280 = mul i64 10, 2
  %u281 = sdiv i64 %u280, 2
  %u282 = mul i64 3, %u281
  %u283 = sdiv i64 %u282, 3
  %u284 = mul i64 %u283, 4
  %u285 = sdiv i64 %u284, 4
  %u286 = add i64 %u285, 4
  %u287 = sub i64 %u286, 4
  %u288 = mul i64 %u287, 50
  %u289 = sdiv i64 %u288, 50
  ret i64 %u289
}


define i64 @tailRecursionHelper(i64 %value, i64 %sum)
{
LU121:
  br label %LU122
LU122:
  %u290 = icmp eq i64 %value, 0
  %u291 = zext i1 %u290 to i64
  %u292 = trunc i64 %u291 to i1
  br i1 %u292, label %LU124, label %LU125
LU124:
  ret i64 %sum
LU125:
  %u293 = sub i64 %value, 1
  %u294 = add i64 %sum, %value
  %u295 = call i64 @tailRecursionHelper(i64 %u293, i64 %u294)
  ret i64 %u295
}


define i64 @tailRecursion(i64 %value)
{
LU131:
  br label %LU132
LU132:
  %u296 = call i64 @tailRecursionHelper(i64 %value, i64 0)
  ret i64 %u296
}


define i64 @unswitching()
{
LU141:
  br label %LU142
LU142:
  %u297 = icmp slt i64 1, 1000000
  %u298 = zext i1 %u297 to i64
  %u299 = trunc i64 %u298 to i1
  br i1 %u299, label %LU144, label %LU143
LU144:
  %u300 = phi i64 [1, %LU142], [%u306, %LU145] 
  %u301 = phi i64 [2, %LU142], [%u307, %LU145] 
  %u302 = icmp eq i64 %u301, 2
  %u303 = zext i1 %u302 to i64
  %u304 = trunc i64 %u303 to i1
  br i1 %u304, label %LU146, label %LU147
LU146:
  %u305 = add i64 %u300, 1
  br label %LU145
LU145:
  %u306 = phi i64 [%u305, %LU146], [%u313, %LU147] 
  %u307 = phi i64 [%u301, %LU146], [%u301, %LU147] 
  %u308 = icmp slt i64 %u306, 1000000
  %u309 = zext i1 %u308 to i64
  %u310 = trunc i64 %u309 to i1
  br i1 %u310, label %LU144, label %LU143
LU143:
  %u311 = phi i64 [%u306, %LU145], [1, %LU142] 
  ret i64 %u311
LU147:
  %u313 = add i64 %u300, 2
  br label %LU145
}


define i64 @randomCalculation(i64 %number)
{
LU151:
  br label %LU152
LU152:
  %u314 = icmp slt i64 0, %number
  %u315 = zext i1 %u314 to i64
  %u316 = trunc i64 %u315 to i1
  br i1 %u316, label %LU154, label %LU153
LU154:
  %u317 = phi i64 [%number, %LU152], [%u317, %LU154] 
  %u323 = phi i64 [0, %LU152], [%u334, %LU154] 
  %u324 = phi i64 [0, %LU152], [%u327, %LU154] 
  %u325 = add i64 4, 7
  %u326 = add i64 %u325, 8
  %u327 = add i64 %u324, %u326
  %u328 = mul i64 %u323, 2
  %u329 = sdiv i64 %u328, 2
  %u330 = mul i64 3, %u329
  %u331 = sdiv i64 %u330, 3
  %u332 = mul i64 %u331, 4
  %u333 = sdiv i64 %u332, 4
  %u334 = add i64 %u333, 1
  %u335 = icmp slt i64 %u334, %u317
  %u336 = zext i1 %u335 to i64
  %u337 = trunc i64 %u336 to i1
  br i1 %u337, label %LU154, label %LU153
LU153:
  %u345 = phi i64 [%u327, %LU154], [0, %LU152] 
  ret i64 %u345
}


define i64 @iterativeFibonacci(i64 %number)
{
LU161:
  br label %LU162
LU162:
  %u346 = sub i64 0, 1
  %u347 = icmp slt i64 0, %number
  %u348 = zext i1 %u347 to i64
  %u349 = trunc i64 %u348 to i1
  br i1 %u349, label %LU164, label %LU163
LU164:
  %u350 = phi i64 [%number, %LU162], [%u350, %LU164] 
  %u351 = phi i64 [%u346, %LU162], [%u352, %LU164] 
  %u352 = phi i64 [1, %LU162], [%u356, %LU164] 
  %u353 = phi i64 [0, %LU162], [%u353, %LU164] 
  %u354 = phi i64 [0, %LU162], [%u357, %LU164] 
  %u356 = add i64 %u352, %u351
  %u357 = add i64 %u354, 1
  %u358 = icmp slt i64 %u357, %u350
  %u359 = zext i1 %u358 to i64
  %u360 = trunc i64 %u359 to i1
  br i1 %u360, label %LU164, label %LU163
LU163:
  %u363 = phi i64 [%u356, %LU164], [1, %LU162] 
  ret i64 %u363
}


define i64 @recursiveFibonacci(i64 %number)
{
LU171:
  br label %LU172
LU172:
  %u367 = icmp sle i64 %number, 0
  %u368 = zext i1 %u367 to i64
  %u369 = icmp eq i64 %number, 1
  %u370 = zext i1 %u369 to i64
  %u371 = or i64 %u368, %u370
  %u372 = trunc i64 %u371 to i1
  br i1 %u372, label %LU174, label %LU175
LU174:
  ret i64 %number
LU175:
  %u373 = sub i64 %number, 1
  %u374 = call i64 @recursiveFibonacci(i64 %u373)
  %u375 = sub i64 %number, 2
  %u376 = call i64 @recursiveFibonacci(i64 %u375)
  %u377 = add i64 %u374, %u376
  ret i64 %u377
}


define i64 @main()
{
LU181:
  br label %LU182
LU182:
  call i64 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
  %u378 = load i64, i64* @.read_scratch
  %u379 = icmp slt i64 1, %u378
  %u380 = zext i1 %u379 to i64
  %u381 = trunc i64 %u380 to i1
  br i1 %u381, label %LU184, label %LU183
LU184:
  %u382 = phi i64 [%u378, %LU182], [%u382, %LU184] 
  %u384 = phi i64 [1, %LU182], [%u402, %LU184] 
  %u385 = call i64 @constantFolding()
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u385)
  %u386 = call i64 @constantPropagation()
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u386)
  %u387 = call i64 @deadCodeElimination()
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u387)
  %u388 = call i64 @interProceduralOptimization()
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u388)
  %u389 = call i64 @commonSubexpressionElimination()
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u389)
  %u390 = call i64 @hoisting()
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u390)
  %u391 = call i64 @doubleIf()
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u391)
  %u392 = call i64 @integerDivide()
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u392)
  %u393 = call i64 @association()
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u393)
  %u394 = sdiv i64 %u382, 1000
  %u395 = call i64 @tailRecursion(i64 %u394)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u395)
  %u396 = call i64 @unswitching()
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u396)
  %u397 = call i64 @randomCalculation(i64 %u382)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u397)
  %u398 = sdiv i64 %u382, 5
  %u399 = call i64 @iterativeFibonacci(i64 %u398)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u399)
  %u400 = sdiv i64 %u382, 1000
  %u401 = call i64 @recursiveFibonacci(i64 %u400)
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 %u401)
  %u402 = add i64 %u384, 1
  %u403 = icmp slt i64 %u402, %u382
  %u404 = zext i1 %u403 to i64
  %u405 = trunc i64 %u404 to i1
  br i1 %u405, label %LU184, label %LU183
LU183:
  call i64 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i64 9999)
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
