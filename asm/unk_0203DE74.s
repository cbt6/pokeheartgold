	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

	.public gApplication_NewGameFieldsys
gApplication_NewGameFieldsys:
	.word Field_NewGame_AppInit, Field_AppExec, Field_AppExit, 0xFFFFFFFF
	.public gApplication_ContinueFieldsys
gApplication_ContinueFieldsys:
	.word Field_Continue_AppInit, Field_AppExec, Field_AppExit, 0xFFFFFFFF

	.bss

sFieldSysPtr:
	.space 0x4

	.text

	thumb_func_start Field_Continue_AppInit
Field_Continue_AppInit: ; 0x0203DE74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetArgs
	add r4, r0, #0
	add r0, r5, #0
	bl FieldSystem_new
	ldr r1, _0203DEA0 ; =sFieldSysPtr
	str r0, [r1]
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0203DE94
	bl CallFieldTask_ContinueGame_CommError
	b _0203DE98
_0203DE94:
	bl CallFieldTask_ContinueGame_Normal
_0203DE98:
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203DEA0: .word sFieldSysPtr
	thumb_func_end Field_Continue_AppInit

	thumb_func_start Field_NewGame_AppInit
Field_NewGame_AppInit: ; 0x0203DEA4
	push {r3, lr}
	bl FieldSystem_new
	ldr r1, _0203DEB8 ; =sFieldSysPtr
	str r0, [r1]
	bl CallFieldTask_NewGame
	mov r0, #1
	pop {r3, pc}
	nop
_0203DEB8: .word sFieldSysPtr
	thumb_func_end Field_NewGame_AppInit

	thumb_func_start Field_AppExec
Field_AppExec: ; 0x0203DEBC
	push {r3, lr}
	bl OverlayManager_GetData
	bl FieldSys_Main
	cmp r0, #0
	beq _0203DECE
	mov r0, #1
	pop {r3, pc}
_0203DECE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end Field_AppExec

	.public ov60_021EAFE0

	thumb_func_start Field_AppExit
Field_AppExit: ; 0x0203DED4
	push {r3, lr}
	bl FieldSystem_delete
	ldr r0, _0203DEE8 ; =FS_OVERLAY_ID(OVY_60)
	ldr r1, _0203DEEC ; =ov60_021EAFE0
	bl RegisterMainOverlay
	mov r0, #1
	pop {r3, pc}
	nop
_0203DEE8: .word FS_OVERLAY_ID(OVY_60)
_0203DEEC: .word ov60_021EAFE0
	thumb_func_end Field_AppExit

	.public ov01_02206378

	thumb_func_start sub_0203DEF0
sub_0203DEF0: ; 0x0203DEF0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0203DF00
	bl GF_AssertFail
_0203DF00:
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	beq _0203DF0C
	bl GF_AssertFail
_0203DF0C:
	ldr r0, _0203DF2C ; =FS_OVERLAY_ID(field)
	mov r1, #2
	bl HandleLoadOverlay
	mov r1, #0
	str r1, [r4, #0x6c]
	ldr r0, [r4]
	mov r2, #0xb
	str r1, [r0, #8]
	ldr r0, _0203DF30 ; =ov01_02206378
	add r1, r4, #0
	bl OverlayManager_new
	ldr r1, [r4]
	str r0, [r1]
	pop {r4, pc}
	.balign 4, 0
_0203DF2C: .word FS_OVERLAY_ID(field)
_0203DF30: .word ov01_02206378
	thumb_func_end sub_0203DEF0

	thumb_func_start sub_0203DF34
sub_0203DF34: ; 0x0203DF34
	mov r1, #0
	str r1, [r0, #0x6c]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203DF34

	thumb_func_start sub_0203DF3C
sub_0203DF3C: ; 0x0203DF3C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x11
	lsl r0, r0, #4
	ldrb r0, [r4, r0]
	mov r1, #1
	cmp r0, #0
	beq _0203DF52
	cmp r0, #1
	beq _0203DF52
	mov r1, #0
_0203DF52:
	cmp r1, #0
	bne _0203DF5A
	bl GF_AssertFail
_0203DF5A:
	mov r0, #0x11
	lsl r0, r0, #4
	ldrb r0, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203DF3C

	thumb_func_start sub_0203DF64
sub_0203DF64: ; 0x0203DF64
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	beq _0203DF74
	cmp r4, #1
	beq _0203DF74
	bl GF_AssertFail
_0203DF74:
	mov r0, #0x11
	lsl r0, r0, #4
	strb r4, [r5, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203DF64

	thumb_func_start sub_0203DF7C
sub_0203DF7C: ; 0x0203DF7C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	beq _0203DF88
	mov r0, #1
	bx lr
_0203DF88:
	mov r0, #0
	bx lr
	thumb_func_end sub_0203DF7C

	thumb_func_start sub_0203DF8C
sub_0203DF8C: ; 0x0203DF8C
	ldr r1, [r0]
	ldr r1, [r1]
	cmp r1, #0
	beq _0203DF9E
	ldr r0, [r0, #0x6c]
	cmp r0, #0
	beq _0203DF9E
	mov r0, #1
	bx lr
_0203DF9E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203DF8C

	thumb_func_start sub_0203DFA4
sub_0203DFA4: ; 0x0203DFA4
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0203DFB0
	mov r0, #1
	bx lr
_0203DFB0:
	mov r0, #0
	bx lr
	thumb_func_end sub_0203DFA4

	thumb_func_start Fsys_LaunchApplication
Fsys_LaunchApplication: ; 0x0203DFB4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r0, [r0, #4]
	add r6, r2, #0
	cmp r0, #0
	beq _0203DFC8
	bl GF_AssertFail
_0203DFC8:
	add r0, r5, #0
	bl sub_0203DF34
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #0xb
	bl OverlayManager_new
	ldr r1, [r5]
	str r0, [r1, #4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end Fsys_LaunchApplication

	thumb_func_start FieldSystem_new
FieldSystem_new: ; 0x0203DFE0
	push {r4, r5, r6, lr}
	mov r2, #7
	add r5, r0, #0
	mov r0, #3
	mov r1, #0xb
	lsl r2, r2, #0xe
	bl CreateHeap
	mov r1, #0x20
	mov r0, #3
	lsl r2, r1, #9
	bl CreateHeap
	mov r2, #0x57
	mov r0, #0
	mov r1, #0x59
	lsl r2, r2, #4
	bl CreateHeap
	mov r1, #0x4a
	add r0, r5, #0
	lsl r1, r1, #2
	mov r2, #0xb
	bl OverlayManager_CreateAndGetData
	mov r2, #0x4a
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeap
	str r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r0, [r4]
	ldr r6, _0203E054 ; =FS_OVERLAY_ID(OVY_124)
	str r1, [r0, #4]
	ldr r0, [r4]
	str r1, [r0, #8]
	ldr r0, [r4]
	str r1, [r0, #0xc]
	add r0, r6, #0
	mov r1, #2
	bl HandleLoadOverlay
	add r0, r5, #0
	add r1, r4, #0
	bl FieldSystem_init
	add r0, r6, #0
	bl UnloadOverlayByID
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203E054: .word FS_OVERLAY_ID(OVY_124)
	thumb_func_end FieldSystem_new

	thumb_func_start FieldSystem_delete
FieldSystem_delete: ; 0x0203E058
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4, #0x30]
	bl MapMatrix_Free
	add r0, r4, #0
	bl Field_FreeMapEvents
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl sub_02092BD0
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02092DD8
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x59
	bl DestroyHeap
	mov r0, #0xb
	bl DestroyHeap
	mov r0, #0x20
	bl DestroyHeap
	pop {r3, r4, r5, pc}
	thumb_func_end FieldSystem_delete

	thumb_func_start ppOverlayManager_RunFrame_DeleteIfFinished
ppOverlayManager_RunFrame_DeleteIfFinished: ; 0x0203E0AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0203E0C8
	bl OverlayManager_run
	cmp r0, #0
	beq _0203E0C8
	ldr r0, [r4]
	bl OverlayManager_delete
	mov r0, #0
	str r0, [r4]
_0203E0C8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ppOverlayManager_RunFrame_DeleteIfFinished

	thumb_func_start FieldSys_Main
FieldSys_Main: ; 0x0203E0CC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203E15C
	add r0, r4, #0
	bl Fsys_RunTaskFrame
	cmp r0, #1
	bne _0203E0EE
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0203E0EE
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov01_021F6830
_0203E0EE:
	ldr r0, [r4]
	ldr r1, [r0]
	cmp r1, #0
	beq _0203E10A
	bl ppOverlayManager_RunFrame_DeleteIfFinished
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _0203E116
	ldr r0, _0203E138 ; =FS_OVERLAY_ID(field)
	bl UnloadOverlayByID
	b _0203E116
_0203E10A:
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0203E116
	add r0, r0, #4
	bl ppOverlayManager_RunFrame_DeleteIfFinished
_0203E116:
	ldr r1, [r4]
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0203E134
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0203E134
	ldr r0, [r1]
	cmp r0, #0
	bne _0203E134
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _0203E134
	mov r0, #1
	pop {r4, pc}
_0203E134:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0203E138: .word FS_OVERLAY_ID(field)
	thumb_func_end FieldSys_Main

	thumb_func_start sub_0203E13C
sub_0203E13C: ; 0x0203E13C
	push {r3, lr}
	ldr r1, [r0]
	ldr r1, [r1, #8]
	cmp r1, #0
	bne _0203E158
	ldr r1, [r0, #0x6c]
	cmp r1, #0
	beq _0203E158
	bl Fsys_TaskIsRunning
	cmp r0, #0
	bne _0203E158
	mov r0, #1
	pop {r3, pc}
_0203E158:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0203E13C

	thumb_func_start sub_0203E15C
sub_0203E15C: ; 0x0203E15C
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl sub_0203E13C
	add r5, r0, #0
	beq _0203E186
	ldr r0, [r4, #0x40]
	bl sub_0205CE68
	ldr r3, _0203E2EC ; =gSystem
	add r0, sp, #8
	ldr r2, [r3, #0x48]
	ldr r3, [r3, #0x44]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r1, r4, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl ov01_021E6928
_0203E186:
	ldr r0, [r4, #0x20]
	ldr r2, [r4, #0x70]
	ldr r1, [r0]
	ldr r0, _0203E2F0 ; =0x00000109
	cmp r1, r0
	bne _0203E194
	mov r2, #0
_0203E194:
	cmp r2, #2
	beq _0203E1CC
	cmp r2, #3
	beq _0203E1A2
	cmp r2, #4
	beq _0203E1F8
	b _0203E268
_0203E1A2:
	cmp r5, #0
	beq _0203E1C0
	bl sub_02057A0C
	cmp r0, #0
	beq _0203E1BE
	add r0, sp, #8
	add r1, r4, #0
	bl ov01_021E6E00
	cmp r0, #1
	bne _0203E1C0
	mov r5, #0
	b _0203E1C0
_0203E1BE:
	mov r5, #0
_0203E1C0:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020573F0
	add sp, #0x14
	pop {r4, r5, pc}
_0203E1CC:
	cmp r5, #0
	beq _0203E1DC
	add r0, sp, #8
	add r1, r4, #0
	bl ov01_021E6EFC
	cmp r0, #1
	bne _0203E1DE
_0203E1DC:
	b _0203E2E8
_0203E1DE:
	add r3, sp, #8
	ldrh r0, [r3, #8]
	mov r2, #0
	str r0, [sp]
	str r2, [sp, #4]
	ldrh r3, [r3, #6]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x2c]
	sub r2, r2, #1
	bl sub_0205CB48
	add sp, #0x14
	pop {r4, r5, pc}
_0203E1F8:
	cmp r5, #0
	beq _0203E2E8
	add r0, sp, #8
	add r1, r4, #0
	bl ov01_021E6FD4
	cmp r0, #1
	bne _0203E22C
	ldr r0, [r4, #4]
	ldr r0, [r0, #8]
	bl ov01_021EFACC
	add r0, r4, #0
	mov r1, #4
	bl ov01_021F3DFC
	ldr r0, [r4, #0x40]
	bl ov01_021F2F24
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov01_021F6830
	add sp, #0x14
	pop {r4, r5, pc}
_0203E22C:
	ldr r0, _0203E2EC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0203E23E
	ldr r0, [r4, #4]
	ldr r0, [r0, #8]
	bl ov01_021EFACC
_0203E23E:
	mov r5, #0
	bl sub_0203E324
	cmp r0, #0
	beq _0203E24E
	bl ov35_02259DB8
	add r5, r0, #0
_0203E24E:
	add r3, sp, #8
	ldrh r0, [r3, #8]
	mov r2, #0
	mvn r2, r2
	str r0, [sp]
	str r5, [sp, #4]
	ldrh r3, [r3, #6]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x2c]
	bl sub_0205CB48
	add sp, #0x14
	pop {r4, r5, pc}
_0203E268:
	cmp r5, #0
	beq _0203E2E8
	add r0, sp, #8
	add r1, r4, #0
	bl ov01_021E6AF4
	add r5, r0, #0
	beq _0203E2B0
	ldr r0, [r4, #4]
	ldr r0, [r0, #8]
	bl ov01_021EFACC
	add r0, r4, #0
	mov r1, #4
	bl ov01_021F3DFC
	ldr r0, [r4, #0x40]
	bl sub_0205CF44
	ldr r0, [r4, #0x40]
	bl ov01_021F2F24
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov01_021F6830
	cmp r5, #2
	beq _0203E2E8
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02092FA8
	add sp, #0x14
	pop {r4, r5, pc}
_0203E2B0:
	ldr r0, _0203E2EC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0203E2C2
	ldr r0, [r4, #4]
	ldr r0, [r0, #8]
	bl ov01_021EFACC
_0203E2C2:
	mov r5, #0
	bl sub_0203E324
	cmp r0, #0
	beq _0203E2D2
	bl ov35_02259DB8
	add r5, r0, #0
_0203E2D2:
	add r3, sp, #8
	ldrh r0, [r3, #8]
	mov r2, #0
	mvn r2, r2
	str r0, [sp]
	str r5, [sp, #4]
	ldrh r3, [r3, #6]
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x2c]
	bl sub_0205CB48
_0203E2E8:
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_0203E2EC: .word gSystem
_0203E2F0: .word 0x00000109
	thumb_func_end sub_0203E15C

	thumb_func_start sub_0203E2F4
sub_0203E2F4: ; 0x0203E2F4
	ldr r0, _0203E304 ; =sFieldSysPtr
	ldr r3, _0203E308 ; =sub_02037504
	ldr r0, [r0]
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #8]
	bx r3
	nop
_0203E304: .word sFieldSysPtr
_0203E308: .word sub_02037504
	thumb_func_end sub_0203E2F4

	thumb_func_start sub_0203E30C
sub_0203E30C: ; 0x0203E30C
	ldr r0, _0203E31C ; =sFieldSysPtr
	ldr r3, _0203E320 ; =sub_020374E4
	ldr r0, [r0]
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #8]
	bx r3
	nop
_0203E31C: .word sFieldSysPtr
_0203E320: .word sub_020374E4
	thumb_func_end sub_0203E30C

	thumb_func_start sub_0203E324
sub_0203E324: ; 0x0203E324
	ldr r0, _0203E338 ; =sFieldSysPtr
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0203E332
	mov r0, #0
	bx lr
_0203E332:
	ldr r0, [r0, #0x14]
	bx lr
	nop
_0203E338: .word sFieldSysPtr
	thumb_func_end sub_0203E324

	thumb_func_start sub_0203E33C
sub_0203E33C: ; 0x0203E33C
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end sub_0203E33C

	thumb_func_start Fsys_GetBgConfigPtr
Fsys_GetBgConfigPtr: ; 0x0203E340
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end Fsys_GetBgConfigPtr

	thumb_func_start Fsys_GetSaveDataPtr
Fsys_GetSaveDataPtr: ; 0x0203E344
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end Fsys_GetSaveDataPtr

	thumb_func_start sub_0203E348
sub_0203E348: ; 0x0203E348
	push {r3, lr}
	bl LCRandom
	bl LCRandom
	pop {r3, pc}
	thumb_func_end sub_0203E348

	thumb_func_start sub_0203E354
sub_0203E354: ; 0x0203E354
	ldr r0, _0203E364 ; =sFieldSysPtr
	mov r1, #1
	ldr r0, [r0]
	mvn r1, r1
	add r0, #0xc4
	str r1, [r0]
	bx lr
	nop
_0203E364: .word sFieldSysPtr
	thumb_func_end sub_0203E354
